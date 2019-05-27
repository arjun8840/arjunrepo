terragrunt = {
  terraform = {
    source = "../modules/services/ec2"

    # The configuration for this backend will be filled in by Terragrunt

  remote_state = {
    backend = "s3"

    config = {
      bucket = "terraform-state-dempa"
      key    = "dempa/t-jenkins-mod.tfstate"
      region = "us-east-1"
      dynamodb_table = "t-jenkins.terraform.state"

      dynamodb_table_tags = {
        owner = "dempa"
        name  = "dempa-table"
      }
    }
  }
}
}
ec2_instance_name = "t-ops-jenkins"
