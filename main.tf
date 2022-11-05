terraform {
    required_providers {
        aws = {
            source = "hashicorp/aws"
            version = "4.38.0"
        }
    }
}

provider "aws" {
    region      = "${var.aws_region}"
    access_key  = "${var.aws_access_key}"
    secret_key  = "${var.aws_secret_key}"
    token       = "${var.aws_token}"
}

resource "aws_key_pair" "project01_key" {
    key_name = "project01_key"
    public_key = "${var.aws_public_key}"
}

resource "aws_security_group" "project01_sg" {
    egress = [
        {
            cidr_blocks      = [ "0.0.0.0/0", ]
            description      = ""
            from_port        = 0
            ipv6_cidr_blocks = []
            prefix_list_ids  = []
            protocol         = "-1"
            security_groups  = []
            self             = false
            to_port          = 0
        }
    ]
    ingress = [
        {
            cidr_blocks      = [ "0.0.0.0/0", ]
            description      = ""
            from_port        = 0
            ipv6_cidr_blocks = []
            prefix_list_ids  = []
            protocol         = "-1"
            security_groups  = []
            self             = false
            to_port          = 0
        }
    ]
}

resource "aws_instance" "project01_instance" {
    ami             = "ami-09d3b3274b6c5d4aa"
    instance_type   = "t2.micro"
    tags            = {
        Name = "SimpliLearn Student James C",
        Project = "Terraform Automation"
    }
    key_name        = "project01_key"
    vpc_security_group_ids = [aws_security_group.project01_sg.id]
}
