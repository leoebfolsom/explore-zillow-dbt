SELECT 
    STATENAME, 
    MIN(VALUE) AS MIN_VALUE, 
    MAX(VALUE) AS MAX_VALUE, 
    COUNT(*) AS number_of_listings 
FROM FOR_SALE_INVENTORY 
GROUP BY 1;