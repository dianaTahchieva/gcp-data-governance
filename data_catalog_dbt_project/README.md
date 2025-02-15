# Data Catalog dbt Project

## Overview

This sub-project contains the dbt configurations and models for applying policy tags to BigQuery columns as part of the data governance setup.

## Structure

- **dbt_project.yml:** Main configuration file for the dbt project.
- **profiles.yml:** Contains connection details and credentials for dbt to connect to BigQuery.
- **models/customers/:** Directory containing the models for the project.
  - **customers.sql:** SQL file representing the transformation logic for the customers’ data.
  - **customers.yml:** YAML file providing additional metadata about the customers model.


## Requirements

To run this project, you need the following Python dependencies:

```plaintext
sqlfluff==3.1.0
pytest==8.2.2  # Include only if writing tests for dbt models