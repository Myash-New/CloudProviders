variable "token" {
  type        = string
  sensitive   = true
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

variable "image_id" {
  type    = string
  default = "fd827b91d99psvq5fjit"
}

variable "default_zone" {
  type        = string
  default     = "ru-central1-a"
}

variable "ssh_public_key_path" {
  type        = string
  default     = "~/sshkey_terrafrom.pub"
}

variable "bucket_name" {
  type        = string
  default     = "netology-bladurin-160925"
}

#variable "service_account_key_file" {
#  type    = string
#  default = "key.json"
#}
