variable "eks_cluster_source" {
  description = "Source code for the EKS cluster module"
  type        = string
  default     = "./eks-cluster"
}

variable "vpc_name" {
  description = "VPC Name"
  type        = string
}

variable "cluster_name" {
  description = "EKS Cluster Name"
  type        = string
}

variable "desired_size" {
  description = "EKS Cluster Nodes Desired Size"
  type        = number
}

variable "max_size" {
  description = "EKS Cluster Nodes Maximum Size"
  type        = number
}

variable "min_size" {
  description = "EKS Cluster Nodes Minimum Size"
  type        = number
}

variable "instance_types" {
  description = "EKS Cluster Nodes Instance Type"
  type        = string
}

variable "region" {
  description = "AWS region"
  type        = string
}
