
-- Product Category wise total revenue
select 
tbl.ProductCategory ,
tbl.ProductSubCategory ,
sum(tbl.Quantity) as TotalQuantity,
floor(sum(tbl.UnitPriceUSD*tbl.Quantity)) as TotalRevenueUSD
from dataspark.sales_data tbl
group by 1,2 order by 1 

-- Product Sub category wise revenue
select 
tbl.ProductCategory ,
tbl.ProductSubCategory ,
sum(tbl.Quantity) as TotalQuantity,
floor(sum(tbl.UnitPriceUSD*tbl.Quantity)) as TotalRevenueUSD
from dataspark.sales_data tbl
group by 1,2 order by 1 


-- profit margin analysis product wise
select 
tbl.ProductName,
floor(sum(tbl.UnitPriceUSD - tbl.UnitCostUSD))as Profit_margin
from dataspark.sales_data tbl
group by 1 order by 2 desc

-- least popular 10 products
select 
tbl.ProductName,
tbl.ProductKey,
sum(tbl.Quantity) as TotalQuantity,
floor(sum(tbl.UnitPriceUSD*tbl.Quantity)) as Total_Revenue_Usd
from dataspark.sales_data tbl
group by 1,2 order by 3 asc
limit 10

