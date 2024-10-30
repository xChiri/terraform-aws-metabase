module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "~> 5.0.0"

  name = "metabase-vpc"
  cidr = "10.0.0.0/16"

  azs             = ["${var.region}a", "${var.region}b", "${var.region}c"]
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  public_subnets  = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]

  enable_nat_gateway      = true
  single_nat_gateway      = true
  one_nat_gateway_per_az  = false
  map_public_ip_on_launch = false
}

resource "aws_secretsmanager_secret" "metabase_db_credentials_secret" {
  name = var.metabase_db_credentials_secret_name
  recovery_window_in_days = 0
}

resource "aws_secretsmanager_secret_version" "metabase_db_credentials_secret_version" {
  secret_id     = aws_secretsmanager_secret.metabase_db_credentials_secret.id
  secret_string = jsonencode({ "password" : "123456789012" })
}
