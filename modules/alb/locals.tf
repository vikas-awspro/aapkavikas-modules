locals {
  tags = {
    App_Name    = "${var.app_name}",
    Department  = "${var.department}",
    Environment = "${var.env}"
  }
}
