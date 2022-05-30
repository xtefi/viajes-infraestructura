resource "aws_instance" "ec2-eventsdava" {
  instance_type = var.instance_type
  ami = data.aws_ami.amazon-linux-eventsdava.id
  key_name = var.key_name
  subnet_id = data.terraform_remote_state.eventsdava-vpc.outputs.public-subnets
  vpc_security_group_ids = [ aws_security_group.eventsdavasg.id ]
  tags = {
      Name = "Eventsdava-ec2"
  }
}

data "aws_ami" "amazon-linux-eventsdava" {
    most_recent = true
    filter {
        name = "name"
        values = ["amzn2-ami-hvm-*-x86_64*ebs"]
    }
    owners = ["amazon"]
  
}

resource "aws_security_group" "eventsdavasg" {
    name = "eventsdava-sg"
    vpc_id = data.terraform_remote_state.eventsdava-vpc.outputs.vpc-id

    ingress {
      cidr_blocks = [ "0.0.0.0/0" ]
      description = "backEnd"
      from_port = 8080
      to_port = 8080
      ipv6_cidr_blocks = [ "::0/0" ]
      protocol = "tcp"
    }
    ingress {
        description = "database"
        from_port = 3306
        to_port = 3306
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
        ipv6_cidr_blocks = [ "::0/0" ]
    }
    ingress {
        description = "ssh"
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
        ipv6_cidr_blocks = [ "::0/0" ]
    }
    ingress {
        description = "Jenkins-1"
        from_port = 50000
        to_port = 50000
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
        ipv6_cidr_blocks = [ "::0/0" ]
    }
    ingress {
        description = "Jenkins-2"
        from_port = 8081
        to_port = 8081
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
        ipv6_cidr_blocks = [ "::0/0" ]
    }
    egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
    tags = {
        Name = "allow_ssh"
    }
  
}
