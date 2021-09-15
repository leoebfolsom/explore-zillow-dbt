select 
    regionname
from
    {{ ref('stg_listings') }}
where 
    regionname like '%[^0-9]%' or len(regionname) != 5