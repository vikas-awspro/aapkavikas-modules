#ec2 variables 
variable "ami" {
  type = string
}

variable "instance_type" {
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

variable "user_data" {
  type = string
}
variable "ec2_tags" {
  type = map(any)
}
variable "vpc_security_group_ids" {
  type = list(string)
}


