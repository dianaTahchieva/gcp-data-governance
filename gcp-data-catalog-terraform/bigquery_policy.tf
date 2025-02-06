# Apply a default masking policy to the dataset (optional, dataset-level policy)
resource "google_bigquery_datapolicy" "default_masking_policy" {
  dataset_id = google_bigquery_dataset.multiplexer_dataset.dataset_id
  project    = var.project_id
  location   = var.region
  data_policy_id = "default_masking"
  data_policy_type = "DATA_MASKING_POLICY"
  data_masking_policy {
    predefined_expression = "DEFAULT_MASKING_VALUE"
  }
}