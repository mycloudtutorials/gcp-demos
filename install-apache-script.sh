#!/bin/bash
apt update
apt install apache2 -y
service apache2 start
update-rc.d apache2 enable
echo "Home Page at host $(hostname) on IP: $(hostname -i)" > /var/www/html/index.html