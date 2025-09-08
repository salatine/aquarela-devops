aws_region      = "us-east-1"
cluster_name    = "aquarela_eks"
cluster_version = "1.33"

vpc_name           = "aquarela_vpc"
vpc_cidr           = "10.0.0.0/16"
availability_zones = ["us-east-1a", "us-east-1b"]

private_subnets = ["10.0.1.0/24", "10.0.2.0/24"]
public_subnets  = ["10.0.101.0/24", "10.0.102.0/24"]
env             = "aquarela"

node_desired        = 5
node_min            = 5
node_max            = 8
node_instance_types = ["t3.medium"]

iam_username = "desafio_aquarela"
