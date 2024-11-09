


--- 1. What is the total funding amount raised by companies in each sector?
   
   SELECT sector, SUM(funding_amount_usd) AS total_funding
   FROM companies_data
   GROUP BY sector
   ORDER BY total_funding DESC;
   

--- 2. What is the average funding amount for each funding stage?
   
   SELECT funding_stage, AVG(funding_amount_usd) AS average_funding
   FROM companies_data
   GROUP BY funding_stage
   ORDER BY average_funding DESC;
   

--- 3. Which countries are attracting the most funding, and how does this compare to the number of companies funded in each country?
   
   SELECT country, 
          COUNT(company_index) AS number_of_companies, 
          SUM(funding_amount_usd) AS total_funding
   FROM companies_data
   GROUP BY country
   ORDER BY total_funding DESC;
   
   

--- 5. What is the average funding amount per company by country and sector?
   
   SELECT country, sector, 
          AVG(funding_amount_usd) AS average_funding_per_company
   FROM companies_data
   GROUP BY country, sector
   ORDER BY average_funding_per_company DESC;
   
   

--- 7. What are the top 5 countries with the highest average funding amount, and which sectors are they predominantly funding?
   
   SELECT country, 
          AVG(funding_amount_usd) AS average_funding, 
          sector
   FROM companies_data
   GROUP BY country, sector
   ORDER BY average_funding DESC
   LIMIT 5;
   

--- 8. Which funding stage has the highest percentage in funding amounts?
   
   SELECT funding_stage, 
          VARIANCE(funding_amount_usd) AS funding_variance
   FROM companies_data
   GROUP BY funding_stage
   ORDER BY funding_variance DESC;
   

--- 9. Which companies raised the most funding within each sector?
   
   SELECT sector, company_name, funding_amount_usd
   FROM companies_data
   WHERE (sector, funding_amount_usd) IN 
         (SELECT sector, MAX(funding_amount_usd)
          FROM companies_data
          GROUP BY sector)
   ORDER BY sector DESC;
   

--- 10. How has the average funding amount changed over time (e.g., year-over-year)?
   
   SELECT YEAR(funding_date) AS funding_year, 
          AVG(funding_amount_usd) AS average_funding_per_year
   FROM companies_data
   GROUP BY funding_year
   ORDER BY funding_year;
   

--- 11. Which sectors have the highest and lowest average funding amounts by country?
   
   SELECT country, sector, AVG(funding_amount_usd) AS average_funding
   FROM companies_data
   GROUP BY country, sector
   ORDER BY average_funding DESC;
   

--- 12. What is the distribution of funding amounts across funding stages?
   
   SELECT funding_stage, 
          COUNT(company_index) AS number_of_companies, 
          SUM(funding_amount_usd) AS total_funding
   FROM companies_data
   GROUP BY funding_stage
   ORDER BY total_funding DESC;
   

--- 13. What is the cumulative funding raised each month and how does it trend over time?
   
   SELECT DATE_FORMAT(funding_date, '%Y-%m') AS month, 
          SUM(funding_amount_usd) AS total_funding
   FROM companies_data
   GROUP BY month
   ORDER BY month;
   
   
--- 2. How many companies have received funding in each funding stage?


SELECT funding_stage, 
       COUNT(company_name) AS number_of_companies
FROM companies_data
GROUP BY funding_stage
ORDER BY number_of_companies DESC;


--- 4. Which company received the highest funding amount and when?


SELECT company_name, 
       funding_amount_usd, 
       funding_date
FROM companies_data
ORDER BY funding_amount_usd DESC;


--- 7. How many unique countries are represented in the dataset?


SELECT COUNT(DISTINCT country) AS unique_countries 
FROM companies_data;


--- 8. What is the distribution of companies by country and sector?

SELECT country, 
       sector, 
       COUNT(company_name) AS number_of_companies
FROM companies_data
GROUP BY country, sector
ORDER BY number_of_companies desc;

--- 1. What is the trend of funding amounts over the years for each sector?

SELECT YEAR(funding_date) AS funding_year, 
       sector, 
       SUM(funding_amount_usd) AS total_funding
FROM companies_data
GROUP BY funding_year, sector
ORDER BY funding_year, sector;


--- 1. Which countries are attracting the most funding?


SELECT country, SUM(funding_amount_usd) AS total_funding
FROM companies_data
GROUP BY country
ORDER BY total_funding DESC;

--- 2. How many companies have raised more than $1 million?
SELECT COUNT(DISTINCT company_name) AS companies_above_1m
FROM companies_data
WHERE funding_amount_usd >= 1000000;

--- 3. How many companies have raised more than total $10 million?

SELECT COUNT(DISTINCT company_name) AS companies_above_10m
FROM companies_data
WHERE funding_amount_usd >= 10000000;


--- 4. How many companies have raised more than $100 million?

SELECT COUNT(DISTINCT company_name) AS companies_above_10m
FROM companies_data
WHERE funding_amount_usd >= 100000000;

--- 5. How many companies have raised more than $1 billion?

