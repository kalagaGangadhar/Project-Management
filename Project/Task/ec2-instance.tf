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
      "sudo useradd -m -p 123 ansible",
      "sudo echo 'ansible ALL=(ALL)       ALL' >> ansible-v1.txt",
      "sudo sed '/root    ALL=(ALL)       ALL/r ansible-v1.txt' visudo",
      "sudo echo 'ansible         ALL=(ALL)       NOPASSWD: ALL' >> ansible-v2.txt",
      "sudo sed '# %wheel        ALL=(ALL)       NOPASSWD: ALL/r ansible-v2.txt' visudo",
    ]
  }
}

#sed '/propertie/r file.txt' exam.txt
#root    ALL=(ALL)       ALL
 #jenkins ALL=(ALL)       ALL
# %wheel        ALL=(ALL)       NOPASSWD: ALL
#ansible         ALL=(ALL)       NOPASSWD: ALL