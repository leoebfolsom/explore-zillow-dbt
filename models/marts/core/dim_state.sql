with listings as (
    select * from {{ ref('stg_zillow_share_listings') }}
),
state_month_summary as (
    select * from {{ ref('int_state_month_summary') }} 
),
partition_by_state as (
    select
        statename,
        month,
        row_number() over (partition by statename order by median_value) as rank_median_value_month,
        row_number() over (partition by statename order by mean_value) as rank_mean_value_month,
        row_number() over (partition by statename order by num_listings) as rank_num_listings_month
    from 
        state_month_summary
),
state_month_top_median_month as (
    select statename, month
    from partition_by_state
    where rank_median_value_month = 1
),
state_month_top_mean_month as (
    select statename, month
    from partition_by_state
    where rank_mean_value_month = 1
),
state_month_top_listings_month as (
    select statename, month
    from partition_by_state
    where rank_num_listings_month = 1
),
state_listings_summary as (
    select
        statename, 
        min(value) as min_value, 
        max(value) as max_value,
        avg(value) as mean_value,
        median(value) as median_value,
        count(distinct regionname) as distinct_zips,
        count(*) as number_of_listings
    from listings
    group by 1
)
select
    sls.*,
    med.month as top_median_value_month,
    mean.month as top_mean_value_month,
    num_listings.month as top_num_listings_month
from 
    state_listings_summary sls
    left join state_month_top_median_month med
        on sls.statename = med.statename
    left join state_month_top_mean_month mean
        on sls.statename = mean.statename
    left join state_month_top_listings_month num_listings
        on sls.statename = num_listings.statename