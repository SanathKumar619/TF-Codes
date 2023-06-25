provider "aws" {}

resource "aws_eip" "b" {

  vpc = true
}

resource "aws_security_group" "a" {

  name = "tf-sg"
  ingress {
    description = "TLS from VPC"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["${aws_eip.b.public_ip}/32"]
  }
}
resource "aws_instance" "n" {

  ami           = "ami-022e1a32d3f742bd8"
  instance_type = "t2.micro"
  tags = {
    Name = var.name
  }
  vpc_security_group_ids = [aws_security_group.a.id]
}

resource "aws_eip_association" "c" {
  instance_id   = aws_instance.n.id
  allocation_id = aws_eip.b.id
}
