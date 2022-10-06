resource "aws_autoscaling_group" "default" {
  name = var.autoscaling_group.name

  vpc_zone_identifier = var.autoscaling_group.subnet_ids

  desired_capacity = var.autoscaling_group.instance_count
  min_size         = var.autoscaling_group.capacity.min
  max_size         = var.autoscaling_group.capacity.max

  health_check_grace_period = 180
  health_check_type         = "ELB"

  # NOTE on Auto Scaling Groups and ASG Attachments:
  # https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/autoscaling_group
  lifecycle {
    ignore_changes = [target_group_arns]
  }
  mixed_instances_policy {
    launch_template {
      launch_template_specification {
        launch_template_id = var.autoscaling_group.launch_template_id
      }
    }
  }
}
