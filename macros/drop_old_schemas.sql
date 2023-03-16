{% macro drop_old_schemas(days_old) %}
    {% set database=target.database %}
    log('hello world')
    {% set sql %}
    select * from {{ database }}.information_schema.schemata
    where (current_date() - last_altered::date) > {{ days_old }}
    and schema_name like 'DBT_CLOUD_PR%'
    {% endset %}

        {% set drop_schemas = run_query(sql).columns[1].values() %}
        {% for schema in drop_schemas %}
            {% set sql %}
            drop schema {{ database }}.{{ schema }};
            {% endset %}
            run_query(sql)
            {{ log("Schema " ~ schema.upper() ~ " was dropped from database " ~ database.upper(), info=true) }} 
        {% endfor %}

{% endmacro %}