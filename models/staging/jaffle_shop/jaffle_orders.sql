{{ config(
    materialized = 'incremental',
    unique_key = 'id',
)
}}

with

orders as (
    select * from {{ source('jaffle_shop', 'orders') }}
),

stage as (
    select
        id::integer as id
	    ,USER_ID::integer as user_id
	    ,ORDER_DATE::DATE as order_date
	    ,STATUS::VARCHAR as status
        ,updated_at::date as updated_at

    from orders
)

select * from stage

 {% if is_incremental() %}
     -- this filter will only be applied on an incremental run
     where updated_at > (select max(updated_at) from {{ this }}) 
 {% endif %}