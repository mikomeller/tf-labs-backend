# Private Bucket w/ Tags

# RESOURCE , "RESOURCE_TYPE", "RESOURCE_NAME"
# bucket = globally uq name, eg. project_whatTool_whatRole_accountID, talent_academy-terraform-tfstates-787786425565
# aws accountID (get from aws console "787786425565" https://eu-central-1.console.aws.amazon.com/ec2/home?region=eu-central-1#InstanceDetails:instanceId=i-0ffacdaa1a41da89b)

# 1. ressource s3 bucket , name of ressource
resource "aws_s3_bucket" "talent_academy_bucket" { 
  bucket = "talent-academy-terraform-tfstates-787786425565"

# METADATA 
    # additional parameters
  lifecycle {
    prevent_destroy = true
  }
    # orientation
  tags = {
    Name        = "talent-academy-terraform-tfstates-787786425565"
    Environment = "Test"
    Team = "Talent-Academy"
    Owner = "Miko"
  }
}

# NOT NEEDED STANDARD
# resource "aws_s3_bucket_acl" "example" {
#   bucket = aws_s3_bucket.b.id
#   acl    = "private"
# }

# 2.ressource 
# RESOURCE , "RESOURCE_TYPE", "RESOURCE_NAME"
resource "aws_s3_bucket_versioning" "version_my_bucket" {
  bucket = aws_s3_bucket.talent_academy_bucket.id

  versioning_configuration {
    status = "Enabled"
  }
}


resource "aws_dynamodb_table" "terraform_lock_tbl" {
  name           = "terraform-lock"
  read_capacity  = 1
  write_capacity = 1
  hash_key       = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }

  tags           = {
    Name = "terraform-lock"
  }
}

