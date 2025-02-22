terraform {
  backend "s3" {
    bucket = "Bucket name"
    key    = "terraform.tfstate"
    region = "ap-south-1"
  }
}
