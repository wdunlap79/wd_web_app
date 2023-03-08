-- target names:
-- cloud
--      default (cloud 'feature' development environment)
--      dev (cloud 'development' deployment environment)
--      prod (cloud 'production' deployment environment)
-- .github/profiles.yml
--      prod (web_app profile)

{% macro generate_schema_name(custom_schema_name, node) -%}

    {%- set default_schema = target.schema -%}
    {%- if target.name == 'development' or target.name == 'production' -%}

        {{ custom_schema_name | trim }}

    {%- else -%}

        {{ default_schema }}_{{ custom_schema_name | trim }}

    {%- endif -%}

{%- endmacro %}