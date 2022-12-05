resource "aws_instance" "Dinesh" {
  ami           = "ami-0beaa649c482330f7"
  instance_type = "t2.micro"
  tags = {
    Name = "Dinesh"
  }
} 

provider "aws" {

    access_key = "AKIA2VOPYYKR5ZQGYTXZ"
    secret_key = "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"

    region = "us-east-2"

 


}