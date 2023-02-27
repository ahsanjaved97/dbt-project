
{{ config(materialized='table') }}

with yellow_data as (
    select *, 
        'Yellow' as service_type
    from {{ ref('std_yellowdata') }}
), 
-- LocationID as locate, Borough as place, Zone as timezone,service_zone as place_zone 
dim_zones as (
    select * from {{ ref('dim_zones') }}
    where borough != 'Unknown'
)

Select 

    yellow_data.vendorid, 
    yellow_data.service_type,
    yellow_data.ratecodeid, 
    yellow_data.PULocationID, 
    pickup_zone.borough as pickup_borough, 
    pickup_zone.zone as pickup_zone, 
    yellow_data.DOLocationID,
    dropoff_zone.borough as dropoff_borough, 
    dropoff_zone.zone as dropoff_zone,  
    yellow_data.tpep_pickup_datetime, 
    yellow_data.tpep_dropoff_datetime, 
    yellow_data.store_and_fwd_flag, 
    yellow_data.passenger_count, 
    yellow_data.trip_distance, 
    yellow_data.fare_amount, 
    yellow_data.extra, 
    yellow_data.mta_tax, 
    yellow_data.tip_amount, 
    yellow_data.tolls_amount,  
    yellow_data.improvement_surcharge, 
    yellow_data.total_amount, 
    yellow_data.payment_type,  
    yellow_data.congestion_surcharge


from yellow_data 
inner join dim_zones as pickup_zone
on yellow_data.PULocationID = pickup_zone.locationid
inner join dim_zones as dropoff_zone
on yellow_data .DOLocationID = dropoff_zone.locationid