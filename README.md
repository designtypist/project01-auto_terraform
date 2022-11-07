# Project 1 - Create EC2 using Terraform
>>First project using Terraform to automate the creation of AWS EC2 instance that you can SSH into

## Fill in your AWS Credentials
1) Create a copy of "terraform.tfvars.example" and name it "terraform.tfvars"
2) Replace the fillers with your AWS credentials

## Apply the configuration
`
terraform apply
`

## Once applied, get the ip address of the created ec2 instance
`
terraform state show aws_instance.project_vm | grep public_ip
`

## SSH to the ec2 instance
`
ssh ubuntu@<ip-address>
`
