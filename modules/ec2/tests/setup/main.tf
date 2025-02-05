output "ami_id" {
  value = data.aws_ami.amazon-ami.id
}

output "subnet_id" {
  value = element(data.aws_subnets.subnets.ids, 0)

}

output "sg_ids" {
  value = data.aws_security_groups.default.ids
}
