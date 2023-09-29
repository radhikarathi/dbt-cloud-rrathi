{% test warn_if_odd_rej_tbl(model, column_name) %}

    {{ config(severity = 'warn') }}


{% set odd_check_query %}
 
    select *
    from {{ model }}
    where ({{ column_name }} % 2) = 1
 

{% endset %}

{% set insert_odd_check_query %}

    insert into ins_rjt.rjt_tbl (select '{{ this}}', {{ column_name }},current_timestamp() 

    from {{ model }}
    where ({{ column_name }} % 2) = 1 )

{% endset %}

{% set results = run_query(odd_check_query)%}

{% if execute %}
{# Return the first column #}
{% set result_val = run_query(insert_odd_check_query) %}

{% endif %}
    
{{ odd_check_query }}


{% endtest %}