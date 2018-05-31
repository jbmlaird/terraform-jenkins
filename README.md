# Jenkins Terraform Setup

### Setup

1. Create a file called `terraform.tfvars` in the `environment/dev` directory and
define the variables
2. `cd` to `environment/dev` and run `terraform workspace new dev` 
3. Run `terraform apply` and confirm!

### Architecture

![JenkinsTerraform architecture](https://s3-eu-west-1.amazonaws.com/joshlaird.uk/JenkinsTerraform.png)

This builds a VPC configured with an IGW and an ALB. The Jenkins instances are launched via an Autoscaling Group up to 
a maximum of 2. 

See the launch configuration for more information on the specific instance configuration. 