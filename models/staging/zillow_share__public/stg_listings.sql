with listings as (
    select 
        statename, 
        regionname, 
        value, 
        month
    from {{ source('zillow_share_source', 'for_sale_inventory')}}
)
select * from listings