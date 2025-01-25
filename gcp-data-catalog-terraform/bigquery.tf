# Create a BigQuery Dataset
resource "google_bigquery_dataset" "multiplexer_dataset" {
  dataset_id = "multiplexer_dataset"
  project    = var.project_id
  location   = var.region
}

# Create a BigQuery Table with Policy Tags
resource "google_bigquery_table" "customers_table" {
  dataset_id = google_bigquery_dataset.multiplexer_dataset.dataset_id
  table_id   = "customers_table"
  project    = var.project_id

  schema = <<EOT
[
  {
    "name": "customer_id",
    "type": "STRING",
    "mode": "REQUIRED",
    "description": "Unique customer identifier",
    "policyTags": {
      "names": ["${google_data_catalog_policy_tag.non_pii_sensitive.id}"]
    }
  },
  {
    "name": "email",
    "type": "STRING",
    "mode": "NULLABLE",
    "description": "Customer email",
    "policyTags": {
      "names": ["${google_data_catalog_policy_tag.pii_sensitive.id}"]
    }
  },
  {
    "name": "phone_number",
    "type": "STRING",
    "mode": "NULLABLE",
    "description": "Customer phone number",
    "policyTags": {
      "names": ["${google_data_catalog_policy_tag.pii_sensitive.id}"]
    }
  }
]
EOT
}
