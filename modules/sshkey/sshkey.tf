resource "aws_key_pair" "bjs-key-pair" {
  public_key = "${var.public_ssh_key}"
  key_name   = "${var.key_name}"
}
