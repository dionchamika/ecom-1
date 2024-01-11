provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "react_app_server" {
  ami           = "ami-0c7217cdde317cfec"
  instance_type = "t2.micro"

  tags = {
    Name = "react_app_server"
  }
}

resource "aws_s3_bucket" "dion4-tfstate-bkt" {
  bucket = "dion4-tfstate-bkt"
  acl    = "private"
  tags = {
    Name = "Terraform State Bucket"
  }
}
