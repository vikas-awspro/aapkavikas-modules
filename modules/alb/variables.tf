#ALB Variable 

variable "app_name" {
  type = string
}
variable "security_groups" {

}
variable "env" {
  type = string
}
variable "department" {
  type = string
}
variable "http_port" {
  type = number
}

variable "vpc_id" {
  type = string
}
variable "target_id" {

}

variable "public_subnets" {
  type        = list(string)
  default     = []
  description = "value"
}
