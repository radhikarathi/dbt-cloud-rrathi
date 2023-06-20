{% set tbl = 'customers_sin' %}

{{ reject_null('raw','jaffle_shop',tbl,'first_name') }}

