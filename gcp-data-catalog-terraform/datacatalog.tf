/*
# Create a Data Catalog Taxonomy
resource "google_data_catalog_taxonomy" "multiplexer_pii_taxonomy" {
  display_name = "Multiplexer PII Taxonomy"
  description  = "Taxonomy for sensitive data classification"
  project      = var.project_id
  region       = var.region
  activated_policy_types = ["FINE_GRAINED_ACCESS_CONTROL"]
}

# Create Policy Tags for PII and Non-PII
resource "google_data_catalog_policy_tag" "pii_sensitive" {
  taxonomy     = google_data_catalog_taxonomy.multiplexer_pii_taxonomy.id
  display_name = "PII"
  description  = "Policy tag for Personally Identifiable Information"
}

resource "google_data_catalog_policy_tag" "non_pii_sensitive" {
  taxonomy     = google_data_catalog_taxonomy.multiplexer_pii_taxonomy.id
  display_name = "Non-PII"
  description  = "Policy tag for non-sensitive data"
}
*/

# Configure the Dataplex Lake
resource "google_dataplex_lake" "main_lake" {
  lake_id   = "my-dataplex-lake"
  location  = var.region
  project   = var.project_id
  description = "Main Dataplex Lake for Data Governance"
}

# Configure the Dataplex Zone
resource "google_dataplex_zone" "main_zone" {
  lake_id    = google_dataplex_lake.main_lake.id
  zone_id    = "my-dataplex-zone"
  location   = var.region
  project    = var.project_id
  type       = "BIGQUERY" # Specify BigQuery as the data source
  description = "BigQuery zone for Data Governance"
}

# Configure the Dataplex Asset (pointing to your BigQuery dataset)
resource "google_dataplex_asset" "bigquery_asset" {
  lake_id       = google_dataplex_lake.main_lake.id
  zone_id       = google_dataplex_zone.main_zone.id
  asset_id      = "bigquery-asset"
  location      = var.region
  project       = var.project_id
  display_name  = "BigQuery Multiplexer Dataset"
  description   = "Dataplex asset representing the BigQuery dataset"
  resource_spec {
    bigquery {
      resource = "bigquery.googleapis.com/projects/${var.project_id}/datasets/multiplexer_dataset"
    }
  }
}
