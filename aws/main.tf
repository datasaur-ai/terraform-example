module "public-eks-cluster" {
  source         = "./eks-cluster"
  vpc_name       = var.vpc_name
  cluster_name   = var.cluster_name
  desired_size   = var.desired_size
  max_size       = var.max_size
  min_size       = var.min_size
  instance_types = [var.instance_types]
  region         = var.region
}

module "ingress-nginx" {
  source     = "./nginx-ingress"
  cluster_id = module.public-eks-cluster.id
}
