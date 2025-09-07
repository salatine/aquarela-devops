module "vpc" {
  source = "./modules/vpc"

  vpc_name           = var.vpc_name
  vpc_cidr           = var.vpc_cidr
  availability_zones = var.availability_zones
  private_subnets    = var.private_subnets
  public_subnets     = var.public_subnets
  env                = var.env
}

module "eks" {
  source = "./modules/eks"

  cluster_name        = var.cluster_name
  cluster_version     = var.cluster_version
  vpc_id              = module.vpc.vpc_id
  subnet_ids          = module.vpc.private_subnets
  node_desired        = var.node_desired
  node_min            = var.node_min
  node_max            = var.node_max
  node_instance_types = var.node_instance_types
  depends_on          = [module.vpc]
}

module "iam" {
  source       = "./modules/iam"
  iam_username = var.iam_username
  depends_on   = [module.eks]
}

data "aws_eks_cluster" "eks" {
  name = module.eks.cluster_name
}

data "aws_eks_cluster_auth" "eks" {
  name = module.eks.cluster_name
}

resource "kubernetes_config_map" "aws-auth" {
  metadata {
    name      = "aws-auth"
    namespace = "kube-system"
  }

  data = {
    mapRoles = yamlencode([{
      rolearn  = module.iam.eks_admin_role_arn
      username = var.iam_username
      groups   = ["system:masters"]
    }])
  }

  depends_on = [module.iam]
}
