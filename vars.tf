# Configure these variables


variable "nested_list_set" {
  type    = list(set(number))
  default = [[5,6],[5,6],3,]
}

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


variable "any_list" {
  type    = list
  default = [34, "mgm-grand", "madison-square-garden"]
}

variable "test_any_list" {
  type    = list(any)
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
    },
    {
      internal = 8301
      external = 8301
      protocol = "ldp"
    }
  ]
}

variable "simple_tuple" {
  type    = tuple([string, string, number, bool])
  default = ["hello","hi", 34.5, false]
}

variable "nested_tuple" {
  type    = tuple([string, list(string), number, bool])
  default = ["hello",["hi"], 34.5, false]
}


variable "heavy_nested_tuple" {
  type    = tuple([string, tuple([string, bool]), list(string), object({
    a = number
    b = string
  })])
  default = ["hello",["hi", true,], [34.5, "thirty", "fourpointfive",], {a = 4,b = "random"}]
}

variable "simple_set" {
  type    = set(string)
  default = ["hello","hello", "he"]
}

variable "nested_set" {
  type    = set(list(number))
  default = [[5,6],[5,6],[3,],]
}

variable "nested_complex" {
  type = list(object({
    internal = number
    external = number
    protocol = string
    details = object({
      name = string
      num = number
      vals = list(string)
      other = map(object(
        {
          name = string
          val = number
        }
      ))
    })
  }))
  default = [
    {
      internal = 8300
      external = 8300
      protocol = "tcp"
      extrakey = "joke"
      details = {
        name = "execute"
        num = 3
        vals = ["ls -la", "echo that was the list", "ls -lrt",]
        other = {
          "random" = {
            name = "whatever"
            val = 6
          },
        }
      }
    },
    {
      internal = 8301
      external = 8301
      protocol = "tcp"
      details = {
        name = "execute"
        num = 3
        vals = ["ls -la", "echo that was the list", "ls -lrt"]
        other = {
          "first" = {
            name = "what"
            val = 1
          }
          "second" = {
            name = "how"
            val = 2
          }
        }
      }
    }
  ]
}

