# Configure these variables

variable "sample_var" {
  description = "A sample_var to pass to the template."
  default     = "hello"
}

variable "sleepy_time" {
  description = "How long Rocky naps before the series of fights"
  type = number
  default     = 0
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

variable "can_sleep_auto" {
  description = "If I can sleep"
  default     = false
}

variable "rocky_balboa" {
  description = "About how hard you can get hit and move forward"
  type = string
  default = "BOXING_ROCK"
}

variable "availability_zone_names" {
  type    = list(string)
  default = ["blue-horizon", "mgm-grand", "madison-square-garden"]
}

variable "test_nest_list" {
  type    = list(list(string))
  default = [["blue-horizon", "mgm-grand"], ["madison-square-garden"]]
}

variable "no_type_constraint" {
  type = any
  default = 78
}

variable "map_simple" {
  type    = map(number)
  default = {name = 78, age = 52}
}

variable "map_ref_test" {
  type    = map(number)
  default = {name = 990,  age = 52}
}

variable "map_simple_string" {
  type    = map(string)
  default = {"lit" = "Mabel", age = "alage"}
}

variable "map_string_ref" {
  type    = map(string)
  default = {"lit" = "Mabel", age = "(null_resource.local-exec.command)"}
}

variable "docker_ports" {
  type = list(object({
    internal = number
    external = number
    protocol = string
  }))
  default = [
    {
      internal = 8300
      external = 8300
      protocol = "tcp"
    }
  ]
}

