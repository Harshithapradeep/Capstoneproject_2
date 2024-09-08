select * from dataspark.sales_data sd 



-- dataspark.sales_data source

create or replace view dataspark.sales_data as
select sl.*,
	CONCAT(OrderNumber,'-',LineItem) as OrderLineItem,
    case when st.Country = 'Online' then 'Online' else 'Offline' end as sales_medium,
    c.Gender as Gender,
    c.City as City,
    c.State as State,
    c.Country as Country,
    c.Birthday as Birthday,
    floor(datediff(current_date(),c.Birthday) / 365) as age,
    case
        when floor(datediff(current_date(),c.Birthday) / 365)  <= 18 then '< 18'
        when floor(datediff(current_date(),c.Birthday) / 365)  between 18 and 24 then '18-24'
        when floor(datediff(current_date(),c.Birthday) / 365)  between 25 and 40 then '25-40'
        when floor(datediff(current_date(),c.Birthday) / 365)  between 41 and 60 then '41-60'
        when floor(datediff(current_date(),c.Birthday) / 365)  between 61 and 80 then '61-80'
        when floor(datediff(current_date(),c.Birthday) / 365)  > 80 then '80+'
    end as age_category,
    p.ProductName ,
    p.Category as ProductCategory,
    p.SubCategory as ProductSubCategory,
    p.UnitCostUSD,
    p.UnitPriceUSD, 
    er.exchange,
    st.OpenDate,
    st.squareMeters,
	case 
		WHEN st.squaremeters between 200  and 500  then '200-500 SqMtrs'
		WHEN st.squaremeters between 501  and 1000 then '500-100 SqMtrs'
		WHEN st.squaremeters between 1001 and 2000 then '1001-2000 SqMtrs'
		WHEN st.squaremeters > 2000                then '>2000 SqMtrs'
	end as StoreSize,
    st.country as StoreCountry,
    st.state as StoreState,
    floor(datediff(current_date(),st.OpenDate)/365)as AgeofStore,
	case 
	when floor(datediff(current_date(),st.OpenDate)/365) between 2  and 5  then '2-5'
	when floor(datediff(current_date(),st.OpenDate)/365) between 6  and 10 then '6-10 Years'
	when floor(datediff(current_date(),st.OpenDate)/365) between 11 and 15 then '11-15 Years'
	when floor(datediff(current_date(),st.OpenDate)/365) > 15              then '15+ Years'
	end as StoreAgeCategory
from dataspark.sales sl
left join dataspark.stores st 
on sl.StoreKey = st.StoreKey
left join dataspark.customers c 
on sl.CustomerKey = c.CustomerKey
left join dataspark.products p
on sl.ProductKey =p.ProductKey
left join dataspark.exchange_rates er 
on er.date = sl.orderDate
and er.currency = sl.currencyCode
