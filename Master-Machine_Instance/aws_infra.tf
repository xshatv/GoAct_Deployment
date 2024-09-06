# Providers Block ----------
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}
# Configure the AWS Provider
provider "aws" {
  region = "ap-south-1"
}

# Resource Block ----------
# Create a VPC
resource "aws_vpc" "my_vpc" {
  cidr_block       = "20.0.0.0/16"
  instance_tenancy = "default"
  tags = {
    Name = "My_VPC"
  }
}
# Create Subnet
resource "aws_subnet" "public_subnet" {
  vpc_id     = aws_vpc.my_vpc.id
  cidr_block = "20.0.10.0/24"    # Sub-CIDR of VPC
  availability_zone = "ap-south-1a"
  map_public_ip_on_launch = true
  tags = {
    Name = "Public"
  }
}
resource "aws_subnet" "private_subnet" {
 vpc_id         = aws_vpc.my_vpc.id
 cidr_block     = "20.0.20.0/24"
 availability_zone = "ap-south-1b"
 #map_public_ip_on_launch = false
 tags = {
  Name = "Private"
 }
}
# Create Internet Gateway
resource "aws_internet_gateway" "my_igw" {
  vpc_id = aws_vpc.my_vpc.id
  tags = {
    Name = "My_Internet_Gateway"
  }
}
# Create Route Table
resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.my_vpc.id
  route {
    cidr_block      = "0.0.0.0/0"
    gateway_id      = aws_internet_gateway.my_igw.id # Attaching Internet Gateway
  }
  route {
    ipv6_cidr_block = "::/0"
    gateway_id      = aws_internet_gateway.my_igw.id
  }
  tags = {
    Name = "Public_Route_Table"
  }
}
# Subnet & Route table association
resource "aws_route_table_association" "a" {
  subnet_id         = aws_subnet.public_subnet.id
  route_table_id    = aws_route_table.public_rt.id
}
#resource "aws_route_table_association" "b" {
#  subnet_id         = aws_subnet.private_subnet.id
#  route_table_id    = aws_route_table.public_rt.id
#}
# Create Security Group - All Traffic
resource "aws_security_group" "new-vpc-sg" {
  name        = "new-vpc-sg"
  description = "new SG in new VPC"
  vpc_id      = aws_vpc.my_vpc.id

  ingress {
    description = "Allow all traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    description = "Allow all IP and Ports outbound"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
  Name = "New_VPC_SG"
 }
}
# Create an EC2 instance
resource "aws_instance" "my_instance" {
  ami           = "ami-0f58b397bc5c1f2e8"  # Ubuntu (or choose your preferred AMI)
  instance_type = "t2.micro"  # Change to your desired instance type
  key_name      = "ap-south1-new"
  subnet_id     = aws_subnet.public_subnet.id
  vpc_security_group_ids = [aws_security_group.new-vpc-sg.id]  # Use security group ID instead of name
#  vpc_id        = aws_vpc.my_vpc.id
  associate_public_ip_address     = true
  tags = {
  Name = "Jenkins_Master"
 }
  # User data script to install git, java and jenkins
  user_data = "${file("jenkins-master.sh")}"
}

resource "aws_instance" "my_instance2" {
  ami           = "ami-0f58b397bc5c1f2e8"  # Ubuntu (or choose your preferred AMI)
  instance_type = "t2.medium"  # Change to your desired instance type
  key_name      = "ap-south1-new"
  subnet_id     = aws_subnet.public_subnet.id
  vpc_security_group_ids = [aws_security_group.new-vpc-sg.id]  # Use security group ID instead of name
#  vpc_id        = aws_vpc.my_vpc.id
  associate_public_ip_address     = true
  tags = {
  Name = "Minikube-Docker"
 }
  # User data script to install docker and minikube
  user_data = "${file("minikube-docker.sh")}"
}

resource "aws_instance" "my_instance3" {
   ami           = "ami-0f58b397bc5c1f2e8"  # Ubuntu (or choose your preferred AMI)
   instance_type = "t2.micro"  # Change to your desired instance type
   key_name      = "ap-south1-new"
   subnet_id     = aws_subnet.public_subnet.id
   vpc_security_group_ids = [aws_security_group.new-vpc-sg.id]  # Use security group ID instead of name
#   vpc_id        = aws_vpc.my_vpc.id
   associate_public_ip_address     = true
   tags = {
   Name = "Ansible-Master"
  }
   # User data script to install ansible
   user_data = "${file("ansible-master.sh")}"
}

output "private_ip_jenkins-master" {
  value = aws_instance.my_instance.private_ip
  description = "The private IP address of the Jenkins-Master instance."
}
output "private_ip_minikube-docker"{
  value = aws_instance.my_instance2.private_ip
  description = "The private IP address of the Minikube-Docker instance."
}
output "private_ip_ansible-master" {
   value = aws_instance.my_instance3.private_ip
   description = "The private IP address of the Ansible-Master instance."
}
