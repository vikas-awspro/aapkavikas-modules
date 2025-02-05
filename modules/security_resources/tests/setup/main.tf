

output "subnet_ids" {
  value = data.aws_subnets.subnets.ids

}

output "sg_ids" {
  value = data.aws_security_groups.default.ids
}
