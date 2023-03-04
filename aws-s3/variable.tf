
variable "web_b_name" {
  description = "Name of backend bucket"
  type = string
  default = "mahvish-website"
}

variable "tag_n" {
  description = "Name of tag of S3 `bucket"
  default = "static_website"
} 