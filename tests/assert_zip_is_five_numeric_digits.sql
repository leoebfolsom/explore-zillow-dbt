select 
    regionname
from
    {{ ref('stg_zillow_share_listings') }}
where 
    regionname like '%[^0-9]%' or len(regionname) != 5