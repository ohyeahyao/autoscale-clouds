
module "PDNS_PROD_GA_1" {
  source = "../modules/global-accelerator"

  name = "GA-Name"

  regions = [
    {
      name = "us-east-1"
      load_balancers = [
        {
          id     = module.use1_pdns_app.lb_id
          weight = 100
        }
      ]
    }
  ]
}
