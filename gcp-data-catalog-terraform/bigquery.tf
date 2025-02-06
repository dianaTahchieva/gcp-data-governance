resource "google_bigquery_dataset" "multiplexer_dataset" {
  dataset_id = "multiplexer_dataset"
  project    = var.project_id
  location   = var.region
  deletion_protection = false # Allow deletion for easier testing
}

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
    "description": "Unique customer identifier"
  },
  {
    "name": "email",
    "type": "STRING",
    "mode": "NULLABLE",
    "description": "Customer email"
  },
  {
    "name": "phone_number",
    "type": "STRING",
    "mode": "NULLABLE",
    "description": "Customer phone number"
  }
]
EOT
}

