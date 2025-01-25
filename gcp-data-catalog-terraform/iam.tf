# Create a service account for Terraform
resource "google_service_account" "terraform_sa" {
  account_id   = "terraform-sa"
  display_name = "Terraform Service Account"
  project      = var.project_id  # Ensure the project is explicitly set
}

# Create a service account for dbt
resource "google_service_account" "dbt_sa" {
  account_id   = "dbt-sa"
  display_name = "dbt Service Account"
  project      = var.project_id  # Ensure the project is explicitly set
}

# Assign Data Catalog Admin role to the Terraform service account
resource "google_project_iam_member" "datacatalog_admin_terraform" {
  project = var.project_id
  role    = "roles/datacatalog.admin"
  member  = "serviceAccount:${google_service_account.terraform_sa.email}"
}

# Assign BigQuery Data Editor role to the dbt service account
resource "google_project_iam_member" "bigquery_editor_dbt" {
  project = var.project_id
  role    = "roles/bigquery.dataEditor"
  member  = "serviceAccount:${google_service_account.dbt_sa.email}"
}

# Assign Policy Tag Reader to dbt service account to access policy-tagged fields
resource "google_project_iam_member" "policy_tag_reader_dbt" {
  project = var.project_id
  role    = "roles/datacatalog.categoryFineGrainedReader"
  member  = "serviceAccount:${google_service_account.dbt_sa.email}"
}
