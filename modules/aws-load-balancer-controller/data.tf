# esse arquivo é para chamar de forma dinamica as informação da policy que o load balancer vai pegar 
#assim nao fica hardcode no repositorio e códigos
data "aws_caller_identity" "current" {}

data "aws_region" "current" {}