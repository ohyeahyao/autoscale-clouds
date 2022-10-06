terraform {
  required_version = ">= 1.0.0, < 2.0.0"
  backend "gcs" {
    bucket      = "iac_prod_bucket"
    credentials = "./../../.credentials/prod-gcp-tf-backend.json"
    prefix      = "pdns-infra/aws"
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

locals {
  credential = jsondecode(file(var.credential_file))
}

provider "aws" {
  alias      = "ap_east_1"
  region     = "ap-east-1"
  access_key = local.credential.AccessKeyId
  secret_key = local.credential.SecretAccessKey
}

provider "aws" {
  alias      = "us_east_1"
  region     = "us-east-1"
  access_key = local.credential.AccessKeyId
  secret_key = local.credential.SecretAccessKey
}

provider "aws" {
  region     = "ap-east-1"
  access_key = local.credential.AccessKeyId
  secret_key = local.credential.SecretAccessKey
}
