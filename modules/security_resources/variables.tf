#Security Group variables 
variable "app_name" {
  type    = string
  default = "test_app"
}
variable "department" {
  type    = string
  default = "test"
}
variable "ingress_port" {
  type    = number
  default = 8080
}
variable "source_ip_range" {
  type    = string
  default = "0.0.0.0/0"
}
variable "outbound_ip_range" {
  type    = string
  default = "0.0.0.0/0"
}
variable "env" {
  type    = string
  default = "test"
}
variable "description" {
  type    = string
  default = "test"
}

variable "sg_name" {
  type    = string
  default = "test_sg"
}
variable "ingress_protocol" {
  type    = string
  default = "tcp"
}

variable "egress_protocol" {
  type    = string
  default = "-1"
}
variable "ingress_cidr_blocks" {
  description = "List of CIDR blocks for ingress traffic"
  type = list(object({
    cidr_ipv4           = string
    from_port           = number
    to_port             = number
    ip_protocol         = string
    sg_rule_description = string
  }))
  default = [{
    cidr_ipv4           = "0.0.0.0/0"
    from_port           = 80
    to_port             = 80
    ip_protocol         = "tcp"
    sg_rule_description = "http port"
    },
    {
      cidr_ipv4           = "0.0.0.0/0"
      from_port           = 443
      to_port             = 443
      ip_protocol         = "tcp"
      sg_rule_description = "https port"
  }]
}
