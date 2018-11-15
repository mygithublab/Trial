# Trial

Deployment Testing Your Favourite Applications

### The instance Trial from Aliyun

###### 1.Setup git configration

Run gitconf.sh script

###### 2.Install docker 

Run docker-installer.sh script dockerconf.sh

### Port design

10010~10050 for Application; port+1 for SSH
10001->8080 10002->50000 for Jenkins
10086->80 10087->22 for Nagios

###### 3.Create Jankins container

Run jenkins-container.sh

