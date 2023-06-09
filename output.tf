
output "instance_public_ip" {
    value = aws_instance.web_server.public_ip
    description = "instance public ip"
}

output instance_public_dns {
    value = aws_instance.web_server.public_dns
    description = "instance public ip"
}