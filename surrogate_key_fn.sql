select
    {{ dbt_utils.surrogate_key(['vendorid', 'tpep_pickup_datetime']) }} as tripid,
    cast(vendorid as integer) as vendorid,
    
    from {{ source('staging','rides') }}
where vendorid is not null