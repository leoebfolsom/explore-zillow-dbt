WITH zips AS 
(
    SELECT 
        DISTINCT
        REGIONNAME,
        STATENAME
    FROM {{ source('zillow_share_source', 'for_sale_inventory')}}
    WHERE UPPER(REGIONTYPE) = 'ZIP'
)
SELECT * FROM zips