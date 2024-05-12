provider "google" {
    project = var.project_id
    zone = var.zone
    credentials = file ("devops-423109-631f4db9e88e.json") 
}

terraform {
  required_providers {
    google = {
        version = "~>5.28.0"
    }
    github = {
      source  = "integrations/github"
      version = "~> 5.0"
    }
  }
  
  required_version = "~>1.7.5"
  
}

# Configure the GitHub Provider
provider "github" {
  token = "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"
}

resource "github_repository" "devops" {
  name        = "devops"
  description = "my devops work"

  visibility = "public"
}


terraform {
  backend "gcs" {
    bucket = "pratt-bucket"
    credentials = "devops-423109-631f4db9e88e.json"
  }
}