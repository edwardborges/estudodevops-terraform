module "eks_network" {
  source       = "./modules/network"
  cidr_block   = var.cidr_block
  project_name = var.project_name
  tags         = local.tags
}

module "eks_cluster" {
  source           = "./modules/cluster"
  project_name     = var.project_name
  tags             = local.tags
  public_subnet_1a = module.eks_network.subnet_pub_1a # e aqui que comeca a interdependencia de modulos pois ele pega o output do modulo network
  public_subnet_1b = module.eks_network.subnet_pub_1b # e aqui que comeca a interdependencia de modulos pois ele pega o output do modulo network
}