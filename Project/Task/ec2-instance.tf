resource "aws_instance" "web_instance" {
  ami = "ami-022ce6f32988af5fa"
  instance_type = "t2.micro"
  key_name = "DevOps-Key"
  vpc_security_group_ids = [ "sg-09dd6d33e08227e43" ]
  tags = {
    Name = "Webserver"
  }
}
