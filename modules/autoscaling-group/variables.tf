variable "image_id" {
  description = "AMI ID "
  // Free tier compatible
  default     = "ami-ca0135b3"
}

variable "instance_type" {
  description = "Instance type to use for the instances"
  // Free tier compatible
  default     = "t2.micro"
}

variable "public_subnet_id" {
  description = "Public subnet ID"
}

variable "key_name" {
  description = "SSH key for connecting to EC2 instances"
  default     = "MyKeyPair"
}

variable "public_subnet_1_sg_id" {
  description = "Public subnet security group ID"
}