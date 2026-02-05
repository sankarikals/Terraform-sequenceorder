#!/bin/bash
yum update -y
yum install -y nginx
systemctl start nginx
systemctl enable nginx

echo "<h1>SERVER4 - t2.MEDIUM instance4</h1>" > /usr/share/nginx/html/index.html
