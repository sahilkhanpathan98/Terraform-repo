resource "aws_key_pair" "name" {
    key_name = "public" 
    public_key = file("~/.ssh/id_ed25519.pub") 
#here you need to define public key file path

}

resource "aws_instance" "dev" {
  ami                    = "ami-0d682f26195e9ec0f"
  instance_type          = "t2.micro"
  key_name               = aws_key_pair.name.key_name
  tags = {
    Name="key-tf"
  }
}