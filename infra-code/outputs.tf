output "instance_public_ip" {
  value = aws_instance.sinatra_server.public_ip
}
