locals {
  tags = {
    App_Name    = "${var.app_name}",
    Department  = "${var.department}",
    Environment = "${var.env}"
  }

  sg_full_name = "${var.app_name}_${var.sg_name}"
}
