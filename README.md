# BessonovDevOps_infra
BessonovDevOps Infra repository
                                                                                                     
## Home work #5 cloud-bastion                                                                                        
1. Config description:                                                                               
	bastion_IP = 35.241.171.191
	someinternalhost_IP = 10.132.0.3

2. Client host ssh config listing(~/.ssh/config):                                                         
                                                                                                     
Host            *                                                                                    
  ForwardAgent  yes                                                                                  
                                                                                                     
Host            bastion                                                                              
  HostName      35.241.171.191                                                                       
  User          bessonov_devops                                                                      
  IdentityFile  ~/.ssh/bessonov_devops                                                               
                                                                                                     
Host            internal                                                                             
  HostName      10.132.0.3                                                                           
  User          bessonov_devops                                                                      
  IdentityFile  ~/.ssh/bessonov_devops                                                               
                                                                                                     
3. Connection to internal host using ssh via bastion command:                                        
        ssh -t bastion ssh bessonov_devops@10.132.0.3                                                

4. To connect to pritunl admin use https://35.241.171.191.sslip.io 

## Home work #6 cloud-testapp (reddit-app deploy to gcc)

1. Config description:   

testapp_IP = 34.76.71.184
testapp_port = 9292

2. Scripts:
	install_ruby.sh - install ruby packages and update bundler
 	install_mongodb.sh - add mongo repo install mongodb and enable mongod
 	deploy.sh - clone reddit source install and start puma 
 	startup_script.sh - all above in one file

3. Run gcloud with startup script metadata:
  ```bash
  gcloud compute instances create reddit-app \
  --boot-disk-size=10GB \
  --image-family ubuntu-1604-lts \
  --image-project=ubuntu-os-cloud \
  --machine-type=g1-small \
  --tags puma-server \
  --restart-on-failure \
  --metadata-from-file \
  startup-script=startup.sh 
  ```
4. Add firewall rule with gcloud:   
  ```bash
  gcloud compute firewall-rules create allow-9292-tcp-in --allow=TCP:9292
  ```
## Home work #7 packer-base   

1. Description   
  Added packer config: packer/ubuntu16.json (with packer/variables.json)   
  Builded GCP image reddit-base from source ubuntu16.04-lts with packer/scripts/install_ruby.sh, install_mongodb.sh   
  Added packer config: packer/immutable.json   
  Builded GCP image reddit-full from source reddit-base with deploy reddit-app and daemonize puma service   
  Added packer/create-redditvm.sh to deploy reddit-app from reddit-full image
  
2. How to use   
  build reddit-base:
  ```bash
  packer build -var-file=variables.json ubuntu16.json
  ```

  build reddit-full:
  ```bash
  packer build immutable.json
  ```
  deploy reddit-app image:   
  ```bash
  ./packer/create-redditvm.sh
  ```
