# kojitechs-ci-cd-demo-infra-pipeline-tf

# connect to jenkins server:
http://<publicIP>:8080/

## Install plugins
Go to `manage jenkins`, `manage plugins` `Available Plugins`
- sonarqube scanner 
- slack notification
- Quality Gates
- aws steps

# Edit jenkins bash profile:
vi ~/.bash_profile

M2_HOME=/opt/maven/apache-maven-3.8.7/bin
PATH=$PATH:$HOME/bin:$M2_HOME
export PATH
## configure maven 
```sh
source ~/.bash_profile
```
# make sure you only have java 11 instead java 17:

openjdk version "17.0.6" 2023-01-17 LTS
OpenJDK Runtime Environment Corretto-17.0.6.10.1 (build 17.0.6+10-LTS)
OpenJDK 64-Bit Server VM Corretto-17.0.6.10.1 (build 17.0.6+10-LTS, mixed mode, sharing)

# install java 11:
sudo yum install java-11-amazon-corretto-headless
sudo yum remove java-17-amazon-corretto-headless

# verify make make sure you have java 11:
java --version

# Expect this:
openjdk version "11.0.18" 2023-01-17 LTS
OpenJDK Runtime Environment Corretto-11.0.18.10.1 (build 11.0.18+10-LTS)
OpenJDK 64-Bit Server VM Corretto-11.0.18.10.1 (build 11.0.18+10-LTS, mixed mode)

### 
#####Setting up webhook configuration for jenkins and github
```hcl
http://18.205.191.218:8080/github-webhook/
```
### Configuring maven on jenkins
echo $M2_HOME
/opt/maven/apache-maven-3.8.7

### Now go to manage cred

