module "consul" {
  #source  = "https://juppad23@github.ibm.com/juppad23/schematics_test_1.git"
  source  = "git::https://hkantare@github.com/hkantare/test-private.git"
}

# Create an arbitrary local resource
data "template_file" "test" {
  template = "Hello, I am a template. My sample_var value = $${sample_var}"

  vars = {
    sample_var = var.sample_var
  }
}

resource "null_resource" "sleep" {
  triggers = {
    uuid = uuid()
  }

  provisioner "local-exec" {
    //command = "sleep ${var.sleepy_time}"
    command = "echo ${var.map_ref_test["age"]}"
  }
}

resource "null_resource" "print_list" {
  triggers = {
    uuid = uuid()
  }
  count = length(var.docker_ports)
  
  provisioner "local-exec" {
    command = "echo Docker port ${count.index} internal, ${var.docker_ports[count.index].internal} external ${var.docker_ports[count.index].external} and protocol ${var.docker_ports[count.index].protocol}"
  }
}

locals {
  nested_complex_local = flatten([
    for obj in var.nested_complex : [
      for somekey in keys(obj.details.other) : {
        1 = somekey,
        2 = obj.details.other[somekey].name,
        3 = obj.details.other[somekey].val,
      }
    ]
  ])
}

resource "null_resource" "nested_complex_test" {
  triggers = {
    uuid = uuid()
  }
    
  count = length(local.nested_complex_local)
  provisioner "local-exec" {
    command = "echo key ${local.nested_complex_local[count.index].1} name, ${local.nested_complex_local[count.index].2} val ${local.nested_complex_local[count.index].3}"
  }
}


output "test_tuple" {
  value       = var.simple_tuple[*]
  description = "simple tuple entries"
}


output "nested_complex_local_out" {
  value       = local.nested_complex_local
  description = "nested_complex_local"
}

