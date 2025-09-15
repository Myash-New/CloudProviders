# output "nlb_ip" {
#  value = yandex_lb_network_load_balancer.lamb-nlb.listener.external_address_spec.address
#}

output "bucket_url" {
  value       = "https://${yandex_storage_bucket.lamp_bucket.bucket_domain_name}/my-image.jpg"
}

output "vm_ips" {
  value       = [for vm in yandex_compute_instance.lamp_vm : vm.network_interface.0.ip_address]
}