output "public_subnet_id" {
  value = "${aws_subnet.public_subnet.id}"
}

output "public_subnet_1_sg_id" {
  value = "${aws_security_group.public_subnet_sg.id}"
}