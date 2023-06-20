{% set tbl = 'customers_sin' %}



{{ stg_insert_not_null('raw','jaffle_shop', tbl,'first_name') }}