resource "aws_instance" "web_instance" {
  ami = "ami-0216c817811911143"
  instance_type = "t2.micro"
  key_name = "DevOps-Key"
  vpc_security_group_ids = [ "sg-041b19651b5527db3" ]
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
#   provisioner "remote-exec"{
#     inline = [
#       "sudo useradd -m -p 123 ansible",
#       "sudo sed -i '101i ansible ALL=(ALL)       ALL' /etc/sudoers",
#       "sudo sed -i '112i ansible         ALL=(ALL)       NOPASSWD: ALL' /etc/sudoers",
#       "sudo su",
#       "sudo echo 'PermitRootLogin yes' >> /etc/ssh/sshd_config.d/01-permitrootlogin.conf",
#       "sudo echo 'PasswordAuthentication yes' >> /etc/ssh/sshd_config.d/01-permitrootlogin.conf",
#       "sudo sed -i '38i  PermitRootLogin yes' /etc/ssh/sshd_config",
#       "sudo sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/' /etc/ssh/sshd_config",
#       "sudo systemctl restart sshd",
#     ]
#   }
# }

# sed '/propertie/r file.txt' exam.txt
# root    ALL=(ALL)       ALL
#  jenkins ALL=(ALL)       ALL
# %wheel        ALL=(ALL)       NOPASSWD: ALL
# ansible         ALL=(ALL)       NOPASSWD: ALL
#
# # Allows members of the 'sys' group to run networking, software,

# "sudo echo 'ansible ALL=(ALL)       ALL' >> ansible-v1.txt",
# "sudo sed '/root    ALL=(ALL)       ALL/r ansible-v1.txt' /etc/sudoers",
# "sudo echo 'ansible         ALL=(ALL)       NOPASSWD: ALL' >> ansible-v2.txt",
# "sudo sed '# %wheel        ALL=(ALL)       NOPASSWD: ALL/r ansible-v2.txt' /etc/sudoers",