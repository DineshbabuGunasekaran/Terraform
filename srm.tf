resource "aws_instance" "Dinesh" {
  ami           = "ami-0beaa649c482330f7"
  instance_type = "t2.micro"
  tags = {
    Name = "Dinesh"
  }
} 

provider "aws" {

    access_key = "AKIA2VOPYYKRQLO2N4PI"
    secret_key = "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"

    region = "us-east-2"

 


}
resource "aws_key_pair" "dinesh1" {
  key_name   = "my_keypair-us-east-2"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCBGx/UP8hRbGXnkGpzVV4IWg3vPCGFtoLooJPf8PZA0MEWbxKYTSNazjIkhmy49iW9qi8tNL2nLxZkGW278XX63uBmLZZzQsfAgJFd1qkvjoNFLZHPdisG6VFLbHs8XVsSJdl17hdbZn08oIXaYLXS4MkXsh1Jt2Lb9AWnfvrHXIx8jBYfyTuJr6qqc2aYoQRdskRzLYGPZI96En8CzaggpegAgnAZWtT67++yabvZqMoWjhLxhjUmuM+Fw/JG2niOeXMkSAaN8wxhbOBMbhTEHmMkdOoe+2Nn6KNU075CfCWr20MJsQ0/JdMyB84bCeTokKPx2K9yLDQZbJj7ysXN"
}
resource "aws_vpc" "dinesh_vpc" {
  cidr_block = "172.16.0.0/16"

  tags = {
    Name = "dinesh_own"
  }
}

resource "aws_subnet" "dinesh_subnet" {
  vpc_id            = aws_vpc.dinesh_vpc.id
  cidr_block        = "172.16.10.0/24"
  availability_zone = "us-east-2a"

  tags = {
    Name = "dinesh_subnet"
  }
}
resource "aws_instance" "foo" {
  ami           = "ami-0b0dcb5067f052a63" 
  instance_type = "t2.micro"
resource "aws_network_interface" "foo" {
  subnet_id   = aws_subnet.dinesh_subnet.id
  private_ips = ["172.16.10.100"]

  tags = {
    Name = "primary_network_interface"
  }
}
 network_interface {
    network_interface_id = aws_network_interface.foo.id
    device_index         = 0
  }

  credit_specification {
    cpu_credits = "unlimited"
  }
}


