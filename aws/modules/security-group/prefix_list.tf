locals {
  allow_ssh_IPs = [
    { cidr : "xx.xx.xx.xx/32", description : "Your IP" },
  ]
}

resource "aws_ec2_managed_prefix_list" "allow_ssh_list" {
  name           = "Allow-SSH-IPs"
  address_family = "IPv4"
  max_entries    = 15

  dynamic "entry" {
    for_each = local.allow_ssh_IPs
    content {
      cidr        = entry.value.cidr
      description = entry.value.description
    }
  }

  tags = {
    Port      = "22",
    CreatedBy = "Terraform"
  }
}
