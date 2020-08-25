variable "region"{
    description = ""
    type = string
}

variable "tags"{
    description = ""
    type = string
}

variable "instance_type"{
    description = ""
    type = string
}

variable "ami"{
    description = ""
    type = string
}

variable "name_sg"{
    description = ""
    type = string
}

#variable "http_port"{
#    description = ""
#}

variable "protocol_net"{
    description = ""
    type = string
}

variable "ingressrules"{
    description = ""
    type = list(number)
}

variable "egressrules"{
    description = ""
    type = list(number)
}
