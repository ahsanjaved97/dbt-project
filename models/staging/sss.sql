select
    {{ get_payment_type_description('payment_type') }} as payment_type_description,
    congestion_surcharge
from {{ source('staging','rides') }}
where vendorid is not null