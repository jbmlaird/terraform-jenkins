provider "aws" {
  region     = "${var.region}"

  // This isn't working for some reason :( So have to use .tfvars with static creds
  profile    = "${var.profile}"

  secret_key = "${var.secret_access_key}"
  access_key = "${var.aws_access_key_id}"
}

