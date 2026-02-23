output "server_public_ips" {
  value = {
    for idx, server in var.servers :
    server.name => module.ec2[idx].public_ip
  }
  
}