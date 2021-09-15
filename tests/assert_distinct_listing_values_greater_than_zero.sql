select 
    value
from
    {{ ref('stg_listings') }}
where
    value <= 0 or value is null