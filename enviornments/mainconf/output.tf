output "server_status" {
  value = {
    server1 = length(module.server1) > 0 ? module.server1[0].public_ip : "off"
    server2 = length(module.server2) > 0 ? module.server2[0].public_ip : "off"
    server3 = length(module.server3) > 0 ? module.server3[0].public_ip : "off"
    server4 = length(module.server4) > 0 ? module.server4[0].public_ip : "off"
  }
}
