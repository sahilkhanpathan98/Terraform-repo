#Create VPC

resource "aws_vpc" "cus-vpc" {
  tags = {
    Name="cust-vpc"
  }
  cidr_block = "10.0.0.0/16"
}

# Step 2 – Create Internet Gateway and attach to vpc

resource "aws_internet_gateway" "cust-IG" {
  tags = {
    Name = "cust-IG"
  }
  vpc_id = aws_vpc.cus-vpc.id
}


#Step 3  - Create Subnet and add VPC Id under it 

resource "aws_subnet" "sub1" {
  vpc_id = aws_vpc.cus-vpc.id
  tags = {
    Name = "sub1"
  }
  cidr_block = "10.0.1.0/24"
}

# Step 4 – Create Route Table and Edit routs and the Subnet Association

resource "aws_route_table" "cust-RT" {
      tags = {
    Name = "cust-RT"
  }
  vpc_id = aws_vpc.cus-vpc.id
    route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.cust-IG.id
  }
}

# Step 5 – Create Route Table and Edit routs and the Subnet Association

resource "aws_route_table_association" "Cus-rt-sub" {
    route_table_id = aws_route_table.cust-RT.id
    subnet_id = aws_subnet.sub1.id
}
   
# Step 6 – Create Security Group

resource "aws_security_group" "Cus-SG" {
       tags = {
    Name = "cust-SG"
  }
  vpc_id = aws_vpc.cus-vpc.id
   ingress {
    description = "TLS from VPC"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = [ "0.0.0.0/0" ]

   }
ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"  # -1 means all protocols
    cidr_blocks = ["0.0.0.0/0"]  # Allows traffic from anywhere
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

}