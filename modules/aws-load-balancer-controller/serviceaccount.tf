resource "kubernetes_service_account" "eks_controller_sa" {
  metadata {
    name      = "aws-load-balancer-controller"
    namespace = "kube-system"
    annotations = {
      "eks.amazonaws.com/role-arn" = aws_iam_role.eks_controller_role.arn
    }
  }

}

# esse recurso é necessário para criar a conta de serviço do controlador de load balancer e associar a função IAM criada anteriormente. A anotação "eks.amazonaws.com/role-arn" é usada para vincular a função IAM à conta de serviço, permitindo que o controlador