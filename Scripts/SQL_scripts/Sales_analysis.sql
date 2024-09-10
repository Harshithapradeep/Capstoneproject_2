-- Month wise order count (Seasonal trend)
select  monthname(Orderdate) Monthtrend,
COUNT(distinct ordernumber) as orderCount from dataspark.sales_data
group by 1 order by 2 desc

-- Year wise sales revenue
select  
Year(Orderdate) Yeartrend,
floor(sum(tbl.UnitPriceUSD*tbl.Quantity)) as Yearly_Revenue_USD
from dataspark.sales_data tbl
group by 1 order by 2 desc


-- Top 10 performing products

select 
ProductName ,
sum(Quantity) as TotalQuantity,
floor(sum(tbl.UnitPriceUSD*tbl.Quantity)) as Total_Revenue_Usd
from dataspark.sales_data tbl
group by 1 order by 3 desc limit 10


-- Store wise sales revenue
select StoreKey, sales_medium , 
floor(sum(tbl.UnitPriceUSD*tbl.Quantity)) as Total_Revenue_Usd
from dataspark.sales_data tbl
group by 1,2 order by 3 desc


-- Total Sales order count and Total revenue

select 
COUNT(distinct tbl.ordernumber) as orderCount 
,floor(sum(tbl.UnitPriceUSD*tbl.Quantity)) as Total_Revenue_Usd
from dataspark.sales_data tbl


-- Additional analysis-----

-- Analysing revenue drop in year 2020
select  
Year(Orderdate) Yeartrend,
count(distinct tbl.OrderNumber)as Ordercount,
floor(sum(tbl.UnitPriceUSD*tbl.Quantity)) as Yearly_Revenue_USD
from dataspark.sales_data tbl
group by 1 order by 3 desc



-- Sales revenue by currency
select
tbl.ProductCategory ,
tbl.exchange,
tbl.CurrencyCode,
COUNT(distinct tbl.ordernumber) as orderCount,
sum(floor(tbl.UnitPriceUSD*tbl.Quantity))as RevenueUsd,
sum(floor((tbl.UnitPriceUSD*tbl.Quantity)/tbl.exchange))as ExchangeSalerevenue,
sum(floor(tbl.UnitCostUSD*tbl.Quantity))as ProductioncostUSD,
sum(floor((tbl.UnitCostUSD*tbl.Quantity)/tbl.exchange)) as Productioncostexchange
from dataspark.sales_data tbl
group by 1,2,3 order by 4 desc




