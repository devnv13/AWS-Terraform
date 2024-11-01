# Terraform Link for AWS EKS Cluster
https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eks_cluster

# Verify the following Services using AWS Management Console

Go to Services -> Elastic Kubernetes Service -> Clusters
Verify the following
Overview
Workloads
Configuration
Details
Compute
Networking
Add-Ons
Authentication
Logging
Update history
Tags

Install kubectl CLI
https://docs.aws.amazon.com/eks/latest/userguide/install-kubectl.html

Configure kubeconfig for kubectl
# Configure kubeconfig for kubectl
aws eks --region <region-code> update-kubeconfig --name <cluster_name>
aws eks --region us-east-1 update-kubeconfig --name hr-stag-eksdemo1

# List Worker Nodes
kubectl get nodes
kubectl get nodes -o wide

# Verify Services
kubectl get svc

Connect to EKS Worker Nodes using Bastion Host
# Connect to Bastion EC2 Instance
ssh -i private-key/eks-terraform-key.pem ec2-user@<Bastion-EC2-Instance-Public-IP>
cd /tmp

# Connect to Kubernetes Worker Nodes - Public Node Group
ssh -i private-key/eks-terraform-key.pem ec2-user@<Public-NodeGroup-EC2Instance-PublicIP> 
[or]
ec2-user@<Public-NodeGroup-EC2Instance-PrivateIP>

# Connect to Kubernetes Worker Nodes - Private Node Group from Bastion Host
ssh -i eks-terraform-key.pem ec2-user@<Private-NodeGroup-EC2Instance-PrivateIP>

##### REPEAT BELOW STEPS ON BOTH PUBLIC AND PRIVATE NODE GROUPS ####
# Verify if kubelet and kube-proxy running
ps -ef | grep kube

# Verify kubelet-config.json
cat /etc/kubernetes/kubelet/kubelet-config.json

# Verify kubelet kubeconfig
cat /var/lib/kubelet/kubeconfig

