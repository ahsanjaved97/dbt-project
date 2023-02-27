--Duplicate trip data
with tripdata as
(
  select *,
    row_number() over(partition by CAST(vendorid as INT), tpep_pickup_datetime) as rn
  from {{ source('staging','rides') }}
  where vendorid is not null
)
select * from tripdata