{{ config(
    materialized = 'incremental'
    unique_key = order_id
    )
}}

with

orders as (
    select * from {{ source('jaffle_shop', 'orders') }}
),

stage as (
    select
        order_id::integer as id
	    ,USER_ID::integer as user_id
	    ,ORDER_DATE::DATE as order_date
	    ,STATUS::VARCHAR as status
	    ,_ETL_LOADED_AT::timestamp as refreshed_at
    from orders
)

select * from stage

 {% if is_incremental() %}
     -- this filter will only be applied on an incremental run
     where order_date > (select max(order_date) from {{ this }}) 
 {% endif %}