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