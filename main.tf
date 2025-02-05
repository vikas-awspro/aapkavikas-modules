/* module "webserver" {
  source                 = "./ec2"
  vpc_security_group_ids = [module.web_security_groups.aws_security_group_id]
  ami                    = data.aws_ami.amazon-ami.image_id
  instance_type_prod     = var.instance_type_prod
  instance_type_dev      = var.instance_type_dev
  env                    = var.env
  keyname                = var.keyname
  subnet_id              = var.subnet_id
  app_name               = var.app_name
  department             = var.department
  ec2_tags               = var.ec2_tags
  user_data              = var.user_data

}
module "web_security_groups" {
  source     = "./security_resources"
  app_name   = var.app_name
  department = var.department
  #mysql_port   = var.mysql_port
  ingress_port = var.ingress_port
  #ssh_port          = var.ssh_port
  source_ip_range   = "${data.http.ip.response_body}/32"
  outbound_ip_range = var.outbound_ip_range
  env               = var.env
  description       = "This is Webserver security group to allow inbound connection from source ALB"
  sg_name           = "web_sg"
  ingress_protocol  = var.ingress_protocol
  egress_protocol   = var.egress_protocol
}

module "alb_security_groups" {
  source     = "./security_resources"
  app_name   = var.app_name
  department = var.department
  #mysql_port        = var.mysql_port
  ingress_port = var.http_port
  #ssh_port          = var.ssh_port
  source_ip_range   = "${data.http.ip.response_body}/32"
  outbound_ip_range = var.outbound_ip_range
  env               = var.env
  description       = "This is ALB security group to allow inbound connection from source IP"
  sg_name           = "alb_sg"
  ingress_protocol  = var.ingress_protocol
  egress_protocol   = var.egress_protocol
}

module "rds_security_groups" {
  source     = "./security_resources"
  app_name   = var.app_name
  department = var.department
  #mysql_port        = var.mysql_port
  ingress_port = var.mysql_port
  #ssh_port          = var.ssh_port
  source_ip_range   = "${data.http.ip.response_body}/32"
  outbound_ip_range = var.outbound_ip_range
  env               = var.env
  description       = "This is RDS security group to allow connection from webserver"
  sg_name           = "rds_sg"
  ingress_protocol  = var.ingress_protocol
  egress_protocol   = var.egress_protocol
}

module "alb" {

  source          = "./alb"
  app_name        = var.app_name
  department      = var.department
  env             = var.env
  vpc_id          = var.vpc_id
  http_port       = var.http_port
  security_groups = module.alb_security_groups.aws_security_group_id
  target_id       = module.webserver.aws_instance_id

}

module "static_content" {

  env        = var.env
  app_name   = var.app_name
  department = var.department
  source     = "./static_content"

}

module "rds_instance" {
  source            = "./rds"
  app_name          = var.app_name
  department        = var.department
  env               = var.env
  allocated_storage = var.allocated_storage
  db_name           = var.db_name
  engine            = var.engine
  #engine_version       = "8.0"
  instance_class = var.instance_class
  username       = var.username
  password       = var.password
  #parameter_group_name = "default.mysql8.0"
  db_subnets             = var.db_subnets
  vpc_security_group_ids = module.rds_security_groups.aws_security_group_id

}
 */
