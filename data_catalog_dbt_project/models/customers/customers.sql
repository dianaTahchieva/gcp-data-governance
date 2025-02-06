{{ config(materialized='table') }}

SELECT
    customer_id,
    email,
    phone_number
FROM {{ source('multiplexer_source', 'customers_table') }}
