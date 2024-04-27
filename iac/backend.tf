terraform {
  cloud {
    organization = local.tf_cloud.organization

    workspaces {
      name = local.tf_cloud.workspace
    }
  }
}