variable "AKIA2VOPYYKRQLO2N4PI" {}
variable "twW5Kwas0XF7qKDpsRmlE8K26eOU0QY61K6D6T0/" {}
variable "dinesh1" {}
variable "C:\Users\dell\Desktop.pem" {}
variable "us-east-2"


provider "aws" {
  region  = var.us-east-2
  access_key = var.AKIA2VOPYYKRQLO2N4PI
  secret_key = var.twW5Kwas0XF7qKDpsRmlE8K26eOU0QY61K6D6T0/
}


data "aws_ami" "Dinesh" {
  most_recent = true
  owners      = ["amazon"]

 filter {
    name   = "name"
    values = ["amzn-ami-hvm*"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

resource "aws_instance" "Dinesh" {
  instance_type          = "t2.micro"
  ami                    = "ami-052efd3df9dad4825"
  key_name               = var.dinesh1
  user_data              = file("userdata.tpl")
}  


resource "aws_default_vpc" "default" {

}


resource "aws_security_group" "demo_sg" {
  name        = "demo_sg"
  description = "allow ssh on 22 & http on port 80"
  vpc_id      = aws_default_vpc.default.id

  ingress {
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  ingress {
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }
}



