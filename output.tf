output "public_ip_of_server" {

    value = aws_instance.Ubuntu.public_ip
  
}