run "setup_tests" {
  module {
    source = "./tests/setup"
  }
}

run "create_rds" {
  command = apply
  variables {
    private_subnets        = run.setup_tests.subnet_ids
    vpc_security_group_ids = run.setup_tests.sg_ids
  }

  # Check that the bucket name is correct
  assert {
    condition     = aws_db_instance.this.instance_class == "db.t4g.micro"
    error_message = "Invalid instance type"
  }
}
