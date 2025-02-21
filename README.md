# gcp-data-governance

This project automates the creation and management of Data Catalog and BigQuery resources on Google Cloud Platform (GCP) using Terraform and dbt. The goal is to streamline the setup and management of your data catalog, datasets, and tables, ensuring data is well-organized, easily accessible, and governed by robust data policies.

## Table of Contents
- [Overview](#overview)
- [Features](#features)
- [Prerequisites](#prerequisites)
- [Setup Instructions](#setup-instructions)
- [Project Structure](#project-structure)
  - [Terraform Project](#terraform-project)
  - [dbt Project](#dbt-project)
- [Usage](#usage)
  - [Running dbt Commands](#running-dbt-commands)
- [Potential Issues & Solutions](#potential-issues--solutions)
- [License](#license)

## Overview
This repository contains:
- **Terraform code** to:
  - Create a Google BigQuery dataset for storing and managing data.
  - Define BigQuery tables with configurations and data structures.
  - Set up Google Cloud Data Catalog to organize and classify data using taxonomies and policy tags.
  - Automate service account creation with appropriate IAM roles for seamless data access.
- **dbt code** to:
  - Transform data in BigQuery.
  - Apply Policy Tags to BigQuery columns during data transformation.

By leveraging Terraform and dbt, this project automates the entire process, making your data environment reproducible and manageable with version control.

### Read More
For a detailed step-by-step guide, check out the accompanying [blog post](https://dev.to/ipt) on implementing BigQuery Policy Tags with Terraform and dbt.


## Features
- **BigQuery Dataset and Tables:** Automates the creation and management of BigQuery datasets and tables.
- **Data Catalog Taxonomy:** Streamlines the creation of taxonomies and policy tags in Google Cloud Data Catalog.
- **Service Accounts & IAM:** Sets up service accounts with specific IAM roles for controlled access.
- **Terraform Automation:** Simplifies the management and deployment of GCP resources.
- **dbt Integration:** Transforms and models data in BigQuery, applying Policy Tags for data governance.

## Prerequisites
Before using this repository, ensure you have the following:

- **Google Cloud Platform (GCP) account:** A GCP account with project access.
- **Terraform:** Install Terraform by following the [official installation guide](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli).
- **GCP Project Setup:** Ensure your project has the necessary APIs enabled:
  - BigQuery API
  - Data Catalog API
  - Billing API (ensure billing is enabled)
- **Google Cloud SDK:** Install the Google Cloud SDK for authentication and interaction with GCP.
- **dbt:** Install dbt by following the [official installation guide](https://docs.getdbt.com/docs/installation).
- **Python:** Install Python for managing dbt dependencies.


## Setup Instructions
### 1. Clone the Repository
Clone this repository to your local machine:
```bash
git clone https://github.com/dianaTahchieva/gcp-data-catalog-terraform.git
cd gcp-data-catalog-terraform
```

### 2. Authenticate with Google Cloud
Authenticate Terraform with your Google Cloud account:
```bash
gcloud auth application-default login
```
Ensure your account has the necessary permissions to create resources.

### 3. Initialize Terraform
Run the following command to initialize the Terraform working directory:
```bash
terraform init
```
This downloads necessary provider plugins and sets up the working directory.

### 4. Apply Terraform Plan
Run the following command to apply the Terraform plan:
```bash
terraform apply
```
Review the proposed changes and confirm by typing `yes`. Terraform will then create the necessary BigQuery datasets, tables, policy tags, service accounts, and IAM roles.

## Project Structure
### Terraform Project
The repository is organized as follows:
```
gcp-data-catalog-terraform/
├── variables.tf       # Terraform variables
├── outputs.tf         # Outputs (dataset, table IDs)
├── bigquery.tf        # BigQuery dataset and table creation
├── datacatalog.tf     # Data Catalog taxonomy and policy tags
└── iam.tf             # Service accounts and IAM roles configuration
```

### dbt Project
The dbt project contains the necessary configurations and models:
```
data_catalog_dbt_project/
├── dbt_project.yml    # Main configuration file for dbt project
├── profiles.yml       # Connection details for dbt
└── models/
    └── customers/
        ├── customers.sql  # SQL file for transforming customer data
        └── customers.yml  # YAML file for metadata and policy tags
```

## Usage
After applying the Terraform plan, you can:
- **Query data in BigQuery:** Access and analyze your data.
- **Manage metadata in Data Catalog:** Organize, classify, and enforce data governance policies.
- **Run dbt transformations:** Apply policy tags to BigQuery columns through dbt models.

## Running dbt Commands
Run dbt commands:
```bash
dbt deps --upgrade
dbt debug
dbt run -s customers
```

## Potential Issues & Solutions
### Billing Disabled Error
If you receive a `BILLING_DISABLED` error, enable billing for your project via the [GCP Billing Console](https://console.cloud.google.com/billing).

### API Not Enabled Error
If you receive a `SERVICE_DISABLED` error for Data Catalog or BigQuery, enable the required APIs in the [GCP API Library](https://console.cloud.google.com/apis/library).

### Permission Issues
Ensure your account has sufficient permissions, including:
- `roles/bigquery.admin`
- `roles/datacatalog.admin`
- `roles/iam.serviceAccountAdmin`

### Terraform Initialization Issues
If `terraform init` fails, try running it again with a stable internet connection and verify provider configurations.

## License
This project is licensed under the MIT License. See the `LICENSE` file for details.

