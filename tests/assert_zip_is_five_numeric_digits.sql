SELECT 
    REGIONNAME
FROM
    {{ ref('stg_listings') }}
WHERE 
    REGIONNAME LIKE '%[^0-9]%' OR LEN(REGIONNAME) != 5