output "bigquery_dataset_id" {
  value = google_bigquery_dataset.multiplexer_dataset.dataset_id
}

output "customers_table_id" {
  value = google_bigquery_table.customers_table.table_id
}
