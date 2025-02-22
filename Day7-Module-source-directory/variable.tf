variable "ami_id"{
    description = "yaha apne hisabse kuch bhi discription deskatehai"
     # type hamesha 95% string hi rahenga
    type = string      
    # default value me humme wo value dalna padhta hai jo hum use karne wale hai 
    default = ""
 }

variable "instance_type" {
    type = string
    default = ""
}

variable "key_name" {
  type = string
  default = ""
}