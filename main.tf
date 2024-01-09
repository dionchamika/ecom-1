provider "aws" {
  region = "us-east-1"  # Adjust region as needed
}

# Create an S3 bucket
resource "aws_s3_bucket" "my_bucket" {
  bucket = "dion-tfstate-bkt"  # Change this to a globally unique name
  acl    = "private"
}
