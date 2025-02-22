provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "teraEc2" {
  ami = "ami-05fa46471b02db0ce"
  instance_type = "t2.nano"
  key_name = "Revisionkeys"
  availability_zone = "ap-south-1"
  tags = {
    Name = "teraec2" 
  }

#   lifecycle {
#     ignore_changes = [ "tags" ]
#   }

# lifecycle {
#   create_before_destroy = true
# }
# lifecycle {
#   prevent_destroy = true
# }
}

