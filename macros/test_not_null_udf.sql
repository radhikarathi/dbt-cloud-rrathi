{% macro test_not_null_udf(model,field) %}

       {{ config(severity = 'warn') }}

{% set null_check_query %}
    select
      count(*) from {{ model }} where {{ field }} is null
{% endset %}

{% set results = run_query(null_check_query) %}


{% if execute %}
{# Return the first column #}
{% set results_list = ['I'] %}
{% else %}
{% set results_list = ['R'] %}
{% endif %}

{{ return(results_list[0]) }}


{% endmacro %}
