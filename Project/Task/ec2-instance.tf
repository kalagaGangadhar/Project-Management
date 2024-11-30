resource "aws_instance" "web_instance" {
  ami = "ami-022ce6f32988af5fa"
  instance_type = "t2.micro"
  key_name = "DevOps-Key"
  vpc_security_group_ids = [ "sg-066c96337c17075b2" ]
  tags = {
    Name = "Webserver"
  }
  connection {
    type = "ssh"
    host = self.public_ip
    user = "ec2-user"
    private_key = file("~/private_key.pem")

  }
  provisioner "local-exec" {
    command = "echo ${aws_instance.web_instance.public_ip } >> public_ip.txt"
  }
  provisioner "remote-exec"{
    inline = [
    "sudo su -",
    "yum install git -y",
    "sudo useradd -m -s /bin/bash ansible",
    "echo ansible:123 | sudo chpasswd",
    ]
  }
}
