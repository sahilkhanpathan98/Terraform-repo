resource "aws_instance" "teraEc2" {
  ami = "ami-05fa46471b02db0ce"
  instance_type = "t2.micro"
  key_name = "Revisionkeys"
  
  tags = {
    # to give name to the resource in main file
    Name = "hi"
  }
}

resource "aws_dynamodb_table" "dynamodb-terraform-state-lock" {
  name = "terraform-state-lock-dynamo"
  hash_key = "LockID"
  read_capacity = 20
  write_capacity = 20
 
  attribute {
    name = "LockID"
    type = "S"
  }
}



