terraform {

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region     = "eu-west-3"
  access_key = "${var.acces_key_karima}"
  secret_key = "${var.secret_key_karima}"

}

# store tfstate in s3 and locking information in DynamoDB
  terraform {
    backend "s3" {
      encrypt = true
      # cannot contain interpolations
      # bucket = "${aws_s3_bucket.terraform-state-storage-s3.bucket}"
      bucket = "arcane-terraform-state-s3"
      # region = "${aws_s3_bucket.terraform-state-storage-s3.region}"
      region = "eu-west-3"
      access_key = "********"
      secret_key = "********"
      # dynamodb_table = "example-iac-terraform-state-lock-dynamo"
      key = "terraform-state/terraform.tfstate"
    }
  }
