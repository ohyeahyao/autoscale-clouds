resource "aws_launch_template" "default" {
  name = var.launch_template.name

  network_interfaces {
    associate_public_ip_address = true
    security_groups             = [var.security_group_id]
  }
  update_default_version = true
  image_id               = var.launch_template.image_id

  instance_type = var.launch_template.instance_type

  key_name = aws_key_pair.devops.key_name

  tag_specifications {
    resource_type = "instance"

    tags = {
      Name      = "pdns-tf-autoscaling"
      CreatedBy = "Terraform"
    }
  }

  user_data = base64encode(var.launch_template.user_data)
}
