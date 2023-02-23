# AWS EKS Cluster with Nginx Ingress
## Description
This terraform module: 
1. creates a simple EKS cluster with basic requirements as in the [AWS documentation](https://docs.aws.amazon.com/eks/latest/userguide/create-cluster.html) using infrastructure as a code tool [Terraform](https://www.terraform.io/)
2. creates a simple Nginx ingress controller and Ingress service for the EKS cluster.

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13.1 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 3.73 |
| <a name="requirement_helm"></a> [helm](#requirement\_helm) | >=2.7.0 |
| <a name="requirement_kubernetes"></a> [kubernetes](#requirement\_kubernetes) | >= 2.4 |

## How to Run
1. Fill the desired value of each variable on `terraform.tfvars` for EKS Cluster creation.
2. `terraform init`
3. `terraform plan`
4. `terraform apply`

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 4.34.0 |
| <a name="provider_helm"></a> [helm](#provider\_helm) | 2.7.1 |
| <a name="provider_kubernetes"></a> [kubernetes](#provider\_kubernetes) | 2.14.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_vpc"></a> [vpc](#module\_vpc) | git::https://github.com/terraform-aws-modules/terraform-aws-vpc.git | v3.16.0 |

## Resources

| Name | Type |
|------|------|
| [aws_eks_cluster.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eks_cluster) | resource |
| [aws_eks_node_group.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eks_node_group) | resource |
| [aws_iam_role.eksClusterRole](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role.eksWorkerNodeRole](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.AmazonEC2ContainerRegistryReadOnly](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.AmazonEKSClusterPolicy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.AmazonEKSVPCResourceController](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.AmazonEKSWorkerNodePolicy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.AmazonEKS_CNI_Policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_region.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/region) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_vpc_name"></a> [vpc\_name](#input\_vpc\_name) | Name of VPC where cluster will be created on | `string` | n/a | yes |
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | Name of the EKS Cluster. Must be between 1-100 characters in length. Must begin with an alphanumeric character, and must only contain alphanumeric characters, dashes and underscores (^[0-9A-Za-z][A-Za-z0-9-\_]+$). | `string` | n/a | yes |
| <a name="input_desired_size"></a> [desired\_size](#input\_desired\_size) | Desired size of the worker node, the default value is 2 | `number` | n/a | yes |
| <a name="input_max_size"></a> [max\_size](#input\_max\_size) | Maximum size of the worker node, the default value is 2 | `number` | n/a | yes |
| <a name="input_min_size"></a> [min\_size](#input\_min\_size) | Minimum size of the worker node, the default value is 1 | `number` | n/a | yes |
| <a name="input_instance_types"></a> [instance\_types](#input\_instance\_types) | List of instance types associated with the EKS Node Group. Terraform will only perform drift detection if a configuration value is provided. | `list(string)` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | The AWS Region where vpc and cluster will be created on | `string` | n/a | yes |


## Outputs

| Name | Description |
|------|-------------|
| <a name="output_k8s_service_ingress_elb"></a> [k8s_service_ingress_elb](#output\_k8s_service_ingress_elb) | Kubernetes service ingress ELB |