resource "aws_eks_node_group" "eks_managed_node_group" {
  cluster_name    = var.cluster_name
  node_group_name = "${var.project_name}-nodegroup"
  node_role_arn   = aws_iam_role.eks_mng_role.arn
  subnet_ids = [

    var.subnet_private_1a,
    var.subnet_private_1b

  ]
  tags = var.tags

  scaling_config {
    desired_size = 1
    max_size     = 1
    min_size     = 1
  }

  update_config {

    # Define a estratégia de atualização dos nodes do Node Group.
    # "max_unavailable = 1" significa que apenas 1 nó pode ficar indisponível
    # durante atualizações (upgrade de versão, AMI ou recriação do node).
    # Isso garante um rolling update sem derrubar todo o cluster ao mesmo tempo.
    max_unavailable = 1
  }

  # Garante que as permissões da IAM Role sejam criadas antes e removidas depois do gerenciamento do Node Group do EKS.
  # Caso contrário, o EKS não conseguirá excluir corretamente as instâncias EC2 e as interfaces de rede elásticas (ENI).
  depends_on = [
    aws_iam_policy_attachment.eks_mng_role_attachment_worker,
    aws_iam_policy_attachment.eks_mng_role_attachment_ecr,
    aws_iam_policy_attachment.eks_mng_role_attachment_cni,
  ]
}