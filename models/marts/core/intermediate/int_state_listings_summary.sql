select
    statename, 
    min(value) as min_value, 
    max(value) as max_value,
    avg(value) as mean_value,
    median(value) as median_value,
    count(distinct regionname) as distinct_zips,
    count(*) as number_of_listings
from {{ ref('stg_zillow_share_listings') }}
group by 1