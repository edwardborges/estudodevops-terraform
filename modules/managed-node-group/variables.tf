variable "project_name" {
  type        = string
  description = "Project name to be used to name  the resources(Name tag)"

}
variable "tags" {
  type        = map(any)
  description = "tags to be added to aws resources"
}

variable "cluster_name" {
  type        = string
  description = "Name EKs cluster to create MNG"

}

variable "subnet_private_1a" {
  type        = string
  description = "Subnet ID from AZ 1a"

}

variable "subnet_private_1b" {
  type        = string
  description = "Subnet ID from AZ 1b"

}