    {% set database=target.database %}

    select *, (current_date() - last_altered::date) as age from {{ database }}.information_schema.schemata
    where (current_date() - last_altered::date > 0)
    and schema_name like 'DBT_CLOUD_PR%'