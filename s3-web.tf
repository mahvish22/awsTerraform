
module "s3-web" {
  source  = "app.terraform.io/terraform_test_cloud/s3-website/aws"
  version = "1.0.0"
  tag_name = var.tag_n
  website_bucket_name = var.web_b_name
}