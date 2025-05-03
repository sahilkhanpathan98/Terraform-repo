provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "hello" {
  ami           = "ami-062f0cc54dbfd8ef1"
  key_name      = "terra-key"
  instance_type = "t2.micro"
  count         = length(var.countnames)
  tags = {
    Name = var.countnames[count.index]
  }
  #  tags = {
  #   Name = "pathan"
  # }
  
  # tags = {
  #   Name = "pathan-${count.index}"
  # }


} 

variable "countnames" {
  type = list(string)
  default = [ "sahil","khan","pathan" ]
}


#example-3 creating IAM users 
# variable "user_names" {
#   description = "IAM usernames"
#   type        = list(string)
#   default     = ["user1", "user2", "user3"]
# }
# resource "aws_iam_user" "example" {
#   count = length(var.user_names)
#   name  = var.user_names[count.index]
# }


# example-4 with numeric condition in thid condition if ec2 instance = t2.micro only instance will create(count = var.instance_type == "t2.micro" ? 1 : 0) but i am passing t2.nano so ec2 will not create
# variables.tf
# variable "ami" {
#   type    = string
#   default = "ami-0230bd60aa48260c6"
# }

# variable "instance_type" {
#   type = string
#   default = "t2.nano"
# }

# # main.tf
# resource "aws_instance" "dev" {
#   ami           = var.ami
#   instance_type = var.instance_type
#   count         = var.instance_type == "t2.micro" ? 1 : 0
#   tags = {
#     Name = "dev_server"
#   }
# }