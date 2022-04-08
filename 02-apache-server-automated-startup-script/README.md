# Single Instance - Apache Server - Automated Startup Script

Author: Girish Jaju<br>
Connect with me: https://linkedin.com/in/girishjaju<br>
Youtube: https://www.youtube.com/channel/UCqGYxFy2OWDvyB84jyNaUvw

---

In this demo, lets create a Compute Engine Instance and install Apache server as an automated script. This script is provided at the instance creation time and it's run as a `root` user.

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
- Expand Networking, Disks, Security, Management, Sole-tenacy
- Expand the Management section
    - In the Automatation section > Startup script text area, copy the following script
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
- Click Create Instance
- Wait for the instance to be created and running (it may take some time as we are executing the scripts on startup)
- Once the VM instance is running, get the public IPAddress of the instance from the console
- Copy the ipaddress on the browser and you should see the content of index.html file
---

## Cleanup
- Go to Compute Engine console and delete the vm.
