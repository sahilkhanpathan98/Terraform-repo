resource "aws_instance" "name" {
  tags = {
    Name= "sdeddddddddd"
  }
  ami = "ami-0c50b6f7dc3701ddd"
  instance_type = "t2.nano"
  key_name = "Revisionkeys"
}