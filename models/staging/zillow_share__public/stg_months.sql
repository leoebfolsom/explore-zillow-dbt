WITH months AS (
    SELECT 
        DISTINCT MONTH
    FROM 
        {{ source('zillow_share_source', 'for_sale_inventory') }}
)
SELECT * FROM months