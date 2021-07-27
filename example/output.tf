
output "Github_File_Name" {
  
    value = {
    for k, v in module.static_webapp : k => v.Github_File_Name
  }
  }


output "default_host_name" {
  
    value = {
    for k, v in module.static_webapp : k => v.default_host_name
  }
  }

