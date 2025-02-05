output "aws_instance_id" {
  value = aws_instance.this.id
}

output "webserver_pub_ip" {
  value = aws_instance.this.public_ip
}

output "webserver_priv_ip" {
  value = aws_instance.this.private_ip
}

output "webserver_ami" {
  value = aws_instance.this.ami
}

output "instance_type" {
  value = aws_instance.this.instance_type
}
