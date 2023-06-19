resource "aws_instance" "Ubuntu" {
    ami = var.ami
    instance_type = "t2.micro"
    key_name = "Devops"
    tags = {
        Name = "ec2_instance"
    }
  
}