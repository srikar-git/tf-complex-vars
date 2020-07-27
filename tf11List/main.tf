variable "iftodo" {
  type = "string"
}

variable "images" {
  type = "map"

  default = {
    howmany = "2"
  }
}

variable "zones" {
  type = "lis"
  default = ["us-east-1a", "us-east-1b"]
}


# resource "aws_instance" "vpn" {
#   count = "${var.something ? 1 : 0}"
#   triggers = {
#     uuid = uuid()
#   }
#   count = length(var.docker_ports)
  
#   provisioner "local-exec" {
#     command = "echo Docker port ${count.index} internal, ${var.docker_ports[count.index].internal} external ${var.docker_ports[count.index].external} and protocol ${var.docker_ports[count.index].protocol}"
#   }
# }


resource "null_resource" "sleep" {

  count = "${var.iftodo ? var.images["howmany"] : 0}"

  triggers {
    uuid = "${uuid()}"
  }

  provisioner "local-exec" {
    command = "echo this zone **** = ${var.zones[count.index]}"
  }
}
