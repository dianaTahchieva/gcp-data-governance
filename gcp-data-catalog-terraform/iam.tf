# Give the Terraform user permissions to manage IAM, Dataplex, and BigQuery
resource "google_project_iam_member" "terraform_bigquery_admin" {
  project = var.project_id
  role    = "roles/bigquery.admin"
  member  =  "serviceAccount:terraform-sa@gcp-data-governance.iam.gserviceaccount.com" #"user:YOUR_EMAIL@example.com" # Replace with your user or Terraform SA
}

resource "google_project_iam_member" "terraform_datacatalog_admin" {
  project = var.project_id
  role    = "roles/datacatalog.admin"
  member  = "serviceAccount:terraform-sa@gcp-data-governance.iam.gserviceaccount.com"
}

resource "google_project_iam_member" "terraform_dataplex_admin" {
  project = var.project_id
  role    = "roles/dataplex.admin"
  member  = "serviceAccount:terraform-sa@gcp-data-governance.iam.gserviceaccount.com"
}

resource "google_project_iam_member" "terraform_sa_admin" {
  project = var.project_id
  role    = "roles/iam.serviceAccountAdmin"
  member  = "serviceAccount:terraform-sa@gcp-data-governance.iam.gserviceaccount.com"
}

