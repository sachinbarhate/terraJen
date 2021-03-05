provider "aws" {
  access_key = "AKIARKHDULTZRW4U57M4"
  secret_key = "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"
  region     = "us-east-2"
}
terraform {
  backend "s3" {
    bucket         = "terraformstat"
    key            = "terraform.tfstate"
    region         = "us-east-2"
    #dynamodb_table = "javahome-tf"
  }