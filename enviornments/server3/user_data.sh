#!/bin/bash
yum update -y
yum install -y nginx
systemctl start nginx
systemctl enable nginx

echo "<h1>SERVER3 - t2.micro instance3</h1>" > /usr/share/nginx/html/index.html
