# Automated ELK Stack Deployment:



The files in this repository were used to configure the network depicted below.

  ![alt text](https://github.com/Leland41/Project-1-Portfolio/blob/main/Diagrams/Red_Team_Elk_Season_Diagram.png) "Red Team Elk Season Diagram"

These files have been tested and used to generate a live ELK deployment on Azure. They can be used to either recreate the entire deployment pictured above. Alternatively, select portions of the playbook file may be used to install only certain pieces of it, such as Filebeat.


* [Install-elk.yml](https://github.com/Leland41/Project-1-Portfolio/blob/main/Ansible/Install-elk.yml)

* [Pentest.yml (DVWA)](https://github.com/Leland41/Project-1-Portfolio/blob/main/Ansible/Pentest.yml)

* [Filebeat-playbook.yml](https://github.com/Leland41/Project-1-Portfolio/blob/main/Ansible/Filebeat-playbook.yml)

* [MetricBeat-playbook.yml](https://github.com/Leland41/Project-1-Portfolio/blob/main/Ansible/Metricbeat-playbook.yml)

This document contains the following details:

Description of the Topology
Access Policies
ELK Configuration
Beats in Use
Machines Being Monitored 
How to Use the Ansible Build



# Description of the Topology:



The main purpose of this network is to expose a load-balanced and monitored instance of DVWA, the D*mn Vulnerable Web Application.

Load balancing ensures that the application will be highly available and reliable, in addition to restricting access to the network.

Load balancers protect against DDos attacks by redirecting external traffic from one server to another. This helps limit single points of failure within a network, increases the scalability and improves redundancy. 
 
The advantage of a jump box is that it acts as a gateway router. It creates another layer of security to “sit” in front of other machines that are not exposed to the internet. It creates a fanning in effect and controls access to these machines by configuring connections from specific IP addresses and forwarding to those machines.  

Integrating an ELK server allows users to easily monitor the vulnerable VMs for changes to the log files and system resources.

* Filebeat monitors the log files or locations that you specify, collects log events, and forwards them either to Elaticsearch or Logstash for indexing. 

* Metricbeat helps monitor servers by collecting metrics from the system and services running on the server

The configuration details of each machine may be found below:

| Name | Function | IP Address | Operating System | Size |
|---|---|---|---|---|
| Jump Box Provisioner | Gateway | 10.0.0.4 | Linux (ubuntu 18.04) | Standard B1s (1 vcpus, 1 GiB memory) |
| Web-1  | Virtual Machine | 10.0.0.5 | Linux (ubuntu 18.04) | Standard B1ms (1 vcpus, 2 GiB memory) |
| Web-2  | Virtual Machine | 10.0.0.6 | Linux (ubuntu 18.04) | Standard B1ms (1 vcpus, 2 GiB memory) |
| Web-3  | Virtual Machine | 10.0.0.7 | Linux (ubuntu 18.04) | Standard B1ms (1 vcpus, 2 GiB memory) |
| Elk Season Virtual Machine | Virtual Machine/Elk Stack | 10.1.0.4 | Linux (ubuntu 18.04) | Standard D2s v3 (2 vcpus, 8 GiB memory) |



# Access Policies:



The machines on the internal network are not exposed to the public Internet. 

Only the Jump Box machine can accept connections from the Internet. Access to this machine is only allowed from the following IP addresses:

* Local machine:174.63.123.24

Machines within the network can only be accessed by the Jump Box.

* Jump Box Provisioner
..* Public IP: 168.62.205.122
..* Private IP: 10.0.0.4

After gaining access to the Jump Box, the Elk_Season virtual machine can only be accessed through SSH (port 22) via the Docker container.

A summary of the access policies in place can be found in the table below.


| Name  | Publicly Accessible | Exposed Ports | Allowed IP Addresses |
|---|---|---|---|
| Jump Box Provisioner  | Yes | 22,80  | Local Desktop Public IP: 174.63.123.24 |
| Web-1 | No | 22,80 | Jump Box Provisioner Private IP: 10.0.0.4 Load Balancer Public IP: 13.87.190.223 |
| Web-2  | No  | 22,80  | Jump Box Provisioner Private IP: 10.0.0.4 Load Balancer Public IP: 13.87.190.223 |
| Web-3 | No | 22,80 | Jump Box Provisioner Private IP: 10.0.0.4 Load Balancer Public IP: 13.87.190.223 |
| Elk Season Virtual Machine | No  | 22,80,5601,9200  | Local Desktop Public IP: 174.63.123.24 Jump Box Provisioner Private IP: 10.0.0.4 |



# Elk Configuration:



Ansible was used to automate configuration of the ELK machine. No configuration was performed manually, which is advantageous because...

The main advantage of automating configurations with Ansible is to reduce configuration errors and allows organizations to free up resources from manually completing tasks. Ansible also provides scalability and redundancy disaster recovery to an organization’s infrastructure. 

The playbook implements the following tasks:

* Install docker.io: Installs the docker engine, used for running containers.
* Install python3-pip: this step installs the Python 3 version of pip. Pip is a package manager tool of python that allows a user to install additional packages that aren’t part of a standard library. 
* Install docker module: This step installs any necessary docker modules necessary for the Elk docker container to run.
* Use more memory: Configures the Elk VM to use more memory. The Elk container won’t run without this setting.
* Download and launch a docker elk container: This step downloads the Elk docker container and starts it with the specified ports.
  Specified Ports:
   5601:5601
   9200:9200
   5044:5044

The following screenshot displays the result of running `docker ps` after successfully configuring the ELK instance.


![alt text][logo 2]

[logo 2]: https://github.com/Leland41/Project-1-Portfolio/blob/main/Images/Docker.ps.PNG "Docker PS Image"



# Target Machines & Beats



This ELK server is configured to monitor the following machines:

* Web-1 10.0.0.5
* Web-2 10.0.0.6
* Web-3 10.0.0.7
* Elk-Season-Virtual-Machine 10.1.0.4

We have installed the following Filebeat and Metricbeat on these machines:

These Beats allow us to collect the following information from each machine:

Filebeat generates and organizes log files to send to Logstash and Elasticsearch. It logs information about the file system, including files, when those files have changed and timestamps of those changes. 

* [Example of Filebeat](https://github.com/Leland41/Project-1-Portfolio/blob/main/Images/filebeat%20example.PNG)

Metricbeat helps monitor servers by collecting metrics from the system and services running on the server. 

* [Example of Metricbeat](https://github.com/Leland41/Project-1-Portfolio/blob/main/Images/MetricBeat%20example.PNG)



# Using the Playbook:



In order to use the playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned: 

SSH into the control node and follow the steps below:
* Copy the install_elk.yml file to /etc/ansible/roles/install_elk.yml
* Update the hosts file to include elk and destination IP of the elk server.

* [Host-Ansible-file](https://github.com/Leland41/Project-1-Portfolio/blob/main/Ansible/Hosts-Ansible-file)

* Run the playbook: ansible-playbook /etc/ansible/roles/install_elk.yml
* Navigate to http://20.106.148.113:5601/app/kibana#/home to ensure the installation is successful.

A successcul session looks like:


![alt text][logo 3]

[logo 3]: https://github.com/Leland41/Project-1-Portfolio/blob/main/Images/Part5%20of%20Elk%20Project%20Kibana.PNG "Working Kibana" 
