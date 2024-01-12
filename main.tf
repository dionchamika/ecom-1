provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "react9_app_server" {
  ami           = "ami-0c7217cdde317cfec"
  instance_type = "t2.micro"

  tags = {
    Name = "react9_app_server"
  }
}

resource "aws_s3_bucket" "dion5-tfstate-bkt" {
  bucket = "dion5-tfstate-bkt"
  acl    = "private"

  tags = {
    Name = "Terraform State Bucket"
  }
}

terraform {
  backend "s3" {
    bucket         = aws_s3_bucket.dion5-tfstate-bkt.bucket
    key            = "terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
    #dynamodb_table = "terraform-lock"
  }
}
