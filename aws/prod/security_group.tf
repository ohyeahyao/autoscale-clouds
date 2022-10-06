module "use1_security_group" {
  providers = {
    aws = aws.us_east_1
  }

  source = "../modules/security-group"

  vpc_id = module.use1_network.vpc.id

  security_group = {
    name = "PDNS-prod-tf-sg"
  }
}
