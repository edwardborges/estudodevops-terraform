data "tls_certificate" "eks_oidc_tls_certificate" {
  url = aws_eks_cluster.eks_cluster.identity[0].oidc[0].issuer
}
#pega o certificado TLS do endpoint OIDC do cluster
#extrai o thumbprint
#que depois será usado para criar o provider IAM

resource "aws_iam_openid_connect_provider" "eks_oidc" {
  client_id_list  = ["sts.amazonaws.com"]
  thumbprint_list = data.tls_certificate.eks_oidc_tls_certificate.certificates[*].sha1_fingerprint
  url             = aws_eks_cluster.eks_cluster.identity[0].oidc[0].issuer
} 