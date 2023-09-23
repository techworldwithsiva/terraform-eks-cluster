module "eks1" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 19.0"

  cluster_name    = "my-cluster"
  cluster_version = "1.27"

  cluster_endpoint_public_access  = true

  vpc_id                   = local.vpc_id
  subnet_ids               = local.private_subnet_ids
  control_plane_subnet_ids = local.public_subnet_ids

  # EKS Managed Node Group(s)
  eks_managed_node_group_defaults = {
    instance_types = ["m6i.large", "m5.large", "m5n.large", "m5zn.large"]
  }

  eks_managed_node_groups = {
    # blue = {
    #   min_size     = 1
    #   max_size     = 10
    #   desired_size = 1
    #   capacity_type  = "SPOT"
    # }
    green = {
      min_size     = 1
      max_size     = 10
      desired_size = 1
      capacity_type  = "SPOT"
    }
  }

  tags = {
    Environment = "dev"
    Terraform   = "true"
  }
}