output "public_Ip"{
  value = aws_instance.teraEc2.public_ip
}
output "private_Ip"{
  value = aws_instance.teraEc2.private_ip
  sensitive = true
}
