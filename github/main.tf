terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 5.0"
    }
  }
}

# Configure the GitHub Provider
provider "github" {
  token = var.tk
}

 resource "github_repository" "auto" {

  name = "Terrafrom"

 visibility = "private"

}


output "url" {

value = github_repository.auto.html_url
}

