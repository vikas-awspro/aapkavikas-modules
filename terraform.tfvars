ami                = "ami-0b4624933067d393a"
instance_type_prod = "t2.micro"
instance_type_dev  = "t2.micro"
env                = "prod"
region             = "us-east-2"
keyname            = "webserver-us-east-2"
subnet_id          = "subnet-08304d6d5fbb5a6d2"
app_name           = "aapkavikas"
department         = "Learning"
vpc_id             = "vpc-049aa74096225273b"
user_data          = "userdata-script.sh"
ingress_port       = 80
http_port          = 80
sg_name            = "test_sg"
ssh_port           = 22
ingress_protocol   = "tcp"
egress_protocol    = "-1"
#source_ip_range          = "117.212.226.22"
outbound_ip_range = "0.0.0.0/0"
ec2_tags = {
  Name = "Webserver"
}

#ALB Variables 
description = "Allow http inbound traffic and all outbound traffic on ALB"
#RDS Variables
allocated_storage = 20
db_name           = "aapkavikasdb"
engine            = "mysql"
instance_class    = "db.t4g.micro"
username          = "vikasadmin"
password          = "admin1234"
db_subnets        = ["subnet-08304d6d5fbb5a6d2", "subnet-0b25e9e99baaa986a", "subnet-0b54a087add13b19a"]
mysql_port        = 3306
