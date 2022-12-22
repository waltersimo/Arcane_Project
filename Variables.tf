variable "acces_key_karima" {
    description = "access key"
    type = string
    default = "********"
}

variable "secret_key_karima" {
    description = "secret key"
    type = string
    default = "********"
}

variable "instance_name" {
    description = "Name of the instance to be created"
    type = string
    default = "tf-aws-instance-arcane"
}

variable "instance_type" {
    type = string
    default = "t2.micro"
}

variable "ami_id" {
    description = "The AMI to use"
    type = string
    default = "ami-0cc814d99c59f3789"
}

variable "number_of_instances" {
    description = "Number of instances to be created"
    type = number
    default = 1
}

variable "key_name" {
    type = string
    default = "Key_SSH_Terraform"
}