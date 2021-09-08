SELECT 
    STATENAME, 
    MIN(VALUE) AS MIN_VALUE, 
    MAX(VALUE) AS MAX_VALUE, 
    COUNT(*) AS number_of_listings 
FROM {{ source('zillow_share_source', 'for_sale_inventory')}}
GROUP BY 1