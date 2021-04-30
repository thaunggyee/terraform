resource "aws_vpc" "vpc" {
  cidr_block = "172.17.0.0/16"

  tags = {
    Name = "terraform"
  }
}

resource "aws_subnet" "subnet" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = "172.17.0.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name = "subnet"
  }
}

resource "aws_network_interface" "foo" {
  subnet_id   = aws_subnet.subnet.id
  private_ips = ["172.17.0.100"]

  tags = {
    Name = "primary_network_interface"
  }
}

resource "aws_instance" "foo" {
  ami           = "ami-042e8287309f5df03" 
  instance_type = "t2.micro"
  key_name = "terraform"
  tags = {
    Name = "simple-ec2"
  }
}
