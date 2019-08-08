#!/bin/bash

function getIp () {
    curl http://169.254.169.254/latest/meta-data/public-ipv4
 }

public_ip=$(getIp)

sudo yum install httpd -y

sudo echo "<h1> The IP-address of this webserver is: $public_ip </h1>" > /var/www/html/index.html

sudo systemctl start httpd