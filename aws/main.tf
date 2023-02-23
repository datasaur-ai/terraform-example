module "public-eks-cluster" {
  source         = "./eks-cluster"
  vpc_name       = "my-VPC1"
  cluster_name   = "my-EKS1"
  desired_size   = 1
  max_size       = 1
  min_size       = 1
  instance_types = ["t3.small"]
  region         = "us-east-2"
}

module "ingress-nginx" {
  source     = "./nginx-ingress"
  cluster_id = module.public-eks-cluster.id
}
