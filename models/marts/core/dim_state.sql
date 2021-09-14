with listings as (
    select * from {{ ref('stg_listings') }}
)
select
    dl.statename, 
    min(dl.value) as min_value, 
    max(dl.value) as max_value,
    count(distinct regionname) as distinct_zips,
    count(*) as number_of_listings
from listings dl
group by 1