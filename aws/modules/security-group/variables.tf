variable "vpc_id" {
  type = string
}

variable "security_group" {
  type = object({
    name = string,
  })
}
