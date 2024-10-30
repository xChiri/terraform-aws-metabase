# Call the setup module to create a VPC and secret
run "tests_setup" {
  module {
    source = "./tests/setup"
  }

  variables {
    region                              = "eu-west-2"
    metabase_db_credentials_secret_name = "metabase-backend-test-credentials"
  }

}

variables {
  region                              = "eu-west-2"
  environment                         = "test"
  metabase_db_credentials_secret_name = "metabase-backend-test-credentials"
}

run "metabase_test" {
  command = plan

  variables {
    vpc_id             = run.tests_setup.vpc_id
    private_subnet_ids = run.tests_setup.private_subnets
    public_subnet_ids  = run.tests_setup.public_subnets
  }
}