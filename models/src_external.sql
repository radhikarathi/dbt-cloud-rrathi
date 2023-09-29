{{
    config(
        materialized='incremental',
        unique_key = 'id',
        on_schema_change = "sync_all_columns"
    )
}}

select * exclude value from {{ source("INPUT_SRC", "ext_table_rr_col") }}
where not exists

(select * from sus_table
where <table = <table>
and <div_id> in  (ri_col_val)
and <loc_id> in (ri_col_val) )


select 