provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "react2_app_server" {
  ami           = "ami-0c7217cdde317cfec"
  instance_type = "t2.micro"

  tags = {
    Name = "react2_app_server"
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
    bucket = "dion5-tfstate-bkt" #change this
    key    = "terraform.tfstate"
    region = "us-east-1" 
  }
}