provider "aws" {
  access_key = "AKIARKHDULTZRW4U57M4"
  secret_key = "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"
  region     = var.region
}
terraform {
  backend "s3" {
    bucket     = "terraformstat"
    key        = "terraform.tfstate"
    region     = "us-east-2"
    access_key = "AKIARKHDULTZRW4U57M4"
    secret_key = "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"
    #dynamodb_table = "javahome-tf"
  }
}