{{ config(materialized='table') }}

SELECT
    customer_id,
    email,
    phone_number
FROM {{ ref('customers_table') }}

{% if execute %}
    -- This section only runs in a dbt run.  It's crucial for applying policy tags.
    {% set policy_tags = {
        'customer_id': 'projects/{{ var("project_id") }}/locations/{{ var("region") }}/taxonomies/{{ ref("multiplexer_pii_taxonomy").id }}/policyTags/{{ ref("non_pii_sensitive").id }}',
        'email': 'projects/{{ var("project_id") }}/locations/{{ var("region") }}/taxonomies/{{ ref("multiplexer_pii_taxonomy").id }}/policyTags/{{ ref("pii_sensitive").id