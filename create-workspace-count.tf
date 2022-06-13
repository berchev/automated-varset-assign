resource "tfe_workspace" "test" {
  count = 5
  name         = "workspace_${count.index}"
  organization = "TFC_ORGANIZATION"
  queue_all_runs = false

  vcs_repo {
    identifier = "berchevorg/aws_provider_resource"
    oauth_token_id = "ot-XXXXXXXXXXXXXXXXXX"
  }
}
