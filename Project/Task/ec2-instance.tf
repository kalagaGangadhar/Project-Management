resource "aws_instance" "web_instance" {
  ami = "ami-022ce6f32988af5fa"
  instance_type = "t2.micro"
  key_name = "DevOps-Key"
  vpc_security_group_ids = [ "sg-066c96337c17075b2" ]
  tags = {
    Name = "Webserver"
  }
}
