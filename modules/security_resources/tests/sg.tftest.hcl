run "create_sg" {
  command = apply

  # Check that the bucket name is correct
  assert {
    condition     = aws_security_group.this.name == "test_app_test_sg"
    error_message = "Invalid Security Group name"
  }
}