SELECT COUNT(DISTINCT company_name) AS companies_above_1b
FROM companies_data
WHERE funding_amount_usd >= 1000000000;



--- 7. Highest and lowest funding in 2020 and 2021


SELECT YEAR(funding_date) AS funding_year, 
       MAX(funding_amount_usd) AS highest_funding, 
       MIN(funding_amount_usd) AS lowest_funding
FROM companies_data
WHERE YEAR(funding_date) IN (2020, 2021)
GROUP BY funding_year;


--- 8. Highest and lowest funding in 2020 and 2021 sector-wise


SELECT YEAR(funding_date) AS funding_year, 
       sector,
       MAX(funding_amount_usd) AS highest_funding, 
       MIN(funding_amount_usd) AS lowest_funding
FROM companies_data
WHERE YEAR(funding_date) IN (2020, 2021)
GROUP BY funding_year, sector
ORDER BY funding_year, sector;


--- 9. Highest and lowest funding in 2020 and 2021 funding stage-wise


SELECT YEAR(funding_date) AS funding_year, 
       funding_stage,
       MAX(funding_amount_usd) AS highest_funding, 
       MIN(funding_amount_usd) AS lowest_funding
FROM companies_data
WHERE YEAR(funding_date) IN (2020, 2021)
GROUP BY funding_year, funding_stage
ORDER BY funding_year, funding_stage;


--- 10. What is the distribution of funding amounts across funding stages?


SELECT funding_stage, 
       COUNT(company_name) AS number_of_companies, 
       SUM(funding_amount_usd) AS total_funding
FROM companies_data
GROUP BY funding_stage
ORDER BY total_funding DESC;


--- 12. Total companies who got funded in year 2020 and 2021


SELECT YEAR(funding_date) AS funding_year, 
       COUNT(DISTINCT company_name) AS total_companies
FROM companies_data
WHERE YEAR(funding_date) IN (2020, 2021)
GROUP BY funding_year;


--- 13. Highest funded company in 2020 and 2021


SELECT company_name, funding_amount_usd, YEAR(funding_date) AS funding_year
FROM companies_data
WHERE YEAR(funding_date) IN (2020, 2021)
ORDER BY funding_amount_usd DESC
LIMIT 1;


--- 17. Total unique funding stages


SELECT COUNT(DISTINCT funding_stage) AS unique_funding_stages
FROM companies_data;


--- 18. Total unique countries


SELECT COUNT(DISTINCT country) AS unique_countries
FROM companies_data;


--- 19. Which companies have received funding more than once, and what is their total funding amount?


SELECT company_name, 
       COUNT(funding_date) AS number_of_fundings, 
       SUM(funding_amount_usd) AS total_funding
FROM companies_data
GROUP BY company_name
HAVING COUNT(funding_date) > 1
ORDER BY total_funding DESC;

--- 1. Which funding stage has the highest percentage in funding amounts?

SELECT funding_stage, 
       SUM(funding_amount_usd) AS total_funding, 
       (SUM(funding_amount_usd) / (SELECT SUM(funding_amount_usd) FROM companies_data)) * 100 AS percentage_of_total
FROM companies_data
GROUP BY funding_stage
ORDER BY percentage_of_total DESC;

--- 2. Percentage of total funding by sector

SELECT sector, 
       SUM(funding_amount_usd) AS total_funding, 
       (SUM(funding_amount_usd) / (SELECT SUM(funding_amount_usd) FROM companies_data)) * 100 AS percentage_of_total
FROM companies_data
GROUP BY sector
ORDER BY percentage_of_total DESC;


--- 1. Percentage of total funding by country

SELECT country, 
       SUM(funding_amount_usd) AS total_funding, 
       (SUM(funding_amount_usd) / (SELECT SUM(funding_amount_usd) FROM companies_data)) * 100 AS percentage_of_total
FROM companies_data
GROUP BY country
ORDER BY percentage_of_total DESC;

--- 2. Percentage of total funding by company
SELECT company_name, 
       SUM(funding_amount_usd) AS total_funding, 
       (SUM(funding_amount_usd) / (SELECT SUM(funding_amount_usd) FROM companies_data)) * 100 AS percentage_of_total
FROM companies_data
GROUP BY company_name
ORDER BY percentage_of_total DESC;

--- 3. Percentage of total funding by funding stage
SELECT funding_stage, 
       SUM(funding_amount_usd) AS total_funding, 
       (SUM(funding_amount_usd) / (SELECT SUM(funding_amount_usd) FROM companies_data)) * 100 AS percentage_of_total
FROM companies_data
GROUP BY funding_stage
ORDER BY percentage_of_total DESC;

--- 4. Percentage of total funding by year

SELECT YEAR(funding_date) AS year, 
       SUM(funding_amount_usd) AS total_funding, 
       (SUM(funding_amount_usd) / (SELECT SUM(funding_amount_usd) FROM companies_data)) * 100 AS percentage_of_total
FROM companies_data
GROUP BY year
ORDER BY percentage_of_total DESC;




