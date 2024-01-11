provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "react2_app_server" {
  ami           = "ami-0c7217cdde317cfec"
  instance_type = "t2.micro"

  tags = {
    Name = "react2_app_server"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo apt-get update",
      "sudo apt update",
      "sudo apt-get install -y git",
      "git clone https://github.com/dionchamika/ecom-1.git",
      "cd ecom-1",
      "ls -la",
      # Add any additional commands you need here to host your application
    ]
  }
}
