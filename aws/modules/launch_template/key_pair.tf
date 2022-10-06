resource "aws_key_pair" "devops" {
  key_name   = "tf-devops"
  public_key = var.devops_public_key

  tags = {
    CreatedBy = "Terraform"
  }
}
