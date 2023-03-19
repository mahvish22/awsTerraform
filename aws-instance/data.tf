data "vault_aws_access_credentials" "creds" {
  backend = "aws"
  role    = "deployment-role"
  type = "sts"
}