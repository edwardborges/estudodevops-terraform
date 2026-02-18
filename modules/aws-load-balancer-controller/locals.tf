# esse locals é criado para pegar os valores dinamicos do OIDC que estão no json do iam.tf 
# do modulo de aws-load-balancer-controller
locals {
  oidc = split("/", var.oidc)[4]
}
