
variable "test_nest_list" {
  type    = list(list(string))
  default = [["blue-horizon", "mgm-grand"], ["madison-square-garden"]]
}

variable "no_type_constraint" {
  type = any
  default = 78
}