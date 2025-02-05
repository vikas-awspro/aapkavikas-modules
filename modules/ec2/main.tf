resource "aws_instance" "this" {

  ami                    = var.ami
  instance_type          = var.instance_type
  key_name               = var.keyname
  subnet_id              = var.subnet_id
  vpc_security_group_ids = var.vpc_security_group_ids
  user_data              = file("${path.module}/userdata-script.sh")
  tags                   = merge(local.tags, var.ec2_tags)
  # availability_zone      = var.availability_zone

  /*  provisioner "local-exec" {
    command = "echo ${self.public_ip} >> webserver.txt"
  } */


  /*  connection {
    type        = "ssh"
    user        = "ec2-user"
    private_key = file("./webserver-us-east-2.pem")
    host        = self.public_ip
  } */

  /*  provisioner "remote-exec" {
    inline = [
      "sudo yum update -y",
      "sudo yum install httpd -y",
      "sudo systemctl start httpd",
      "sudo systemctl enable httpd",
      "sudo touch /var/www/html/index.html",
      "sudo echo '<h1>HelloWorldfrom</h1>' > /var/www/html/index.html"

    ]
  } */
}
