{% macro reject_null_1(db='raw', schema_nm='jaffle_shop', table_name='customers_sin', field='first_name') %}

    {{ config(severity="warn") }}

{% set column_query %}

    select column_name
    from {{db}}.information_schema.columns
    where table_schema = upper('{{schema_nm}}')
    and table_name = upper('{{table_name}}')

{% endset %}

{% set results = run_query(column_query) %}

{% if execute %}
    {# Return the first column #}
    {% set results_list = results.columns[0].values() %}
{% else %} {% set results_list = [] %}
{% endif %}

return results_list

{% endmacro %}
