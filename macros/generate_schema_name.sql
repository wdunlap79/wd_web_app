-- this macro overrides DBT's default logic for schema naming in snowflake
-- with a couple updates to dev and prod build jobs in the cloud ide, this macro will drop the prefix from the dev and prod environments
-- so, for example, rather than 'DEV_DW' in DB_ANALYTICS_DEV and 'FBT_DW' in DB_ANALYTICS_PROD, both databases will contain have the schema 'DW'
-- one reason you might consider doing this is to simplify parameterizing in PBI workspaces and reports (if you make this change, all report parameters will need to be updated)

-- to make this change:
-- edit the 'Build Dev Daily 12AM ET' job in the cloud IDE: update the target name to 'development'
-- and edit the 'Build Prod Daily 1AM ET' job in the cloud IDE: update the target name to 'production'

{% macro generate_schema_name(custom_schema_name, node) -%}

    {%- set default_schema = target.schema -%}
    {%- if target.name == 'development' or target.name == 'production' -%}

        {{ custom_schema_name | trim }}

    {%- else -%}

        {{ default_schema }}_{{ custom_schema_name | trim }}

    {%- endif -%}

{%- endmacro %}