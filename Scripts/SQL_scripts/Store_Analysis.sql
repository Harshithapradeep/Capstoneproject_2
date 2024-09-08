select 
tbl.StoreKey,
count(DISTINCT(tbl.OrderNumber)) as ordercount
from dataspark.sales_data tbl
group by 1

-- Age wise store segmentation based on order count
select 
sd.StoreAgeCategory,
Year(sd.Orderdate) OrderYear ,
count(DISTINCT(sd.OrderNumber)) as ordercount
from dataspark.sales_data sd 
where StoreKey > 0 
group by 1,2 order by 1,2


-- Store performance based on size of store
select 
sd.StoreSize,
count(DISTINCT(sd.OrderNumber)) as ordercount,
floor(sum(sd.UnitPriceUSD*sd.Quantity)) as Total_Revenue_Usd
from dataspark.sales_data sd 
where StoreKey > 0 
group by 1 order by 1,2

-- Profit margin and sales revenue by store state and country -location wise
select 
sd.StoreCountry,
sd.storeState,
floor(sum(sd.UnitPriceUSD - sd.UnitCostUSD))as Profit_margin, 
floor(sum(sd.UnitPriceUSD*sd.Quantity)) as Total_Revenue_Usd
from dataspark.sales_data sd 
where StoreKey > 0 
group by 1,2 order by 3 desc 












