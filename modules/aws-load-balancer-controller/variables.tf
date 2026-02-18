variable "project_name" {
  type        = string
  description = "Project name to be used to name  the resources(Name tag)"

}
variable "tags" {
  type        = map(any)
  description = "tags to be added to aws resources"
}

variable "oidc" {
  type        = string
  description = "HTTP URL do OIDC provider do EKS cluster"

}