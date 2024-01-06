provider "aws" {
  region = "us-east-1"  # Adjust region as needed
}

resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
  # Add necessary configurations
}

resource "aws_instance" "web" {
  ami           = "ami-0c55b159cbfafe1f0"  # Choose an AMI
  instance_type = "t2.micro"
  # Add necessary configurations
}

resource "aws_db_instance" "main" {
  identifier           = "mydbinstance"
  allocated_storage    = 20
  instance_class       = "db.t2.micro"
  # Add necessary configurations
}
