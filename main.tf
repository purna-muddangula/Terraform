# Define the provider
provider "aws" {
  region = "us-west-2"  # Change to your preferred region
}

# Create an S3 bucket
resource "aws_s3_bucket" "my_bucket" {
  bucket = "buckityy"  # Replace with a unique bucket name
  
  tags = {
    Name        = "My S3 Bucket"
    Environment = "Dev"
  }
}


