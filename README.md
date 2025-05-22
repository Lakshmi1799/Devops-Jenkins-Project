**We use monolithic architecture in our project.**  
2.So as a Devops engineer, need to create infrastructure.     
3.For Infrastructure creation we use terraform. And by using terraform modules, 3 tier architecture is built in AWS Cloud.   
4.Servers are configured using ansible and softwares are installed on web, app and db servers using playbooks.  
5.Also roles are being created and executed when required.      
6.And development team will push the code to Github and we integrate code from github to jenkins.    
7.In jenkins we perform continuous integration(Build+Test) and as a result we get .war/.jar file(artifact).   
8.And artifact is being stored in S3 bucket for rollback purpose.  
9.We run pipeline that will deploy code to Dev server automatically, later deployed in Test and UAT. If everything is fine, deployed in Prod.  
10.Once application is deployed, through ELB DNS application, state is checked whethere application is running or not and monitored from Grafana.  
  
Tools used in this project:  
Cloud 	                : AWS    
Infrastructure creation : Terraform     
Code	                  : Git & Github      
Continuous integration  : Jenkins      
Configuration management: Ansible      
Monitoring	            : Prometheus & Grafana     
Aplication server       : Tomcat      
