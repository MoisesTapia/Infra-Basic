provider "aws" {
    region = "us-east-2" 
}

resource "aws_instance" "linux2" {
    instance_type   = var.instance_type
    ami             = var.ami

    tags = {
        
        Name = var.tags
    }

    vpc_security_group_ids = [aws_security_group.instance.id]

    user_data = <<-EOF

                #!/bin/bash
                sudo amazon-linux-extras install nginx1.12 -y
                sudo service nginx start
                EOF

}

resource "aws_security_group" "instance" {

    name    = var.name_sg

    ingress {

        from_port   = var.http_port
        to_port     = var.http_port
        protocol    = var.protocol
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {

        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]

    }
}

