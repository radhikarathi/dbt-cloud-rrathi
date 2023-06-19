
select
    -- {{ dbt_utils.generate_surrogate_key(['id']) }} as sk_id,
    id as customer_id,
    first_name,
    last_name,
    current_timestamp() as load_date

from raw.jaffle_shop.customers