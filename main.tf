resource "null_resource" "list_string_test" {
  triggers = {
    uuid = uuid()
  }
    
  count = length(var.availability_zone_names)
  provisioner "local-exec" {
    command = "echo - This val ${var.availability_zone_names[count.index]}"
  }
}