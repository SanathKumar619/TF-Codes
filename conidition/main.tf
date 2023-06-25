provider "aws" {
}

locals {
  common_tags = {
    Name = "sanath"
  }
  time = formatdate("DD MMM YYYY hh:mm ZZZ", timestamp())
}


variable "isdev" {
  type    = string
  default = "true"
}

resource "aws_instance" "dev" {
  ami           = "ami-053b0d53c279acc90"
  instance_type = "t2.micro"
  count         = var.isdev == "true" ? 1 : 0
  tags          = local.common_tags
}

resource "aws_instance" "prod" {
  ami           = "ami-053b0d53c279acc90"
  instance_type = "t2.large"
  count         = var.isdev == "true" ? 0 : 1
}

output "Time" {
  value = local.time
}
