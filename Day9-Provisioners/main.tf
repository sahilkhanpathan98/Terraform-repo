# Define the AWS provider
provider "aws" {
  region = "ap-south-1"
}

# Create a key pair
resource "aws_key_pair" "example" {
  key_name   = "task"
  public_key = file("~/.ssh/id_ed25519.pub")  # Ensure this key exists
}

# Create a VPC
resource "aws_vpc" "myvpc" {
  cidr_block = "10.0.0.0/16"
}

# Create a public subnet
resource "aws_subnet" "sub1" {
  vpc_id                  = aws_vpc.myvpc.id
  cidr_block              = "10.0.0.0/24"
  availability_zone       = "ap-south-1a"
  map_public_ip_on_launch = true  # Ensure instance gets a public IP
}

# Internet Gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.myvpc.id
}

# Route Table
resource "aws_route_table" "RT" {
  vpc_id = aws_vpc.myvpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
}

# Associate Route Table with Subnet
resource "aws_route_table_association" "rta1" {
  subnet_id      = aws_subnet.sub1.id
  route_table_id = aws_route_table.RT.id
}

# Security Group allowing SSH and HTTP
resource "aws_security_group" "webSg" {
  name   = "web"
  vpc_id = aws_vpc.myvpc.id

  ingress {
    description = "HTTP from VPC"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Web-sg"
  }
}

# Create an EC2 Instance
resource "aws_instance" "server" {
  ami                    = "ami-0d682f26195e9ec0f"
  instance_type          = "t2.micro"
  key_name               = aws_key_pair.example.key_name
  vpc_security_group_ids = [aws_security_group.webSg.id]
  subnet_id              = aws_subnet.sub1.id
  associate_public_ip_address = true  # Ensure public IP for SSH access

  # SSH Connection Setup
  connection {
    type        = "ssh"
    user        = "ec2-user"
    private_key = file("~/.ssh/id_ed25519")  # Ensure correct private key path
    host        = self.public_ip
  }

  # Local Execution Provisioner (Runs on Local Machine)
  provisioner "local-exec" {
    command = "touch file500"
  }

  # File Provisioner (Copies File to EC2)
  provisioner "file" {
    source      = "file.txt"
    destination = "/home/ubuntu/file.txt"
  }

  # Remote Execution Provisioner (Runs Inside EC2)
  provisioner "remote-exec" {
    inline = [
      "touch /home/ec2-user/file200",
      "echo 'hello from aws' >> /home/ubuntu/file200"
    ]
  }
}
