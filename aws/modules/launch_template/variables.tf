variable "security_group_id" {
  type = string
}

variable "launch_template" {
  type = object({
    name          = string
    instance_type = string
    user_data     = string
    image_id      = string
  })
}

variable "devops_public_key" {
  type = string
}
