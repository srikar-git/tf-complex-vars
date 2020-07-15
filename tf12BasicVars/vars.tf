# Configure these variables

variable "sample_var" {
  description = "A sample var to pass to the template."
  default     = "hello"
}

variable "sleepy_time" {
  description = "How long Rocky naps before the series of fights"
  type = number
  default = 0
}

variable "number_auto" {
  description = "Can this type be detected"
  default     = 100
}

variable "can_sleep" {
  description = "If I can sleep"
  type = bool
  default     = false
}

variable "rocky_balboa" {
  description = "About how hard you can get hit and move forward"
  type = string
  default = "BOXING_ROCK"
}

variable "any_list" {
  type    = list
  default = [3, "mgm-grand", "madison-square-garden"]
}

variable "map_simple" {
  type    = map
  default = {name = 2, age = "alage"}
}
