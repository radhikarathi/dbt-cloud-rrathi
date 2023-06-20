{{
    config(
        materialized='incremental',
        unique_key = ['order_id'],
        merge_exclude_columns = ['load_date']
    )
}}



select
    {{ increment_sequence() }} as sk_order_id,
    id as order_id,
    user_id as customer_id,
    order_date,
    status,
    '{{ var("div_name") }}' as div_name,
    current_timestamp() as load_date

from raw.jaffle_shop.orders_{{ var("div_name") }}