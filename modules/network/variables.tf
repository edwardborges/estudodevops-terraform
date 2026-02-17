variable "cidr_block" {
  type        = string
  description = "NetWorking CIDR block to be used for the VPC"
}

variable "project_name" {
  type        = string
  description = "Project name to be used to name  the resources(Name tag)"

}
variable "tags" {
  type        = map(any)
  description = "tags to be added to aws resources"
}