#Security Group
resource "aws_security_group" "this" {
  name        = local.sg_full_name
  description = var.description
  tags        = local.tags
}

#Security Group Rules 
resource "aws_vpc_security_group_ingress_rule" "this" {

  security_group_id = aws_security_group.this.id
  count             = length(var.ingress_cidr_blocks)
  cidr_ipv4         = var.ingress_cidr_blocks[count.index].cidr_ipv4
  from_port         = var.ingress_cidr_blocks[count.index].from_port
  to_port           = var.ingress_cidr_blocks[count.index].to_port
  ip_protocol       = var.ingress_cidr_blocks[count.index].ip_protocol
  description       = var.ingress_cidr_blocks[count.index].sg_rule_description

}


# Security Group Egress Rule 
resource "aws_vpc_security_group_egress_rule" "allow_all_out" {
  security_group_id = aws_security_group.this.id
  cidr_ipv4         = var.outbound_ip_range
  ip_protocol       = var.egress_protocol
}

#Webserver Security Group
/* resource "aws_security_group" "web_sg" {
  name        = "tf-${var.app_name}-web_sg"
  description = "Allow http inbound traffic and all outbound traffic from ALB"
  tags        = local.tags
} 

#Webserver Security Group Rule 
resource "aws_vpc_security_group_ingress_rule" "web_allow_http" {
  security_group_id            = aws_security_group.web_sg.id
  referenced_security_group_id = aws_security_group.alb_sg.id
  from_port                    = var.http_port
  ip_protocol                  = "tcp"
  to_port                      = var.http_port

}

resource "aws_vpc_security_group_ingress_rule" "web_allow_http_local" {
  security_group_id = aws_security_group.web_sg.id
  cidr_ipv4         = "${var.user_ip_range}/32"
  from_port         = var.http_port
  ip_protocol       = "tcp"
  to_port           = var.http_port

}

#Webserver Security Group Ingress Rule 
resource "aws_vpc_security_group_ingress_rule" "web_allow_ssh" {
  security_group_id = aws_security_group.web_sg.id
  cidr_ipv4         = "${var.user_ip_range}/32"
  from_port         = var.ssh_port
  ip_protocol       = "tcp"
  to_port           = var.ssh_port
}

#Webserver Security Group egress Rule 
resource "aws_vpc_security_group_egress_rule" "allow_all_out_web" {
  security_group_id = aws_security_group.web_sg.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = -1
}


# RDS Security Group
resource "aws_security_group" "rds_sg" {
  name        = "tf-${var.app_name}-rds_sg"
  description = "Allow inbound traffic and all outbound traffic on RDS"
  tags        = local.tags
}

# RDS Security Group Rules 
resource "aws_vpc_security_group_ingress_rule" "rds_allow_client" {
  security_group_id = aws_security_group.rds_sg.id

  cidr_ipv4 = "${var.user_ip_range}/32"

  from_port   = var.mysql_port
  ip_protocol = "tcp"
  to_port     = var.mysql_port
}

resource "aws_vpc_security_group_ingress_rule" "rds_allow_web" {
  security_group_id = aws_security_group.rds_sg.id

  referenced_security_group_id = aws_security_group.web_sg.id

  from_port   = var.mysql_port
  ip_protocol = "tcp"
  to_port     = var.mysql_port
}
 */
