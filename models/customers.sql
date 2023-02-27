
{{config(materialized='table')}}

select VendorID as customer_id, passenger_count from from `key-nebula-378813.trips_data_all.rides`

