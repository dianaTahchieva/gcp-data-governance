#Run these commands to create your service accounts:
#gcloud iam service-accounts create terraform-sa --display-name "Terraform Service Account" --project gcp-data-governance
#gcloud iam service-accounts create dbt-sa --display-name "dbt Service Account" --project gcp-data-governance
#Run these commands to get the email of your newly created service accounts:
#gcloud iam service-accounts list --filter="displayName:Terraform Service Account" --format="value(email)"
#gcloud iam service-accounts list --filter="displayName:dbt Service Account" --format="value(email)"


# Give the Terraform user permissions to manage IAM, Dataplex, and BigQuery
resource "google_project_iam_member" "terraform_bigquery_admin" {
  project = var.project_id
  role    = "roles/bigquery.admin"
  member  =  "serviceAccount:terraform-sa@gcp-data-governance.iam.gserviceaccount.com" 
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
