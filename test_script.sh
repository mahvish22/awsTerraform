#!/bin/bash

sleep 30

# Update the ec2
sudo yum update -y

# Install Docker
sudo yum install docker -y
# Add group membership for the default ec2-user so you can run all docker commands without using the sudo command:
sudo usermod -a -G docker ec2-user
id ec2-user
# Reload a Linux user's group assignments to docker w/o logout
newgrp docker

# Enable docker service at AMI boot time
sudo systemctl enable docker.service
#Start the Docker service
sudo systemctl start docker.service

# 1. Get pip3 
sudo yum install python3-pip
# 2. Then run any one of the following
sudo pip3 install docker-compose # with root access


# In order to download aws-cli , we need to add Python 3.8 and remove the old python with python 3.8
sudo amazon-linux-extras install python3.8 -y
sudo rm /usr/bin/python 
sudo ln -s /usr/bin/python3.8 /usr/bin/python

# 1.Download using the curl command.
curl "https://s3.amazonaws.com/aws-cli/awscli-bundle.zip" -o "awscli-bundle.zip"
# 2.Extract the files from the package. If you don't have unzip to extract the files,use your Linux distribution's built-in package manager to install it.
unzip awscli-bundle.zip
# 3. Run the install program. The installer installs the AWS CLI at /usr/local/aws and creates the symlink aws at 
#the /usr/local/bin directory. Using the -b option to create a symlink eliminates the need to specify the install directory
# in the user's $PATH variable. This should enable all users to call the AWS CLI by entering aws from any directory.
sudo ./awscli-bundle/install -i /usr/local/aws -b /usr/local/bin/aws

# 1.verify that docker and docker-compose install was a success on AMI 2 by running the following command:
           #docker-compose version
           #docker version
# 2. Get the docker service status on your AMI instance, run:
           # sudo systemctl status docker.service
# 3.Verify that the AWS CLI installed correctly.
#   aws --version