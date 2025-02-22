resource "aws_instance" "teraEc2" {
  ami = "ami-05fa46471b02db0ce"
  instance_type = "t2.micro"
  key_name = "Revisionkeys"
  
  tags = {
    # to give name to the resource in main file
    Name = "hi"
  }
}



