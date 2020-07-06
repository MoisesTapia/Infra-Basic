provider "aws" {
    region = "us-west-2" 
}

resource "aws_instance" "linux2" {
    instance_type   = "t2.micro"
    ami             = "id_instance"


    tags = {
        
        Name = "InfraBasic"
    }

    vpc_security_group_ids = [aws_security_group.instance.id]

    user_data = <<-EOF

                #!/bin/bash
                sudo amazon-linux-extras install nginx1.12 -y
                sudo service nginx start
                EOF

}

resource "aws_security_group" "instance" {

    name    = "terraform-example-sg"

    ingress {

        from_port   = 80
        to_port     = 80
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {

        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]

    }
}