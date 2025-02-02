use blinkit;
select * from blinkit_grocery_data;

# Changing some column names to making fetching data easier

ALTER TABLE blinkit_grocery_data CHANGE COLUMN `Item Type` item_type VARCHAR(255);
ALTER TABLE blinkit_grocery_data CHANGE COLUMN `Outlet Type` outlet_type VARCHAR(255);
ALTER TABLE blinkit_grocery_data CHANGE COLUMN `Item Fat Content` item_fat_content VARCHAR(255);
ALTER TABLE blinkit_grocery_data CHANGE COLUMN `Item Identifier` item_identifier VARCHAR(255);
ALTER TABLE blinkit_grocery_data CHANGE COLUMN `Outlet Establishment Year` outlet_establishment_year VARCHAR(255);
ALTER TABLE blinkit_grocery_data CHANGE COLUMN `Outlet Identifier` outlet_identifier VARCHAR(255);
ALTER TABLE blinkit_grocery_data CHANGE COLUMN `Outlet Location Type` outlet_location_type VARCHAR(255);
ALTER TABLE blinkit_grocery_data CHANGE COLUMN `Outlet Size` outlet_size VARCHAR(255);
ALTER TABLE blinkit_grocery_data CHANGE COLUMN `Item Visibility` item_visibility VARCHAR(255);
ALTER TABLE blinkit_grocery_data CHANGE COLUMN `Item Weight` item_weight VARCHAR(255);


-- Check the total number of records
SELECT 
    COUNT(*) AS total_records
FROM
    blinkit_grocery_data;

-- Get unique item types
SELECT DISTINCT
    item_type
FROM
    blinkit_grocery_data;

-- Count the number of outlets
SELECT 
    COUNT(DISTINCT outlet_identifier) AS total_outlets
FROM
    blinkit_grocery_data;


-- Find the total sales
SELECT 
    ROUND(SUM(Sales), 2) AS total_sales
FROM
    blinkit_grocery_data;

-- Find the average sales per item type
SELECT 
    item_type, ROUND(AVG(Sales), 2) AS avg_sales
FROM
    blinkit_grocery_data
GROUP BY item_type
ORDER BY avg_sales DESC;

-- Find the highest-selling item type
SELECT 
    item_type, ROUND(SUM(Sales), 2) AS total_sales
FROM
    blinkit_grocery_data
GROUP BY item_type
ORDER BY total_sales DESC
LIMIT 1;

-- Find the lowest-selling item type
SELECT 
    item_type, ROUND(SUM(Sales), 2) AS total_sales
FROM
    blinkit_grocery_data
GROUP BY item_type
ORDER BY total_sales ASC
LIMIT 1;

-- Total sales per outlet
SELECT 
    outlet_identifier, ROUND(SUM(Sales), 2) AS total_sales
FROM
    blinkit_grocery_data
GROUP BY outlet_identifier
ORDER BY total_sales DESC;

-- Average sales per outlet type
SELECT 
    outlet_type, ROUND(AVG(Sales), 2) AS avg_sales
FROM
    blinkit_grocery_data
GROUP BY outlet_type;

-- Highest and lowest sales outlets
SELECT 
    outlet_identifier, ROUND(SUM(Sales), 2) AS total_sales
FROM
    blinkit_grocery_data
GROUP BY outlet_identifier
ORDER BY total_sales DESC
LIMIT 1;

SELECT 
    outlet_identifier, ROUND(SUM(Sales), 2) AS total_sales
FROM
    blinkit_grocery_data
GROUP BY outlet_identifier
ORDER BY total_sales ASC
LIMIT 1;


-- Find the most common item type purchased
SELECT 
    item_type, COUNT(*) AS count
FROM
    blinkit_grocery_data
GROUP BY item_type
ORDER BY count DESC
LIMIT 1;

-- Find the most common fat content category
SELECT 
    item_fat_content, COUNT(*) AS count
FROM
    blinkit_grocery_data
GROUP BY item_fat_content
ORDER BY count DESC;

-- Average visibility per item type
SELECT 
    item_type, ROUND(AVG(item_visibility), 3) AS avg_visibility
FROM
    blinkit_grocery_data
GROUP BY item_type
ORDER BY avg_visibility DESC;

-- Correlation between weight and sales (approximate)
SELECT 
    item_type,
    ROUND(AVG(item_weight), 2) AS avg_weight,
    ROUND(AVG(Sales), 2) AS avg_sales
FROM
    blinkit_grocery_data
WHERE
    item_weight IS NOT NULL
GROUP BY item_type
ORDER BY avg_sales DESC;

-- Find the total sales per outlet establishment year
SELECT 
    outlet_establishment_year,
    ROUND(SUM(Sales), 2) AS total_sales
FROM
    blinkit_grocery_data
GROUP BY outlet_establishment_year
ORDER BY outlet_establishment_year ASC;

-- Find the average rating of items
SELECT 
    ROUND(AVG(Rating)) AS avg_rating
FROM
    blinkit_grocery_data;

-- Find the highest and lowest rated items
SELECT 
    item_identifier, Rating
FROM
    blinkit_grocery_data
ORDER BY Rating DESC
LIMIT 5;

SELECT 
    item_identifier, Rating
FROM
    blinkit_grocery_data
ORDER BY Rating ASC
LIMIT 5;

-- Total sales per outlet location type
SELECT 
    outlet_location_type, ROUND(SUM(Sales), 2) AS total_sales
FROM
    blinkit_grocery_data
GROUP BY outlet_location_type
ORDER BY total_sales DESC;

-- Sales performance by outlet size
SELECT 
    outlet_size, ROUND(AVG(Sales), 2) AS avg_sales
FROM
    blinkit_grocery_data
GROUP BY outlet_size;

