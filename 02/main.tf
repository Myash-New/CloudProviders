resource "yandex_vpc_network" "default" {
  name = "lamp-net"
}

resource "yandex_vpc_subnet" "public" {
  name           = "public"
  zone           = var.default_zone
  network_id     = yandex_vpc_network.default.id
  v4_cidr_blocks = ["192.168.50.0/24"]
}

# Create Object Storage
resource "yandex_storage_bucket" "lamp_bucket" {
  bucket = var.bucket_name
  acl    = "public-read"
}

# Upload pic to bucket
resource "yandex_storage_object" "image" {
  bucket = yandex_storage_bucket.lamp_bucket.bucket
  key    = "my-image.jpg"
  source = "${path.module}/files/my-image.jpg"
  acl    = "public-read"
}

resource "yandex_compute_instance" "lamp_vm" {
  count       = 3
  name        = "lamp-vm-${count.index + 1}"
  platform_id = "standard-v3"
  zone        = var.default_zone

  resources {
    cores  = 2
    memory = 2
  }

  boot_disk {
    initialize_params {
      image_id = "fd827b91d99psvq5fjit"
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.public.id
    nat       = true
  }

  metadata = {
    ssh-keys = "ubuntu:${file(var.ssh_public_key_path)}"

    user-data = <<-EOF
#!/bin/bash
cat > /var/www/html/index.html << 'EOFHTML'
<!DOCTYPE html>
<html>
<head><title>LAMP VM</title></head>
<body>
  <h1>Welcome to the LAMP server! Netology DevOps Challenge 15.2! </h1>
  <img src="https://${yandex_storage_bucket.lamp_bucket.bucket_domain_name}/my-image.jpg" alt="Picture from bucket" width="400"/>
  <p>The server is running on: <strong><?php echo gethostname(); ?></strong></p>
</body>
</html>
EOFHTML
systemctl restart apache2
EOF
  }
}

resource "yandex_lb_target_group" "lamp_tg" {
  name = "lamp-target-group"

  dynamic "target" {
    for_each = yandex_compute_instance.lamp_vm
    content {
      subnet_id = yandex_vpc_subnet.public.id
      address   = target.value.network_interface.0.ip_address
    }
  }
}

# Network Load Balancer
resource "yandex_lb_network_load_balancer" "nlb" {
  name = "lamp-nlb"

  listener {
    name        = "http-listener"
    port        = 80
    target_port = 80
    protocol    = "tcp"
  }

  attached_target_group {
    target_group_id = yandex_lb_target_group.lamp_tg.id

    healthcheck {
      name = "http-healthcheck"
      http_options {
        port = 80
        path = "/"
      }
      timeout             = 3
      interval            = 10
      healthy_threshold   = 2
      unhealthy_threshold = 2
    }
  }
}