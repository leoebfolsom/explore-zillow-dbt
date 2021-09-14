WITH states AS
(
    SELECT 
        DISTINCT STATENAME
    FROM {{ source('zillow_share_source', 'for_sale_inventory')}}
)
SELECT * FROM states
