variable "env" {
  type = string
}
variable "app_name" {
  type = string
}
variable "department" {
  type = string
}

variable "bucket_name" {
  description = "Name of the s3 bucket. Must be unique."
  default     = "module-12345678-testbucket"
  type        = string
}

