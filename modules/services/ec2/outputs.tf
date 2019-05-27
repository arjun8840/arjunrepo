output "private_address" {
  value = "${aws_instance.ec2_instance.private_ip}"
}
output "subnet_id" {
value = "${aws_instance.ec2_instance.subnet_id}"
}

output "public_address" {
value = "${aws_instance.ec2_instance.public_ip}"
}
