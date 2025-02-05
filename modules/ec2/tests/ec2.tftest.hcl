run "setup_tests" {
  module {
    source = "./tests/setup"
  }
}

run "create_ec2" {
  command = plan
  variables {
    ami                    = run.setup_tests.ami_id
    instance_type          = "t3.micro"
    keyname                = "webserver-us-east-2"
    subnet_id              = run.setup_tests.subnet_id
    vpc_security_group_ids = run.setup_tests.sg_ids
    user_data              = file("./userdata-script.sh")
    ec2_tags = {
      Name = ""
    }
    app_name   = ""
    department = ""
    env        = ""
  }

  # Check that the bucket name is correct
  assert {
    condition     = aws_instance.this.instance_type == "t3.micro"
    error_message = "Invalid instance type"
  }

  # Check index.html hash matches
  /* assert {
    condition     = aws_s3_object.index.etag == filemd5("./www/index.html")
    error_message = "Invalid eTag for index.html"
  }

  # Check error.html hash matches
  assert {
    condition     = aws_s3_object.error.etag == filemd5("./www/error.html")
    error_message = "Invalid eTag for error.html"
  } */
}
