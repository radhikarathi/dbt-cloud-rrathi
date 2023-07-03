{%- set tbl_nm = 'raw.jaffle_shop.customers_'+ var("div_name") -%}
{{ reject_flg_ind_dynamic(tbl_nm,'first_name') }}

