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
  
  tags = {
    Name = "Terraform State Bucket"
  }
}

resource "aws_s3_bucket_versioning" "dion5-tfstate-bkt-versioning" {
  bucket = aws_s3_bucket.dion5-tfstate-bkt.bucket
  enabled = true
}


output "instance_id" {
  value = aws_instance.react2_app_server.id
}
