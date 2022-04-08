# Images And Instance Templates

Author: Girish Jaju<br>
Connect with me: https://linkedin.com/in/girishjaju<br>
Youtube: https://www.youtube.com/channel/UCqGYxFy2OWDvyB84jyNaUvw

---

In this demo, lets create a Compute Engine Instance and install Apache server as an automated script. This script is provided at the instance creation time and it's run as a `root` user. After we verify that Apache is working fine, we will shutdown the instance and create an image from the boot disk. We will use this image in the instance template.

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
        echo "Order Service at host $(hostname) on IP: $(hostname -i)" > /var/www/html/index.html
        ```    
- Click Create Instance
- Wait for the instance to be created and running (it may take some time as we are executing the scripts on startup)
- Once the VM instance is running, get the public IPAddress of the instance from the console
- Copy the ipaddress on the browser and you should see the content of index.html file
---

## Create Image
- Shutdown (Not delete) the instance.
- Once the instance is shutdown, go to Compute Engine > Storage > Images
- Click `Create Image`
- Name: Order-service-image
- Source Disk: the instance's disk (where apache is running)
- Keep everything else default
- Click Create

## Create Instance Template
- Go to Compute Engine > Instance Templates 
- Click Create Instance Template
- Name: order-service-template
- Machine Configuration
    - Choose General Purpose
    - Series: E2
    - Machine Type: E2 Small
- Boot Disk: Click Change
    - Click Custom Images
    - Select the Project (Project where we saved the disk)
    - From the `Image` dropdown, choose the image we created in previous step
    - Click Select

- Identity and Api Access - choose Compute Engine Default Service Account
- Firewall
    - Allow both HTTP and HTTPS traffic
- Expand Networking, Disks, Security, Management, Sole-tenacy
- Expand the Management section
    - In the Automatation section > Startup script text area, copy the following script
        ```
        #!/bin/bash
        echo "Home Page:: host $(hostname) on IP: $(hostname -i)" > /var/www/html/index.html
        mkdir /var/www/html/order
        echo "Order Service:: host $(hostname) on IP: $(hostname -i)" > /var/www/html/order/index.html 
        ```    
    - (*Note*, we don't have to install updates and apache, as the image already has it. We just need to provide custom index.html content)

- Click Create

## Create an instance using instance template
- Once the instance template is created, click on three vertical dots on the right
- Click `Create VM`
- Choose `Region` and `Zone`
- Leave everything else as default.
- Click `Create`
- Once the instance is running, copy it's External ipaddress in the browser
- You should see the content of index.html file


## Cleanup
- Go to Compute Engine console and delete the vm. We don't need it anymore
- `DO NOT` delete the instance template, we will use it to create Instance Groups
