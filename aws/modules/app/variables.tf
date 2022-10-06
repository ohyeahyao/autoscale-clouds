variable "vpc_id" {
  type = string
}
variable "autoscaling_group" {
  type = object({
    name               = string
    launch_template_id = string
    subnet_ids         = list(string)
    instance_count     = number
    capacity = object({
      min = number
      max = number
    })
  })
}

variable "simple_scale_in" {
  type = object({
    threshold          = string
    evaluation_periods = string
    period             = string
  })
}

variable "simple_scale_out" {
  type = object({
    threshold          = string
    evaluation_periods = string
    period             = string
  })
}

variable "scale_out_max" {
  type = object({
    threshold          = string
    evaluation_periods = string
    period             = string
  })
}
