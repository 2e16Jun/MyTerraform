terraform {
  cloud {
    organization = "2e16jun"

    workspaces {
      name = "my-workspace"
    }
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
    helm = {
      source  = "hashicorp/helm"
      version = ">= 2.7"
    }
    null = {
      source  = "hashicorp/null"
      version = ">= 3.0"
    }
  }

  required_version = ">= 1.2.0"
}

