# GCP Data Catalog Terraform Project

## Overview

This sub-project contains Terraform configurations for setting up the necessary infrastructure, permissions, and policy tags for data governance in Google Cloud Platform (GCP).

## Structure

- **variables.tf:** Defines the GCP project ID and region.
- **iam.tf:** Creates service accounts for Terraform and dbt, assigning necessary IAM roles.
- **datacatalog.tf:** Defines the taxonomy for organizing Policy Tags and creates tags for PII and non-PII data.
- **bigquery.tf:** Creates a BigQuery dataset and a table without predefined policy tags.
- **bigquery_policy.tf:** Applies Policy Tags to the Customers table.
- **output.tf:** Outputs IDs for easy access to created resources.
- **enable_apis.tf:** Enables necessary Google Cloud APIs.

## Getting Started

1. **Initialize Terraform:**
```bash
terraform init
```
2. **Apply Terraform Configurations:**
```bash
terraform apply
```
3. **Cleanup:**
To avoid unnecessary charges, destroy the Terraform-managed infrastructure:
```bash
terraform destroy
```