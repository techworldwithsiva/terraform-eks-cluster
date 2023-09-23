module "vpc" {
  source = "git::https://github.com/sivadevopsdaws74s/terraform-aws-vpc-advanced.git"
  project_name = var.project_name #"roboshop" instead of hard coding we are keeping in variables.tf
  cidr_block = var.cidr_block
  common_tags = var.common_tags
  public_subnet_cidr = var.public_subnet_cidr
  private_subnet_cidr = var.private_subnet_cidr
  database_subnet_cidr = var.database_subnet_cidr
}