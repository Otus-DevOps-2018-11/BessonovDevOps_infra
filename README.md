# BessonovDevOps_infra
BessonovDevOps Infra repository
                                                                                                     
## Home work cloud-bastion                                                                                        
1. Config description:                                                                               
        Bastion:                                                                                     
          ext_ip:       35.241.171.191                                                               
          int_ip:       10.132.0.2                                                                   
                                                                                                     
        internal:                                                                                    
          ext_ip:       -                                                                            
          int_ip:       10.132.0.3                                                                   
                                                                                                     
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
~                                                                                                                                                                                                          
~                                                                        
