with state_month_summary as 
(
    select 
        statename, 
        month, 
        avg(value) as mean_value,
        median(value) as median_value,
        count(*) as num_listings
    from {{ ref('stg_zillow_share_listings')}}
    group by 1,2
)
select * from state_month_summary