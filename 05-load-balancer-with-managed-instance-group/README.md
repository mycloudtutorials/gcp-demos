# Load Balancer With Managed Instance Group

Author: Girish Jaju<br>
Connect with me: https://linkedin.com/in/girishjaju<br>
Youtube: https://www.youtube.com/channel/UCqGYxFy2OWDvyB84jyNaUvw

---

In this demo, we will create a http/https load balancer and use the managed instance groups that we created the [04-managed-instance-group-using-instance-template](/04-managed-instance-group-using-instance-template) as the backend. 

## Load Balancer Creation Steps:
- Go to GCP console
- Go to Networking > Network Services > Load Balancing
- Click Create Load Balancer
- Use `HTTP(S) Load Balancing` and click Start Configuration
    - Choose Internet Facing
    - Classic Load Balancer
    - Create `Backend Service`
        - Name: order-backend-service
        - Backend Type: `Instance Group`
        - In the Backend Configuration, Choose the `Managed Instance Group` we created.
        - Create `Health Check`
            - Name: order-backend-healthcheck
            - Protocol: HTTP
            - Everything else can be left default.
        - Click `Create` to create the backend service
        - *We have 2 instances of the managed instance group service as order micro service backend*
    - Host And Path Rule
        - Add `*` for host and `/order/*` for path - backend: `order-backend-service`

    - Frontend Configuration
        - Name: load-balancer-front-end
        - Leave rest as default
    
    - Review And Finalize

    - Give load balancer a name like `my-load-balancer`
    - Click Create
    - It may take upto a few minutes to create the load balancer

## Test
- Once the load balancer is up, go to the `frontends` 
- Get the load balancer's ip address
- Put the ipaddress on the browser and refresh a few times. You should see the html content getting served from 2 different instances
- Try to put /order in the path, that should also get served from the same instances


## Challenge
- Copy the instance template and create another template for user service
- Create a managed instance group for `User Service`
- These instances should only serve traffic on `/user` path
- Add the path and backend configuration to the same load balancer.
- Once done, verify that 
    - `/` and `/order` are getting served from Order Managed instance group
    - `/user` path is getting served from different instance groups


## Cleanup
    - Delete the Load Balancer, Backend(s), Healthcheck(s)
    - Delete the Managed Instance Group(s)
    - Delete the Instance Template(s)
    - Delete the Custom Image
