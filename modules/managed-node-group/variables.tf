variable "project_name" {
  type        = string
  description = "Project name to be used to name  the resources(Name tag)"

}
variable "tags" {
  type        = map(any)
  description = "tags to be added to aws resources"
}
