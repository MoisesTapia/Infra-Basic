resource "aws_security_group" "instance" {

    name    = var.name_sg
    
    #
    #ingress {
    #
    #    from_port   = var.http_port
    #    to_port     = var.http_port
    #    protocol    = var.protocol
    #    cidr_blocks = ["0.0.0.0/0"]
    #}
    #
    #egress {
    #
    #    from_port   = 0
    #    to_port     = 0
    #    protocol    = "-1"
    #    cidr_blocks = ["0.0.0.0/0"]
    #
    #}
    dynamic "ingress" {
        iterator        = port
        for_each        = var.ingressrules
        content {
            from_port   = port.value
            to_port     = port.value
            protocol    = var.protocol_net
            cidr_blocks = ["0.0.0.0/0"]
        }
    }

    dynamic "egress" {
        iterator        = port
        for_each        = var.egressrules
        content {
            from_port   = port.value
            to_port     = port.value
            protocol    = var.protocol_net
            cidr_blocks = ["0.0.0.0/0"]
        }
    }

}