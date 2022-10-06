variable "name" {
  type = string
}

variable "regions" {
  type = list(object({
    name = string
    load_balancers = list(object({
      id     = string
      weight = number
    }))
  }))
}
