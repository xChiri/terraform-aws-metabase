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
