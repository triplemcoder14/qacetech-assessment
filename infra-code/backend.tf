terraform {
  backend "s3" {
    bucket         = "qacetech-terraform-state"
    key            = "sinatra/deployment.tfstate"
    region         = "us-east-1"
    dynamodb_table = "qacetech-terraform-locks"
    encrypt        = true
  }
}
