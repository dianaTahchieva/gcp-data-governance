resource "google_service_account" "terraform_sa" {
  account_id   = "terraform-sa"
  display_name = "Terraform Service Account"
  project      = var.project_id
}

resource "google_service_account" "dbt_sa" {
  account_id   = "dbt-sa"
  display_name = "dbt Service Account"
  project      = var.project_id
}

resource "google_project_iam_member" "datacatalog_admin_terraform" {
  project = var.project_id
  role    = "roles/datacatalog.admin"
  member  = "serviceAccount:${google_service_account.terraform_sa.email}"
}

resource "google_project_iam_member" "bigquery_data_editor_dbt" { # More precise role
  project = var.project_id
  role    = "roles/bigquery.dataEditor" # Allows dbt to modify tables, needed for policy tag application.
  member  = "serviceAccount:${google_service_account.dbt_sa.email}"
}

resource "google_project_iam_member" "policy_tag_reader_dbt" {
  project = var.project_id
  role    = "roles/datacatalog.categoryFineGrainedReader"
  member  = "serviceAccount:${google_service_account.dbt_sa.email}"
}

# Add Masked Reader role for dbt (if needed for data masking)
resource "google_project_iam_member" "masked_reader_dbt" {
  project = var.project_id
  role    = "roles/bigquerydatapolicy.maskedReader"
  member  = "serviceAccount:${google_service_account.dbt_sa.email}"
}


#Example for a Transformer role (adjust as needed)
resource "google_project_iam_member" "transformer_role" {
  project = var.project_id
  role    = "roles/bigquery.dataEditor" # Or a custom role with only necessary permissions.
  member  = "group:transformer_group_email@corp.com" # Replace with your group email.
}