variable "ami_id"{
    description = "yaha apne hisabse kuch bhi discription deskatehai"
     # type hamesha 95% string hi rahenga
    type = string      
    # default value me humme wo value dalna padhta hai jo hum use karne wale hai 
    default = "ami-05fa46471b02db0ce"
 }

variable "instance_type" {
    type = string
    default = "t2.micro"
}

variable "key_name" {
  type = string
  default = "Revisionkeys"
}