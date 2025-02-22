provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "name" {
  tags = {
    Name= "sdeddddddddd"
  }
  ami = "ami-0c50b6f7dc3701ddd"
  instance_type = "t2.nano"
  key_name = "Revisionkeys"
}

resource "aws_s3_bucket" "dependent" {
   bucket = "acchaky"
   depends_on = [ aws_instance.name ]
}

