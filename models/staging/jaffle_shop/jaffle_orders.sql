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
	    ,_ETL_LOADED_AT::timestamp as refreshed_at
    from orders
)

select * from stage