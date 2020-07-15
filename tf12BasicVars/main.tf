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
    command = var.can_sleep ? "sleep ${var.map_simple["name"]}" : "echo NOT SLEEPING"
  }
}

resource "null_resource" "print_list" {
  triggers = {
    uuid = uuid()
  }
  count = length(var.any_list)
  
  provisioner "local-exec" {
    command = "echo SIMPLE LIST DETAILS ${count.index} value, ${var.any_list[count.index]}"
  }
}

resource "null_resource" "nested_complex_test" {
  triggers = {
    uuid = uuid()
  }
  
  provisioner "local-exec" {
    command = "for i in `seq 1 ${var.map_simple["name"]}`; do echo $i ${var.map_simple["age"]}; done"
  }
}
