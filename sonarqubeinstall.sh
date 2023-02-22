#!/bin/bash
#Sonarqube doesnt work when you start it as root user
su - vagrant
#Java 11 installation
sudo yum update -y
sudo yum install java-11-openjdk-devel -y
sudo yum install java-11-openjdk -y
#Download SonarQube latest versions on your server
cd /opt
sudo yum install vim wget mlocate unzip 
sudo wget https://binaries.sonarsource.com/Distribution/sonarqube/sonarqube-9.9.0.65466.zip
#Extract packages
sudo unzip /opt/sonarqube-9.9.0.65466.zip
#Remove the original zip file to liberate space
sudo yum rm -rf sonarqube-9.9.0.65466.zip
#Change ownership to the user and Switch to Linux binaries directory to start service
sudo chown -R vagrant:vagrant /opt/sonarqube-9.9.0.65466
#Move to the sonarqube-9.9.0.65466/bin/linux-x84-64/ to execute the installation file
cd /opt/sonarqube-9.9.0.65466/bin/linux-x86-64/
#Now execute this following file to install sonarqube
./sonar.sh start
#Now Sonarqube should have been install and you can access it on the browser adding port :9000 to your Ip adress