with partition_by_state as (
    select * from {{ ref('int_rank_months_within_each_state') }}
),
state_listings_summary as (
    select * from {{ ref('int_state_listings_summary') }}
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