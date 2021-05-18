#!/bin/bash
yum update -y
yum install httpd -y
service httpd start
chkconfig httpd on
cd /var/www/html
echo "<html><body><h1>THIS IS A SAMPLE STATIC WEBSITE</h1>" > index.html
echo "IP ADDRESS OF THE INSTANCE IS: " >> index.html
curl http://169.254.169.254/latest/meta-data/local-ipv4 >> index.html
echo "</body></html>" >> index.html