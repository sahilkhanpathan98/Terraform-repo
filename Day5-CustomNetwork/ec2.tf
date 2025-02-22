resource "aws_instance" "teraEc2" {
  ami = "ami-05fa46471b02db0ce"
  instance_type = "t2.micro"
  key_name = "Revisionkeys"
  vpc_security_group_ids = [ aws_security_group.Cus-SG.id ]
  subnet_id = aws_subnet.sub1.id
 associate_public_ip_address = true
  tags = {
    Name = "teraec2" 
  }
}