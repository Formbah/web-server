#Create ec2 for web-server
resource "aws_instance" "web_server" {
  ami           = var.ec2_ami
  instance_type = var.ec2_instance_type
  vpc_security_group_ids     = [aws_security_group.web_sg.id]
  associate_public_ip_address = true
  availability_zone = var.azs [0]
  subnet_id = aws_subnet.pub_subnet.id
  key_name            = aws_key_pair.tf_key.key_name

  tags = {
    Name = "web_server"
  }
}
# Create ec2 for app server
resource "aws_instance" "app_server" {
  ami           = var.ec2_ami
  instance_type = var.ec2_instance_type
  vpc_security_group_ids     = [aws_security_group.app_sg.id] 
  associate_public_ip_address = true
  availability_zone = var.azs [1]
  subnet_id = aws_subnet.pri_subnet.id
  key_name            = aws_key_pair.tf_key.key_name

  tags = {
    Name = "app_server"
  }
}