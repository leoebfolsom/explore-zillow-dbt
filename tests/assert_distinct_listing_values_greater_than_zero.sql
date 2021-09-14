SELECT 
    VALUE
FROM
    {{ ref('stg_distinct_listings') }}
WHERE
    VALUE <= 0 OR VALUE IS NULL