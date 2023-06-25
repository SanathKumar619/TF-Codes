provider "aws" {}

resource "aws_instance" "a" {

  ami           = "ami-053b0d53c279acc90"
  instance_type = "t2.micro"
  key_name      = "sanath"


  connection {
    type        = "ssh"
    host        = self.public_ip
    user        = "ubuntu"
    private_key = file("./sanath.pem")
  }

  provisioner "remote-exec" {
    inline = [
      "sudo apt install apache2 -y",
      "sudo apt install unzip -y",
      "sudo systemctl enable apache2",
      "sudo systemctl start apache2",
      "cd /"
    ]
  }
  provisioner "file" {
    source      = "./a.txt"
    destination = "/a.txt"
    on_failure  = continue
  }
}
