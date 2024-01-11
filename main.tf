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

resource "aws_s3_bucket" "dion5-tfstate-bkt" {
  bucket = "dion5-tfstate-bkt"
  acl    = "private"
  tags = {
    Name = "Terraform State Bucket"
  }
}

resource "aws_db_instance" "my_database" {
  identifier           = "my-db-instance"
  allocated_storage    = 20
  storage_type         = "gp2"
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t2.micro"
  name                 = "mydatabase"
  username             = "admin"
  password             = "admin12345"
  
  tags = {
    Name = "MyDatabase"
  }
}
