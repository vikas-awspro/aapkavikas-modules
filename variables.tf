variable "ami" {
  type = string
}

variable "instance_type_prod" {
  type = string

}
variable "instance_type_dev" {
  type = string

}

variable "region" {
  type = string

}
variable "env" {
  type = string
}

variable "keyname" {
  type = string
}
variable "subnet_id" {
  type = string

}
variable "app_name" {
  type = string
}
variable "department" {
  type = string
}
variable "vpc_id" {
  type = string
}
variable "user_data" {
  type = string
}

#Security Group variables 
variable "sg_name" {
  type = string
}
variable "ingress_port" {
  type = number
}

variable "http_port" {
  type = number
}
/* variable "source_ip_range" {
  type = string
} */
variable "outbound_ip_range" {
  type = string
}
variable "ssh_port" {
  type = number
}
variable "mysql_port" {
  type = number
}
variable "ec2_tags" {
  type = map(any)
}
variable "ingress_protocol" {
  type = string
}
variable "egress_protocol" {
  type = string
}

# ALB Variables
variable "description" {
  type = string
}

#RDS Variables 

variable "allocated_storage" {}
variable "db_name" {}
variable "engine" {}
#variable "engine_version" {}
variable "instance_class" {}
variable "username" {}
variable "password" {}
#variable "parameter_group_name" {}
variable "db_subnets" {}

