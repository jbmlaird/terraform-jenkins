module "network" {
  source = "../../modules/vpc"
}

module "autoscaling_group" {
  source                = "../../modules/autoscaling-group"
  public_subnet_id      = "${module.network.public_subnet_id}"
  public_subnet_1_sg_id = "${module.network.public_subnet_1_sg_id}"
}

