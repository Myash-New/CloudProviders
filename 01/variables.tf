variable "token" {
  type        = string
  description = "OAuth-token; https://cloud.yandex.ru/docs/iam/concepts/authorization/oauth-token"
}

variable "cloud_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
}

variable "folder_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
}

variable "default_zone" {
  type        = string
  default     = "ru-central1-a"
}

variable "public_subnet_cidr" {
  type        = string
  default     = "192.168.10.0/24"
}

variable "private_subnet_cidr" {
  type        = string
  default     = "192.168.20.0/24"
}

variable "nat_instance_internal_ip" {
  type        = string
  default     = "192.168.10.254"
}

variable "nat_image_id" {
  type        = string
  default     = "fd80mrhj8fl2oe87o4e1" # Пример ID образа для NAT
}

variable "vm_image_id" {
  type        = string
  default     = "fd80mrhj8fl2oe87o4e1" # Пример ID образа Ubuntu
}

variable "ssh_public_key_path" {
  type        = string
  default     = "~/sshkey_terrafrom.pub"
}