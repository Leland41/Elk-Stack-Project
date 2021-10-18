#!/bin/bash


#This script will:
# Lists all docker machines
# Starts container "affectionate_kilby"
# Lists all running containers 
# Activates a shell for "affectionate_kilby"

#Make sure to run this command with sudo privileges

# This command lists all containers

  docker container list -a

#This command will start container affectionate_kilby

  docker start affectionate_kilby

#This command will list all running containers

  docker ps

# This command will activate a shell to container affectionate_kilby

  docker attach affectionate_kilby