{% macro test_not_null_udf(model,column_name) %}

       {{ config(severity = 'warn') }}

{% set null_check_query %}
    select
      count(*) from {{ model }} where {{ column_name }} is null
{% endset %}

{% set insert_null_check_query %}
    insert into ins_rjt.rjt_tbl (select '{{ model }}', '{{ column_name }}',current_timestamp() 
    from ( select
      count(*) from {{ model }} where {{ column_name }} is null ))
{% endset %}

{% set results = run_query(null_check_query) %}


{% if execute %}
{# Return the first column #}
{% set result_val = run_query(insert_null_check_query) %}

{% endif %}

select count(*) from {{ model }} where {{ column_name }} is null


{% endmacro %}
