module "use1_pdns_app" {
  providers = {
    aws = aws.us_east_1
  }
  source = "../modules/app"

  vpc_id = module.use1_network.vpc.id

  autoscaling_group = {
    name               = "PDNS-use1-prod-tf-ASG"
    launch_template_id = module.use1_pdns_launch_template.launch_template_id
    subnet_ids         = [for subnet_id in module.use1_network.subnet_ids : subnet_id]
    instance_count     = 1
    capacity = {
      min = 1
      max = 5
    }
  }

  simple_scale_in = {
    threshold          = "15"
    evaluation_periods = "5"
    period             = "60"
  }

  simple_scale_out = {
    threshold          = "40"
    evaluation_periods = "2"
    period             = "60"
  }

  scale_out_max = {
    threshold          = "70"
    evaluation_periods = "5"
    period             = "60"
  }
}
