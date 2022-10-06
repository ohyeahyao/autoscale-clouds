locals {
  use1_pdns_launch_template = {
    hostname_prefix = "prod-use1-aws-pdns"
    instance_type   = "c5.2xlarge",
    image_version   = "0.0.1"
  }
}

data "aws_ami" "use1_image" {
  provider    = aws.us_east_1
  owners      = ["self"]
  most_recent = true
  name_regex  = "^PDNS-Image-${local.use1_pdns_launch_template.image_version}"
}

module "use1_pdns_launch_template" {
  providers = {
    aws = aws.us_east_1
  }
  source = "../modules/launch_template"

  security_group_id = module.use1_security_group.security_group.id

  launch_template = {
    name          = "PDNS-use1-prod-LT"
    instance_type = local.use1_pdns_launch_template.instance_type
    image_id      = data.aws_ami.use1_image.image_id
    user_data     = replace(file(var.user_data_path), "__HOSTNAME_PREFIX__", local.use1_pdns_launch_template.hostname_prefix),
  }

  devops_public_key = file(var.ssh_devops_public_key_path)
}
