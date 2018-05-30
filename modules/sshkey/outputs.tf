output "public_key" {
  value = "${aws_key_pair.bjs-key-pair.key_name}"
}