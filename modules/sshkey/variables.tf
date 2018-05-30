variable "public_ssh_key" {
  description = "Public SSH Key for connecting to EC2 instances"
  default     = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCb86qwqmHmxLXn7s/N58MLelrmvkGhVEV2uNqyN7Bx0k460zdbgjSmftB8f9fyRzNrZe60o6NpqSglBE2VlmwUq5kXf9iMs4eMpKg2MP1dkWt+wD8hKEyeE7yyipII/7mwukSg3EA3HWfAjXXf0dlgWgiCENKlIkXh7N6lY5kOncQvKHkHKV9KjEXHcQ4afD8Ei7MBaQcI4xFZqrHmnzgGYWqGKNb5yBibvRlOdXx8Pr7XJbLbLcWgrPTSgrBn3AvlnCP3tc/PuQNEM0eVlr/2oB40sMRu7mWvYqoS7G7I3EurXyX3aDBM5vJucNl1T21tvieF4YHn6GUNuJVmg3ND"
}

variable "key_name" {
  description = "Default key to use for EC2 instances"
  default     = "MyKeyPair"
}