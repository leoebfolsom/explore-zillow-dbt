WITH states AS (
    select * from {{ ref('stg_states') }}
),
distinct_listings AS (
    select * from {{ ref('stg_distinct_listings') }}
)
SELECT 
    STATENAME, 
    MIN(VALUE) AS MIN_VALUE, 
    MAX(VALUE) AS MAX_VALUE, 
    COUNT(*) AS number_of_listings
FROM distinct_listings
GROUP BY 1