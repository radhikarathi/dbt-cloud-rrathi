{% macro reject_flg_ind_dynamic(model,field) %}

       {{ config(severity = 'warn') }}

{{
    config(
        materialized='incremental',
        unique_key = 'customer_id',
        merge_exclude_columns = ['load_date','sk_id'],
       
    )
}}

select {{ increment_sequence() }} as sk_id,id as customer_id,
    first_name,
    last_name,
    '{{ var("div_name") }}' as div_name,
    current_timestamp() as load_date,
    case when {{field}} is null or {{field}} = '' then 'R' else 'I' end as reject_flg from
{{model}}


{% endmacro %}
