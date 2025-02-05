#RDS Variables 
variable "app_name" {
  default = "test"
  type    = string
}
variable "department" {
  default = "test"
  type    = string
}
variable "env" {
  default = "test"
  type    = string
}
variable "allocated_storage" {
  type        = number
  default     = 20
  description = "value"
}
variable "db_name" {
  type        = string
  default     = "test"
  description = "value"
}
variable "engine" {
  type        = string
  default     = "mysql"
  description = "value"
}
variable "instance_class" {
  type        = string
  default     = "db.t4g.micro"
  description = "value"
}
variable "username" {
  type        = string
  default     = "test"
  description = "value"
}
variable "password" {
  type        = string
  default     = "test1234"
  description = "value"
}
variable "private_subnets" {
  type        = list(string)
  default     = ["test"]
  description = "value"
}
variable "vpc_security_group_ids" {
  type        = list(string)
  default     = ["test"]
  description = "value"
}

