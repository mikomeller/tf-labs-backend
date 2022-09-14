terraform {
  backend "s3" {
    bucket = "talent-academy-terraform-tfstates-787786425565"
    key    = "sprint1/week2/training-terraform/terraform.tfstates"
    dynamodb_table = "terraform-lock"
  }
}