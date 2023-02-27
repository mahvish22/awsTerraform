resource "aws_s3_bucket_acl" "example_bucket_acl" {
  bucket = aws_s3_bucket.static_website.id
  acl    = "public-read"
}
#With routing_rule configured
resource "aws_s3_bucket_website_configuration" "website_config" {
  bucket = aws_s3_bucket.static_website.id

  index_document {
    suffix = "index.html"
  }
  }
  resource "aws_s3_bucket_policy" "allow_read_access" {
  bucket = aws_s3_bucket.static_website.id
  policy = data.aws_iam_policy_document.allow_read_access.json
}

data "aws_iam_policy_document" "allow_read_access" {
  statement {
    principals {
      type        = "AWS"
      identifiers = ["*"]
    }

    actions = [
      "s3:GetObject",
      "s3:ListBucket",
    ]

    resources = [
      aws_s3_bucket.static_website.arn,
      "${aws_s3_bucket.static_website.arn}/*",
    ]
  }
}

resource "aws_s3_bucket" "static_website" {
  bucket = var.website_bucket_name
  
  tags = {
    Name = var.tag_name
    Environment = "production"
  }
force_destroy = true //destroy se bucket even it has object in it
  /* bucket = "${each.key}-${each.value}"
  for_each = {
    dev = "my-dev-bucket"
    prod = "my-prod-bucket"
  }
  tags = {
    "Environment" = "each.key"
  } */
}