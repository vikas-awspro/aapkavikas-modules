output "bucket" {
  description = "Bucket Id"

  value = aws_s3_bucket.this.id
}

output "website_endpoint" {
  description = "Website endpoint URL"

  value = "http://${aws_s3_bucket_website_configuration.this.website_endpoint}/index.html"
}
