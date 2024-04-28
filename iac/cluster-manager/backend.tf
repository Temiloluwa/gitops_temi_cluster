terraform {
  cloud {
    organization = "hifeyinc"

    workspaces {
      name = "temi-gitops-cluster"
    }
  }
}