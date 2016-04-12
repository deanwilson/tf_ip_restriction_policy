
variable "allowed_cidr_ranges" {
    default = "0.0.0.0/0"
    description = "A CSV list of IP addresses to allow access from"
}

variable "group_name" {
    description = "The group the policy should be attached to"

}
