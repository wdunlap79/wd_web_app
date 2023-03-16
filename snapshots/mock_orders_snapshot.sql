{% snapshot mock_orders_snapshot %}

{{
    config(
        target_database= 'wd_analytics',
        target_schema= 'snapshots',
        unique_key='order_id',
        strategy='check',
        check_cols ='all',
        invalidate_hard_deletes = false
    )
}}

select * from {{ source('mock_data', 'mock_orders') }}

 {% endsnapshot %}