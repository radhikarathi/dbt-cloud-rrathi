{% macro reject_null(db, schema_nm, table_name, field) %}

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

    select
        {%- for column_name_v in results_list %}
            {%- if column_name_v == "id" %}
                {{ dbt_utils.generate_surrogate_key(["column_name_v"]) }} as sk_id
            {% endif -%}
            column_name_v as column_name_v
            {%- if not loop.last %},{% endif -%}
        {% endfor %}
        'R' as reject_flg
    from {{ db }}.{{ schema_nm }}.{{ table_name }}
    where {{ field }} is null or {{ field }} = ''

{% endmacro %}
