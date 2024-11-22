resource "aws_s3_bucket" "backend" {
  bucket = "backend-projet-aws-s3-bucket-21-11-2024"
  tags = {
    Name        = "backend-proj-aws"
    Environment = "Dev"
  }
}
resource "aws_s3_bucket_versioning" "backend" {
  bucket = aws_s3_bucket.backend.id
  versioning_configuration {
    status = "Enabled"
  }
}
