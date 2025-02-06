{{ config(materialized='table') }}

SELECT
    customer_id,
    email,
    phone_number
FROM {{ ref('customers_table') }}