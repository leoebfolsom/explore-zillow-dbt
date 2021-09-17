    select
        statename,
        month,
        row_number() over (partition by statename order by median_value) as rank_median_value_month,
        row_number() over (partition by statename order by mean_value) as rank_mean_value_month,
        row_number() over (partition by statename order by num_listings) as rank_num_listings_month
    from 
        {{ ref('int_state_month_summary') }} 