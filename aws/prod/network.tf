locals {
  network_prefix = "PDNS-PROD-tf"
}

module "use1_network" {
  providers = {
    aws = aws.us_east_1
  }

  source = "../modules/network"

  vpc = {
    name = "${local.network_prefix}-VPC"
    cidr = "10.0.0.0/16"
  }

  internet_gateway_name = lower("${local.network_prefix}-igw")

  subnets = [
    {
      name    = lower("${local.network_prefix}-use1-az1-subnet")
      cidr    = "10.0.96.0/20"
      zone_id = "use1-az1"
    },
    {
      name    = lower("${local.network_prefix}-use1-az2-subnet")
      cidr    = "10.0.112.0/20"
      zone_id = "use1-az2"
    },
    {
      name    = lower("${local.network_prefix}-use1-az3-subnet")
      cidr    = "10.0.128.0/20"
      zone_id = "use1-az3"
    },
    {
      name    = lower("${local.network_prefix}-use1-az4-subnet")
      cidr    = "10.0.144.0/20"
      zone_id = "use1-az4"
    },
    {
      name    = lower("${local.network_prefix}-use1-az5-subnet")
      cidr    = "10.0.160.0/20"
      zone_id = "use1-az5"
    }
  ]
}
