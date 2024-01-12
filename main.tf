provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "react_app_server" {
  ami           = "ami-0c7217cdde317cfec"
  instance_type = "t2.micro"

  user_data = <<-EOF
              #!/bin/bash
              sudo apt-get update
              sudo apt-get install -y nginx
              git clone https://github.com/dionchamika/ecom-1.git /var/www/html/react_app
              cd /var/www/html/react_app
              npm install
              npm run build
              service nginx start
              EOF

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
