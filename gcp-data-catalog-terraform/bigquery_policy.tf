# Apply policy tags to the Customers Table
resource "google_bigquery_table" "customers_table_with_policies" {
  dataset_id = google_bigquery_dataset.multiplexer_dataset.dataset_id
  table_id   = "customers_table_with_policies"
  project    = var.project_id
  deletion_protection = false

  schema = <<EOT
[
  {
    "name": "customer_id",
    "type": "STRING",
    "mode": "REQUIRED",
    "description": "Unique customer identifier",
    "policyTags": {
      "names": ["${google_data_catalog_policy_tag.non_pii_sensitive.name}"]
    }
  },
  {
    "name": "email",
    "type": "STRING",
    "mode": "NULLABLE",
    "description": "Customer email",
    "policyTags": {
      "names": ["${google_data_catalog_policy_tag.pii_sensitive.name}"]
    }
  },
  {
    "name": "phone_number",
    "type": "STRING",
    "mode": "NULLABLE",
    "description": "Customer phone number",
    "policyTags": {
      "names": ["${google_data_catalog_policy_tag.pii_sensitive.name}"]
    }
  }
]
EOT

  # Ensure the policy tag configuration is applied after the tags are created
  depends_on = [
    google_data_catalog_policy_tag.pii_sensitive,
    google_data_catalog_policy_tag.non_pii_sensitive
  ]
}
