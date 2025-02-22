resource "aws_instance" "teraEc2" {
  ami = var.ami_id
  instance_type = var.instance_type
  key_name = var.key_name
  
  tags = {
    # to give name to the resource in main file
    Name = "hi"
  }
}