create a token for sonarqube
create a token for slack(it's only me!!)

### Sonarqube weebhook
http://3.145.169.209:8080/sonarqube-webhook/

### jenkins weebhook with github
http://174.129.86.6:8080/github-webhook/

## Assign shell to jenkins user 
```sh
vi /etc/passwd 
change shell from /bin/fasle to /bin/bash
```
```
maven {
    3.8.1
}
```
### Slack notification
```
slack notification
global configuration
```
### configuring sonarqube server
```
manage plugin
SonarQube ScannerVersion
2.15
Sonar Quality GatesVersion
1.3.1
Blue OceanVersion
1.27.0
```
configure system.
```
SonarQube servers
add SonarQube
name: sonar 
Server URL: http://18.206.246.242:9000
```
3. 
Go to SonarQube server and generate a token 
- sign in
username: admin
password: admin
- Create a jenkins user 
- generate a token

4. 
###  Configure quality Gate
Go to sonarqube server 
- create a webhook 
administration
webhooks
- create webhook
name: jenkins
URL: http://18.205.191.218:8080/sonarqube-webhook/

### Tools to connect with eks cluster 
```
aws-cli 
kubectl
```
## How to connect to eks cluster 
```
aws eks --region us-east-1 update-kubeconfig  --name ci-cd-demo-eks-demo
```
## Troubleshooting
```sh
rm ~/.kube/config

```
# Kubernetes  - PODs




kojitechs-ci-cd-demo-infra-pipeline-tf
connect to jenkins server:
http://<publicIP>:8080/

## Install plugins
Go to manage jenkins, manage plugins

sonarqube scanner
slack notification
Quality Gates
aws steps

## Edit jenkins bash profile
#Edit jenkins bash profile
vi ~/.bash_profile

M2_HOME=/opt/maven/apache-maven-3.8.7/bin
PATH=$PATH:$HOME/bin:$M2_HOME
export PATH
make sure you only have java 11 instead java 17
openjdk version "17.0.6" 2023-01-17 LTS
OpenJDK Runtime Environment Corretto-17.0.6.10.1 (build 17.0.6+10-LTS)
OpenJDK 64-Bit Server VM Corretto-17.0.6.10.1 (build 17.0.6+10-LTS, mixed mode, sharing)
install java 11
sudo yum install java-11-amazon-corretto-headless
sudo yum remove java-17-amazon-corretto-headless
verify make make sure you have java 11
java -version
Expect this
openjdk version "11.0.18" 2023-01-17 LTS
OpenJDK Runtime Environment Corretto-11.0.18.10.1 (build 11.0.18+10-LTS)
OpenJDK 64-Bit Server VM Corretto-11.0.18.10.1 (build 11.0.18+10-LTS, mixed mode)
configure maven maven on jenkins
echo $M2_HOME
/opt/maven/apache-maven-3.8.7
Now go to manage cred
create a token for sonarqube
create a token for slack(it's only me!!)
Sonarqube weebhook
http://3.145.169.209:8080/sonarqube-webhook/
jenkins weebhook with github
Setting up webhook configuration for jenkins and github

http://174.129.86.6:8080/github-webhook/
Configuring maven
Assign shell to jenkins user
vi /etc/passwd 
change shell from /bin/fasle to /bin/bash
maven {
    3.8.1
}
Slack notification
slack notification
global configuration
configuring sonarqube server
manage plugin
SonarQube ScannerVersion
2.15
Sonar Quality GatesVersion
1.3.1
Blue OceanVersion
1.27.0
configure system.

SonarQube servers
add SonarQube
name: sonar 
Server URL: http://18.206.246.242:9000
Go to SonarQube server and generate a token

sign in username: admin password: admin
Create a jenkins user
generate a token
Configure quality Gate
Go to sonarqube server

create a webhook administration webhooks
create webhook name: jenkins URL: http://18.205.191.218:8080/sonarqube-webhook/
Tools to connect with eks cluster
aws-cli 
kubectl
How to connect to eks cluster
aws eks --region us-east-1 update-kubeconfig  --name ci-cd-demo-eks-demo
Troubleshooting
rm ~/.kube/config
Kubernetes - PODs
- managed EKS cluster as the main an Admin using RBAC and kubernetes Role and Role binding to fine-Grain access to the cluster. 
- Using helm to create stable charts release and deploy  applications to EKS cluster
- Setup cloudwatch inside and Data Dog to get inside on application running on the cluster
Requirements
Name	Version
terraform	>=1.1.0
aws	~> 4.0
Providers
Name	Version
aws	~> 4.0
Modules
Name	Source	Version
vpc	terraform-aws-modules/vpc/aws	n/a
Resources
Name	Type
aws_ecr_repository.this	resource
aws_eks_cluster.eks_cluster	resource
aws_eks_node_group.eks_nodegroup	resource
aws_iam_instance_profile.instance_profile	resource
aws_iam_instance_profile.jenkins_instance_profile	resource
aws_iam_policy.policy	resource
aws_iam_policy.this	resource
aws_iam_role.eks_master_role	resource
aws_iam_role.eks_nodegroup_role	resource
aws_iam_role.jenkins_ssm_fleet_ec2	resource
aws_iam_role_policy_attachment.ec2_policy_attach	resource
aws_iam_role_policy_attachment.eks-AmazonEC2ContainerRegistryReadOnly	resource
aws_iam_role_policy_attachment.eks-AmazonEKSClusterPolicy	resource
aws_iam_role_policy_attachment.eks-AmazonEKSVPCResourceController	resource
aws_iam_role_policy_attachment.eks-AmazonEKSWorkerNodePolicy	resource
aws_iam_role_policy_attachment.eks-AmazonEKS_CNI_Policy	resource
aws_iam_role_policy_attachment.role_policy_attach	resource
aws_instance.jenkins-server	resource
aws_instance.sonarqube-server	resource
aws_security_group.jenkins_sg	resource
aws_security_group.sonarqube_sg	resource
aws_security_group_rule.egress_access_from_everywhere	resource
aws_security_group_rule.egress_access_saonrqube_from_everywhere	resource
aws_security_group_rule.ingress_access_on_http	resource
aws_security_group_rule.ingress_sonarqube_access_on_http	resource
aws_security_group_rule.this	resource
aws_ami.ami	data source
aws_availability_zones.available	data source
Inputs
Name	Description	Type	Default	Required
cluster_endpoint_private_access	Indicates whether or not the Amazon EKS private API server endpoint is enabled.	bool	false	no
cluster_endpoint_public_access	Indicates whether or not the Amazon EKS public API server endpoint is enabled. When it's set to false ensure to have a proper private access with cluster_endpoint_private_access = true.	bool	true	no
cluster_endpoint_public_access_cidrs	List of CIDR blocks which can access the Amazon EKS public API server endpoint.	list(string)	
[
  "0.0.0.0/0"
]
no
cluster_service_ipv4_cidr	(optional) describe your variable	string	null	no
cluster_version	Kubernetes minor version to use for the EKS cluster (for example 1.21)	string	null	no
component_name	(optional) describe your variable	string	"ci-cd-demo"	no
Outputs
Name	Description
aws-ecr-repo	the name of aws ecr repo
cluster_arn	The Amazon Resource Name (ARN) of the cluster.
cluster_certificate_authority_data	Nested attribute containing certificate-authority-data for your cluster. This is the base64 encoded certificate data required to communicate with your cluster.
cluster_endpoint	The endpoint for your EKS Kubernetes API.
cluster_iam_role_arn	IAM role ARN of the EKS cluster.
cluster_iam_role_name	IAM role name of the EKS cluster.
cluster_id	The name/id of the EKS cluster.
cluster_oidc_issuer_url	The URL on the EKS cluster OIDC Issuer
cluster_primary_security_group_id	The cluster primary security group ID created by the EKS cluster on 1.14 or later. Referred to as 'Cluster security group' in the EKS console.
cluster_version	The Kubernetes server version for the EKS cluster.
jenkins-host-ip	Jenkins host public IP address
node_group_public_arn	Node Group ARN
node_group_public_id	Node Group ID
node_group_public_status	Public Node Group status
node_group_public_version	Public Node Group status
private_subnets	n/a
sonarqube-host-ip	Jenkins host public IP address
vpc_id	n/a
Authors
This module was build and maintained by kojibello. For any further questions you and reach me on Number