provider "aws" {
  region = "us-east-2"
}
 
resource "aws_s3_bucket" "example" {
  bucket = "my-test-s3-terraform-bucket"
}