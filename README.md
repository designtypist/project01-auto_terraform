# Project 1 - Create EC2 using Terraform
>>First project using Terraform to automate the creation of AWS EC2 instance that you can SSH into

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
