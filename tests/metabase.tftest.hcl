mock_provider "aws" {
  alias = "fake"

  mock_data "aws_secretsmanager_secret" {
  defaults = {
    name = "metabase-backend-credentials"
  }
  }

  mock_data "aws_secretsmanager_secret_version" {
    defaults = {
      secret_string = "{\"password\":\"123456789012\"}"
    }
  }

  mock_data "aws_iam_policy_document" {
    defaults = {
      json = "{}"
    }
  }
}

variables {
  region                              = "eu-west-2"
  environment                         = "test"
  metabase_db_credentials_secret_name = "metabase-backend-test-credentials"
  vpc_id                              = "vpc-12345678901234567"
  private_subnet_ids                  = ["subnet-12345678901234567", "subnet-01234567890123456", "subnet-90123456789012345"]
  public_subnet_ids                   = ["subnet-89012345678901234" ,"subnet-78901234567890123", "subnet-67890123456789012"]
}

run "metabase_test" {
  providers = {
    aws = aws.fake
  }

  command = plan

}