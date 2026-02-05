#!/bin/bash
yum update -y
yum install -y nginx
systemctl start nginx
systemctl enable nginx

echo "<h1>Server 1 - t2.micro instance1</h1>" > /usr/share/nginx/html/index.html
