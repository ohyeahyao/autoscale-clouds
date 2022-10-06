variable "credential_file" {
  type    = string
  default = "./../../.credentials/prod-aws-pdns-svc.json"
}

variable "ssh_devops_public_key_path" {
  default = "./../../files/ssh-devops.pub"
}

variable "user_data_path" {
  default = "./../../files/cloud-init.txt"
}
