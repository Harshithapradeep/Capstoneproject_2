-- Gender wise segmentation
select gender,count(distinct OrderNumber) as OrderCount from dataspark.sales_data sd group by Gender 


-- AGe wise segmentation
select age_category,count(distinct OrderNumber)as OrderCount from dataspark.sales_data sd group by age_category


-- Order count across the Globe
select State, Country, COUNT(distinct OrderNumber) OrderCount 
from dataspark.sales_data sd 
group by 1 ,2 order by 3 desc

-- Customers Average order value 
select 
tbl.CustomerKey,
tbl.CustomerName,
floor(avg(tbl.UnitPriceUSD*tbl.Quantity)) as AvgOrderValue 
from dataspark.sales_data tbl 
group by 1,2 order by AvgOrderValue desc


-- Offline vs online
select sales_medium
,count(distinct CustomerKey)as Customer_count
,count(distinct OrderNumber) as OrderCount 
from dataspark.sales_data sd group by sales_medium




























