WITH listings AS (
    SELECT 
        STATENAME, 
        REGIONNAME, 
        VALUE, 
        MONTH
    FROM {{ source('zillow_share_source', 'for_sale_inventory')}}
)
SELECT * FROM listings