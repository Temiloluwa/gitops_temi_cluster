terraform {
  cloud {
    organization = "hifeyinc"

    workspaces {
      name = "hyc-cluster-workers"
    }
  }
}