select 
    value
from
    {{ ref('stg_zillow_share_listings') }}
where
    value <= 0 or value is null