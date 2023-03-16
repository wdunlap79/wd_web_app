with

mock_orders as (
    select * from {{ source('mock_data', 'mock_orders') }}
),

final as (
    select
        order_id::integer as order_id,
        status::varchar as status,
        created_at::date as created_at,
        updated_at::date as updated_at
    from mock_orders
)

select * from final