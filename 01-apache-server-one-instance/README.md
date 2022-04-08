# Single Instance - Apache Server

Author: Girish Jaju<br>
Connect with me: https://linkedin.com/in/girishjaju<br>
Youtube: https://www.youtube.com/channel/UCqGYxFy2OWDvyB84jyNaUvw

---

In this demo, lets create a Compute Engine Instance and install Apache server manually.

## Instance Creation Steps:
- Go to GCP console
- Search Compute Engine Or Go to Compute Engine in the navigation menu
- Click on Create Instance
- Choose Region and Zone
- Machine Configuration
    - Choose General Purpose
    - Series: E2
    - Machine Type: E2 Small
- Use default boot disk (10 GB and Debian)
- Identity and Api Access - choose Compute Engine Default Service Account
- Firewall
    - Allow both HTTP and HTTPS traffic
- Click Create Instance
---
## Install Apache 
- Once the instance is ready, click SSH
- Once in the SSH terminal, use the following script to install apache
- Save the script in a file named install.sh
- Give the script execute permission (chmod +x install.sh)
```
#!/bin/bash
apt update
apt install apache2 -y
service apache2 start
update-rc.d apache2 enable
echo "Home Page:: host $(hostname) on IP: $(hostname -i)" > /var/www/html/index.html
mkdir /var/www/html/order
echo "Order Service:: host $(hostname) on IP: $(hostname -i)" > /var/www/html/order/index.html
```
- You must run this script as `root` (sudo ./install.sh)
- Once apache is installed and running, get the public IPAddress of the instance from the console
- Copy the ipaddress on the browser and you should see the content of index.html file
---

## Cleanup
- Go to Compute Engine console and delete the vm.
