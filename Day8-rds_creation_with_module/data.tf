data "aws_subnet" "selected" {
  filter {
    name   = "tag:Name"
    values = ["Subnet1"] # insert value here
  }
}
data "aws_subnet" "selected" {
  filter {
    name   = "tag:Name"
    values = ["Subnet2"] # insert value here
  }
}

