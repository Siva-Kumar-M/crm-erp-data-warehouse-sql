/*
===============================================================================
Quality Checks
===============================================================================
Script Purpose:
    This script performs quality checks on the Gold layer to validate
    key uniqueness and relationships between fact and dimension tables.

    The checks cover:
        - Uniqueness of surrogate keys in dimension tables.
        - Referential integrity between fact and dimension tables.
        - Connectivity of the Gold data model.

Usage:
    Run these checks after creating the Gold views.

===============================================================================
*/


/*======================================================================
    Checking 'gold.dim_customers'
======================================================================*/

-- Check Customer Key Uniqueness
-- Expected: No Results

SELECT
    customer_key,
    COUNT(*) AS duplicate_count
FROM gold.dim_customers
GROUP BY customer_key
HAVING COUNT(*) > 1;


/*======================================================================
    Checking 'gold.dim_products'
======================================================================*/

-- Check Product Key Uniqueness
-- Expected: No Results

SELECT
    product_key,
    COUNT(*) AS duplicate_count
FROM gold.dim_products
GROUP BY product_key
HAVING COUNT(*) > 1;


/*======================================================================
    Checking 'gold.fact_sales'
======================================================================*/

-- Check Fact-to-Dimension Relationships
-- Expected: No Results

SELECT
    f.*
FROM gold.fact_sales f
LEFT JOIN gold.dim_customers c
    ON c.customer_key = f.customer_key
LEFT JOIN gold.dim_products p
    ON p.product_key = f.product_key
WHERE c.customer_key IS NULL
   OR p.product_key IS NULL;
