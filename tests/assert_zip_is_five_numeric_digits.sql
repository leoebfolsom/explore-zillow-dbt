SELECT 
    REGIONNAME
FROM
    {{ ref('stg_zips') }}
WHERE 
    REGIONNAME LIKE '%[^0-9]%' OR LEN(REGIONNAME) != 5