{% snapshot dbt_tests_snapshots %}

{{ config(
    target_schema="DBT_SCHEMA",
    target_database="DFS_DBT",
    unique_key="test_name",
    strategy="timestamp",
    updated_at="snapshot_date",
    
) }}

{%- set test_schema = 'DBT_SCHEMA_DBT_TEST_AUDIT' -%}

-- Set schema, since tests use custom schema on dev
-- {% if  target.name in ["dev", "ci"] %}
--     {%- set test_schema = target.schema ~ '_tests' -%}
-- {% else %}
--      {%- set test_schema = 'DBT_SCHEMA_DBT_TEST_AUDIT' -%}
-- {% endif %}

{{ generate_tests_stats(test_schema) }}

{% endsnapshot %}