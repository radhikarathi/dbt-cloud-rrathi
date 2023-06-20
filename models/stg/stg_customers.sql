{{
    config(
        materialized='incremental',
        unique_key = 'customer_id',
        merge_exclude_columns = ['load_date','sk_id']
    )
}}


select
    {{ dbt_utils.generate_surrogate_key(['id']) }} as sk_id,
    id as customer_id,
    first_name,
    last_name,
    '{{ var("div_name") }}' as div_name,
    current_timestamp() as load_date

from raw.jaffle_shop.customers_{{ var("div_name") }}