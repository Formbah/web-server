# Create VPC name Variable
variable "vpc_name" {
    type        = string
    default     = "default_vpc"
    description = "vpc name" 
}
# Create vpc cidr variable
variable "vpc_cidr" {
    type        = string
    default     = "10.0.0.0/16"
    description = "vpc cidr"
}
# Create public cidr variable
variable "pub_cidr" {
    type        = string
    default     = "10.0.4.0/24"
    description = "public subnet cidr"
}
# Create private cidr variable
variable "pri_cidr" {
    type        = string
    default     = "10.0.8.0/24"
    description = "private subnet cidr" 
}
# Create availability zone variable
variable "azs" {
    type        = list
    default     = ["us-east-1a", "us-east-1b"]
    description = "availability zones"
}
# Create ec2 ami variable
variable "ec2_ami" {
    type        = string
    default     = "ami-04a0ae173da5807d3"
    description = "ec2 ami"
}
# Create ec2 instance type variable
variable "ec2_instance_type" {
    type        = string
    default     = "t2.micro"
    description = "ec2 instance type"
}
# Create Security Group variable
variable "sg" {
    type        = string
    default     = "security_group"
    description = "security group"
}
# Create ingress rules
variable "ingressrules" {
    type        = list
    default     = [80, 443, 22]
    description = "inbound rules"
}
#Create egress rules
variable "egressrules" {
    type        = list
    default     = [80, 443, 22]
    description = "outbound rules"
}