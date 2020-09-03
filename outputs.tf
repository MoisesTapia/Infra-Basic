# Author: Moises Tapia
# Instance

output "aws_instance" {
    value = aws_instance.linux2.id
}

output "ec2_instance_ami" {
    value = aws_instance.linux2.ami
}
# Security Group

output "security_group_id" {
    value = aws_security_group.instance.id
}

output "secgroup_public_ip" {
    value = aws_instance.linux2.public_ip
}

output "secgroup_av_zone" {
    value = aws_instance.linux2.availability_zone
}

# VPC 
output "vpc_group" {
    value = aws_instance.linux2.vpc_security_group_ids
}

output "vpc_id" {
    value = data.aws_vpc.default_vpc.id
}