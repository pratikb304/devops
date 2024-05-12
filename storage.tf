resource "google_storage_bucket" "default" {
    name = "pratt-bucket"
    project = var.project_id
    location = "US"
    uniform_bucket_level_access = true
    force_destroy = "true"
    
}