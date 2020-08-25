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