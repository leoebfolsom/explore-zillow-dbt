WITH distinct_listings AS (
    SELECT 
        DISTINCT STATENAME, 
        REGIONNAME, 
        VALUE, 
        MONTH
    FROM {{ source('zillow_share_source', 'for_sale_inventory')}}
)
SELECT * FROM distinct_listings
