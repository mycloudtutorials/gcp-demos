# Managed Instance Group using Instance Template

Author: Girish Jaju<br>
Connect with me: https://linkedin.com/in/girishjaju<br>
Youtube: https://www.youtube.com/channel/UCqGYxFy2OWDvyB84jyNaUvw

---

In this demo, we will use the instance template created in [03-custom-image-and-instance-templates](/03-custom-image-and-instance-templates) section to create managed instance group. We will launch instances using the instance groups.
These instances will serve as backend for the load balancer for Order Microservice example.

## Managed instance Group Creation Steps:
- Go to GCP console
- Search Compute Engine Or Go to Compute Engine in the navigation menu
- Go to Comute Engine >> Instance Groups
- Click Create Instance Group
    - Name: order-service-mig
    - Instance Template: Choose the template we created in the previous section
    - Mininum Instances: 2
    - Maximum Instances: 4
    - Under Port Mapping:
        - add port name `http` 
        - port number `80`
    - Click `Create`

- Wait for some time
- Go to VM instances page, You should see 2 instances created 
- Copy the instances ipaddress on the browser and you should see the content of index.html file
---

## Test
- Delete one of the VMs and wait for some time.
- Since we setup minimum instance group as `2`, the managed instance group should create another instance.

## Cleanup
- `Optional` Wait for the next demo where we create the Load Balancer and use the Managed Instance Group 
- If you need to delete after this demo, delete them in this order:
    - Delete the Managed Instance Group
    - Delete the Instance Template
    - Delete the Custom Image

