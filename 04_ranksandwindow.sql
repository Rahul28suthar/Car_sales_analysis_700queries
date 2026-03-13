-- 293. rank cars based on price (highest first).
select Company, Model, Price,
rank() over (
	order by Price desc)
from car_data;

-- 294. rank customers based on annual income.
select Customer_name, Annual_income,
rank() over(
	order by Annual_income desc) as Ranks
from car_data;

-- 295. assign row numbers to all car sales ordered by price.
select Company, Model, Price,
row_number()  over(order by price desc) as row_rank
from car_data;

-- 296. rank cars based on price using dense_rank().
select Company, Model, Price,
dense_rank() over (
	order by Price desc)
from car_data;

-- 297. rank customers based on income using dense_rank().
select Customer_name, Annual_income,
dense_rank() over(
	order by Annual_income desc) as Ranks
from car_data;

-- 298. rank cars based on price (lowest first).
select Company, Model, Price,
rank() over (
	order by Price asc)
from car_data;

-- 299. rank companies based on total revenue.
select Company, total_revenue,
rank() over(order by total_revenue desc) as company_rank
from (
	select company, sum(Price) as total_revenue
    from car_data
    group by Company
) t;

-- 300. rank regions based on total cars sold.
select Dealer_Region, cars_sold,
dense_rank() over(order by cars_sold desc) as Dealer_rank 
from(
	select Dealer_Region, count(*) as cars_sold
    from car_data
    group by Dealer_Region
) as t;

-- 301. rank countries based on total revenue.
select Country, total_revenue,
rank() over(order by total_revenue desc) as country_rank
from (
	select company_info.Country, sum(Price) as total_revenue
    from car_data
    join company_info
    on car_data.Company = company_info.Company
    group by company_info.Country
) t;

-- 302. rank body styles based on average price.
select Body_style, avg_price,
rank() over(order by avg_price desc) as body_rank
from (
	select Body_style, round(avg(Price),2) as avg_price
    from car_data
    group by Body_style
) t; 

-- 303. rank companies based on average price.
select Company, avg_price,
rank() over(order by avg_price desc) as company_rank
from (
	select Company, round(avg(Price),2) as avg_price
    from car_data
    group by Company
) t; 

-- 304. rank regions based on average buyer income.
select Dealer_Region, avg_income,
rank() over(order by avg_income desc) as dealer_region_rank
from (
	select Dealer_Region, round(avg(Annual_income),2) as avg_income
    from car_data
    group by Dealer_Region
) t;

-- 305. rank countries based on average buyer income.
select Country,  avgCountry_income,
rank() over (order by avgCountry_income desc) as avgCountry_income
from (
	select company_info.Country, avg(Annual_income)
    as avgCountry_income
    from car_data
    join company_info
    on car_data.Company = company_info.Company
    group by company_info.Country
) t;

-- 306. rank companies based on number of cars sold.
select Company, car_sold,
rank() over(order by car_sold desc) as company_rank
from (
	select Company, count(*) as car_sold
    from car_data
    group by Company
) t; 
-- 307. rank regions based on number of luxury cars sold (>70000).
select Dealer_Region, Price,
rank() over(order by Price desc) as ranks
from car_data
where Price > 70000;

-- 308. rank companies based on maximum price sold.
select Company, max_price,
rank() over(order by max_price desc) as ranks
from (
	select Company, max(Price) as max_price
    from car_data
    group by Company
) t;

-- 309. rank companies based on minimum price sold.
select Company, min_price,
dense_rank() over(order by min_price) as ranks
from (
	select Company, min(Price) as min_price
    from car_data
    group by Company
) t;

-- 310. rank regions based on average car price.
select Dealer_Region, avg_price,
rank() over(order by avg_price desc)
from (
	select Dealer_Region, avg(Price) as avg_price
    from car_data 
    group by Dealer_Region
) t;
-- 311. rank countries based on luxury car sales.
select Country, car_sales,
rank() over(order by car_sales desc) as car_price
from(
	select company_info.Country, count(*) as car_sales
    from car_data
    join company_info
    on car_data.Company = company_info.Company
    where Price > 70000
    group by Country

) t;
-- 312. rank companies based on buyer income.
select company, avg_income,
rank() over(order by avg_income desc) as company_rank
from (
    select company, round(avg(annual_income),2) as avg_income
    from car_data
    group by company
) t;
-- =============
-- PARTITION BY
-- =============

-- 313 Rank cars by price within each company.
select Company, Price,
rank () over (
	partition by Company order by Price desc
) as Price_rank
from car_data;

-- 314 Rank customers by income within each region.
select Customer_name, Annual_income, Dealer_Region,
rank () over (
	partition by Dealer_Region order by Annual_income desc
) as Price_rank
from car_data;

-- 315 Rank cars by price within each body style.
select Company, Price, Body_style,
rank () over (
	partition by Body_style order by Price desc
) as income_rank
from car_data;

-- 316 Rank companies by revenue within each country.
select country, company, total_revenue,
rank() over (partition by country order by total_revenue desc)
as company_rank
from(
	select company_info.Country, car_data.Company,
    sum(Price) as total_revenue
    from car_data
    join company_info
    on car_data.Company = company_info.Company
    group by company_info.Country, car_data.company
) t;
-- 317 Rank regions by average price within each market type.

-- 318 Rank customers by income within each company.
select company, customer_name, annual_income,
rank() over(partition by company order by annual_income desc) as income_rank
from car_data;

-- 319 Rank cars by price within each region.
select dealer_region, car_id, price,
rank() over(partition by dealer_region order by price desc) as price_rank
from car_data;

-- 320 Rank companies by average price within each country.
select Company, Country, avg_price,
rank() over (
	partition by Company, Country
    order by avg_price
) as company_rank
from(
	select company_info.Country, car_data.Company, avg(car_data.Price)
    as avg_price
    from car_data
    join company_info
    on car_data.Company = company_info.Company
    group by company_info.Country, car_data.Company
)t;
-- 321 Rank customers by income within each body style.
select body_style, customer_name, annual_income,
rank() over(partition by body_style order by annual_income desc) as income_rank
from car_data;

-- 322 Rank regions by total revenue within each country.
select Country, Dealer_region,  revenue,
rank() over(
	partition by country order by revenue desc
) as region_rank
from (
	select car_data.Dealer_Region, company_info.Country, 
    sum(Price) as revenue
    from car_data
    join company_info
    on car_data.Company = company_info.Company
    group by company_info.Country, car_data.Dealer_Region
)t;

-- 323 Rank body styles by revenue within each country.
select country, body_style, revenue,
rank() over(partition by country order by revenue desc) as body_rank
from (
    select company_info.country, car_data.body_style, 
    sum(car_data.price) as revenue
    from car_data 
    join company_info 
    on car_data.company = company_info.company
    group by company_info.country, car_data.body_style
) t;

-- 324 Rank companies by total cars sold within each region.
select Company, Dealer_Region, cars_sold,
rank() over (
	partition by Dealer_Region order by cars_sold desc
) as company_rank
from(
	select Dealer_Region, Company, count(*)
    as cars_sold 
    from car_data
    group by Dealer_Region, Company
) t;
-- 325 Rank regions by average income within each market type.
select market_type, dealer_region, avg_income,
rank() over(partition by market_type order by avg_income desc) as region_rank
from (
    select region_info.Market_Type, car_data.Dealer_Region, avg(annual_income) as avg_income
    from car_data
    join region_info
    on car_data.Dealer_Region = region_info.Dealer_Region
    group by region_info.market_type, car_data.dealer_region
) t;

-- 326 Rank companies by luxury car sales within each country.
select country, company, luxury_sales,
rank() over(partition by country order by luxury_sales desc) as company_rank
from (
    select company_info.country, car_data.company, count(*) as luxury_sales
    from car_data 
    join company_info
    on car_data.company = company_info.company
    where car_data.price > 70000
    group by company_info.country, car_data.company
) t;

-- 327 Rank companies by revenue within each market type.
select market_type, company, revenue,
rank() over(partition by market_type order by revenue desc) as company_rank
from (
    select region_info.Market_Type, company, sum(price) as revenue
    from car_data
    join region_info
    on car_data.Dealer_Region = region_info.Dealer_Region
    group by region_info.Market_Type, car_data.Company
) t;

-- 328 Rank customers by car price within each region.
select dealer_region, customer_name, price,
rank() over(partition by dealer_region order by price desc) as price_rank
from car_data;

-- 329 Rank body styles by average price within each region.
select dealer_region, body_style, avg_price,
rank() over(partition by dealer_region order by avg_price desc) as body_rank
from (
    select dealer_region, body_style, avg(price) as avg_price
    from car_data
    group by dealer_region, body_style
) t;

-- 330 Rank companies by buyer income within each country.
select country, company, avg_income,
rank() over(partition by country order by avg_income desc) as company_rank
from (
    select company_info.country, car_data.company, 
    avg(car_data.annual_income) as avg_income
    from car_data 
    join company_info 
    on car_data.company = company_info.company
    group by company_info.country, car_data.company
) t;

-- 331 Rank regions by luxury car sales within each country.
select country, dealer_region, luxury_sales,
rank() over(partition by country order by luxury_sales desc) as region_rank
from (
    select Company.country, car_data.dealer_region, count(*) as luxury_sales
    from car_data 
    join company_info 
    on car_data.company = company_info.company
    where car_data.price > 70000
    group by company_info.country, car_data.dealer_region
) t;

-- 332 Rank companies by average buyer income within each region.
select dealer_region, company, avg_income,
rank() over(partition by dealer_region order by avg_income desc) as company_rank
from (
    select dealer_region, company, avg(annual_income) as avg_income
    from car_data
    group by dealer_region, company
) t;

-- 333 Rank companies by revenue within each country.
select country, company, revenue,
rank() over(partition by country order by revenue desc) as company_rank
from (
    select company_info.country, car_data.company, 
    sum(car_data.price) as revenue
    from car_data 
    join company_info 
    on car_data.company = company_info.company
    group by company_info.country, car_data.company
) t;

-- 334 Rank body styles by total cars sold within each region.
select dealer_region, body_style, total_sales,
rank() over(partition by dealer_region order by total_sales desc) as body_rank
from (
    select dealer_region, body_style, count(*) as total_sales
    from car_data
    group by dealer_region, body_style
) t;

-- 335 Rank companies by minimum price within each country.
select country, company, min_price,
rank() over(partition by country order by min_price desc) as company_rank
from (
    select company_info.country, car_data.company, 
    min(car_data.price) as min_price
    from car_data 
    join company_info a
    on car_data.company = company_info.company
    group by company_info.country, car_data.company
) t;

-- 336 Rank companies by maximum price within each country.
select country, company, max_price,
rank() over(partition by country order by max_price desc) as company_rank
from (
    select company_info.country, car_data.company, 
    max(car_data.price) as max_price
    from car_data 
    join company_info 
    on car_data.company = company_info.company
    group by company_info.country, car_data.company
) t;

-- 337 Rank regions by total revenue within each market type.
select market_type, dealer_region, revenue,
rank() over(partition by market_type order by revenue desc) as region_rank
from (
    select market_type, dealer_region, sum(price) as revenue
    from car_data
    group by market_type, dealer_region
) t;

-- 338 Rank companies by revenue within each region.
select dealer_region, company, revenue,
rank() over(partition by dealer_region order by revenue desc) as company_rank
from (
    select dealer_region, company, sum(price) as revenue
    from car_data
    group by dealer_region, company
) t;

-- 339 Rank body styles by luxury car sales within each region.
select dealer_region, body_style, luxury_sales,
rank() over(partition by dealer_region order by luxury_sales desc) as body_rank
from (
    select dealer_region, body_style, count(*) as luxury_sales
    from car_data
    where price > 70000
    group by dealer_region, body_style
) t;

-- 340 Rank companies by average price within each market type.
select market_type, company, avg_price,
rank() over(partition by market_type order by avg_price desc) as company_rank
from (
    select market_type, company, avg(price) as avg_price
    from car_data
    group by market_type, company
) t;

-- 341 Rank regions by buyer income within each country.
select country, dealer_region, avg_income,
rank() over(partition by country order by avg_income desc) as region_rank
from (
    select company_info.country, car_data.dealer_region, 
    avg(car_data.annual_income) as avg_income
    from car_data 
    join company_info 
    on car_data.company = company_info.company
    group by company_info.country, car_data.dealer_region
) t;

-- 342 Rank companies by cars sold within each market type.
select market_type, company, cars_sold,
rank() over(partition by market_type order by cars_sold desc) as company_rank
from (
    select region_info.Market_Type, car_data.Company, count(*) as cars_sold
    from car_data
    join region_info
    on car_data.Dealer_Region = region_info.Dealer_Region
    group by region_info.Market_Type, car_data.Company
) t;

-- 343. find top5 most expensive cars
select *
from(
	select Model, Company, Price,
    dense_rank() over(order by Price desc) as car_rank
    from car_data
) t 
where car_rank <=5;

-- 344. find top5 richest customers 
select *
from(
	select Customer_name, Annual_income,
    dense_rank() over(order by Annual_income desc) as Income_rank
    from car_data
) t 
where Income_rank <=5;

-- 345. find top3 most expensive cars per company
select company, model, price, price_rank
from (
    select company, model, price,
    rank() over(partition by company order by price desc) as price_rank
    from car_data
) t
where price_rank <= 3;

-- 346. 
-- 346 Find top 3 richest customers per region
select Dealer_Region, Customer_Name, Annual_Income, R
from (
    select Dealer_Region, Customer_Name, Annual_Income,
    rank() over(partition by Dealer_Region order by Annual_Income desc) as R
    from Car_Data
) t
where R <= 3;

-- 247. find top 3 most expensive cars per body style
select *
from(
	select Body_style, Model, Company,
    rank() over(partition by Body_style order by Price)
    as Price_rank
    from car_data
) t
where Price_rank <= 2;

-- 348 Find top 3 companies by revenue per country
select *
from (
    select company_info.Country, car_data.Company, sum(car_data.Price) as Revenue,
    rank() over(partition by C.Country order by Revenue desc) as R
    from Car_Data 
    join Company_Info 
    on car_data.Company = company_info.Company
    group by company_info.Country, car_data.Company
) t
where R <= 3;

-- 349 Find top 5 Companies selling luxury cars
select *
from(
	select Company, count(*) as luxury_sales,
    rank() over(order by count(*) desc) as R
    from car_data
    where Price > 70000
    group by Company
) t 
where R <= 5;

-- 350 find top 3 regions by revenue
select *
from(
	select Dealer_Region, sum(Price) as total_revenue,
	rank() over(order by sum(Price) desc)
	as Ranks
	from car_data
    group by Dealer_Region
) t
where Ranks <= 3;

-- 351 Find top 2 companies selling cars per region
Select Dealer_Region, Company, Cars_Sold, R
From (
    Select Dealer_Region, Company, Count(*) As Cars_Sold,
    Rank() Over(Partition By Dealer_Region Order By Count(*) Desc) As R
    From Car_Data
    Group By Dealer_Region, Company
) T
Where R <= 2;

-- 352 Find top 3 body styles by revenue
Select Body_Style, Revenue, R
From (
    Select Body_Style, Sum(Price) As Revenue,
    Rank() Over(Order By Sum(Price) Desc) As R
    From Car_Data
    Group By Body_Style
) T
Where R <= 3;

-- 353 Find top 3 regions by luxury car sales
Select Dealer_Region, Luxury_Sales, R
From (
    Select Dealer_Region, Count(*) As Luxury_Sales,
    Rank() Over(Order By Count(*) Desc) As R
    From Car_Data
    Where Price > 70000
    Group By Dealer_Region
) T
Where R <= 3;

-- 354 Find top 5 companies by average price
Select Company, Avg_Price, R
From (
    Select Company, Avg(Price) As Avg_Price,
    Rank() Over(Order By Avg(Price) Desc) As R
    From Car_Data
    Group By Company
) T
Where R <= 5;

-- 355 Find top 3 companies by buyer income
Select Company, Avg_Income, R
From (
    Select Company, Avg(Annual_Income) As Avg_Income,
    Rank() Over(Order By Avg(Annual_Income) Desc) As R
    From Car_Data
    Group By Company
) T
Where R <= 3;

-- 356 Find top 3 companies per market type
Select Market_Type, Company, Sales, R
From (
    Select Market_Type, Company, Count(*) As Sales,
    Rank() Over(Partition By Market_Type Order By Count(*) Desc) As R
    From Car_Data
    Group By Market_Type, Company
) T
Where R <= 3;

-- 357 Find top 3 regions per country by revenue
Select Country, Dealer_Region, Revenue, R
From (
    Select C.Country, Cd.Dealer_Region, Sum(Cd.Price) As Revenue,
    Rank() Over(Partition By C.Country Order By Sum(Cd.Price) Desc) As R
    From Car_Data Cd
    Join Company_Info C
    On Cd.Company = C.Company
    Group By C.Country, Cd.Dealer_Region
) T
Where R <= 3;


-- 358 Find top 5 body styles per country by revenue
Select Country, Body_Style, Revenue, R
From (
    Select C.Country, Cd.Body_Style, Sum(Cd.Price) As Revenue,
    Rank() Over(Partition By C.Country Order By Sum(Cd.Price) Desc) As R
    From Car_Data Cd
    Join Company_Info C
    On Cd.Company = C.Company
    Group By C.Country, Cd.Body_Style
) T
Where R <= 5;


-- 359 Find top 2 companies per country by luxury car sales
Select Country, Company, Luxury_Sales, R
From (
    Select C.Country, Cd.Company, Count(*) As Luxury_Sales,
    Rank() Over(Partition By C.Country Order By Count(*) Desc) As R
    From Car_Data Cd
    Join Company_Info C
    On Cd.Company = C.Company
    Where Cd.Price > 70000
    Group By C.Country, Cd.Company
) T
Where R <= 2;

-- 360 Find top 3 companies per region by revenue
Select Dealer_Region, Company, Revenue, R
From (
    Select Dealer_Region, Company, Sum(Price) As Revenue,
    Rank() Over(Partition By Dealer_Region Order By Sum(Price) Desc) As R
    From Car_Data
    Group By Dealer_Region, Company
) T
Where R <= 3;

-- 361 Find top 3 customers per company by income
Select Company, Customer_Name, Annual_Income, R
From (
    Select Company, Customer_Name, Annual_Income,
    Rank() Over(Partition By Company Order By Annual_Income Desc) As R
    From Car_Data
) T
Where R <= 3;

-- 362 Find top 5 most expensive cars per region
Select Dealer_Region, Model, Price, R
From (
    Select Dealer_Region, Model, Price,
    Rank() Over(Partition By Dealer_Region Order By Price Desc) As R
    From Car_Data
) T
Where R <= 5;

-- 363 Find top 3 companies per market type by revenue
Select Market_Type, Company, Revenue, R
From (
    Select Market_Type, Company, Sum(Price) As Revenue,
    Rank() Over(Partition By Market_Type Order By Sum(Price) Desc) As R
    From Car_Data
    Group By Market_Type, Company
) T
Where R <= 3;

-- 364 Find top 2 regions per country by average price
Select Country, Dealer_Region, Avg_Price, R
From (
    Select C.Country, Cd.Dealer_Region, Avg(Cd.Price) As Avg_Price,
    Rank() Over(Partition By C.Country Order By Avg(Cd.Price) Desc) As R
    From Car_Data Cd
    Join Company_Info C
    On Cd.Company = C.Company
    Group By C.Country, Cd.Dealer_Region
) T
Where R <= 2;

 -- 365 Find top 3 body styles per region by sales
Select Dealer_Region, Body_Style, Sales, R
From (
    Select Dealer_Region, Body_Style, Count(*) As Sales,
    Rank() Over(Partition By Dealer_Region Order By Count(*) Desc) As R
    From Car_Data
    Group By Dealer_Region, Body_Style
) T
Where R <= 3;

 -- 366 Find top 3 companies per country by average price
Select Country, Company, Avg_Price, R
From (
    Select C.Country, Cd.Company, round(avg(Cd.Price),2) As Avg_Price,
    Rank() Over(Partition By C.Country Order By Avg(Cd.Price) Desc) As R
    From Car_Data Cd
    Join Company_Info C
    On Cd.Company = C.Company
    Group By C.Country, Cd.Company
) T
Where R <= 3;  

-- 367 Find top 3 companies per region by income buyers
Select Dealer_Region, Company, Avg_Income, R
From (
    Select Dealer_Region, Company, Avg(Annual_Income) As Avg_Income,
    Rank() Over(Partition By Dealer_Region Order By Avg(Annual_Income) Desc) As R
    From Car_Data
    Group By Dealer_Region, Company
) T
Where R <= 3;

-- 368 Find top 3 regions by average buyer income
Select Dealer_Region, Avg_Income, R
From (
    Select Dealer_Region, Avg(Annual_Income) As Avg_Income,
    Rank() Over(Order By Avg(Annual_Income) Desc) As R
    From Car_Data
    Group By Dealer_Region
) T
Where R <= 3;

-- 369 Find top 3 companies selling expensive cars per country
Select Country, Company, Sales, R
From (
    Select C.Country, Cd.Company, Count(*) As Sales,
    Rank() Over(Partition By C.Country Order By Count(*) Desc) As R
    From Car_Data Cd
    Join Company_Info C
    On Cd.Company = C.Company
    Where Cd.Price > 70000
    Group By C.Country, Cd.Company
) T
Where R <= 3;

-- 370 Find top 3 companies selling cheapest cars per country
Select Country, Company, Avg_Price, R
From (
    Select C.Country, Cd.Company, Avg(Cd.Price) As Avg_Price,
    Rank() Over(Partition By C.Country Order By Avg(Cd.Price)) As R
    From Car_Data Cd
    Join Company_Info C
    On Cd.Company = C.Company
    Group By C.Country, Cd.Company
) T
Where R <= 3;

-- 371 Find top 3 companies per market type by sales
Select Market_Type, Company, Sales, R
From (
    Select Market_Type, Company, Count(*) As Sales,
    Rank() Over(Partition By Market_Type Order By Count(*) Desc) As R
    From Car_Data
    Group By Market_Type, Company
) T
Where R <= 3;

-- 372 Find top 3 body styles per country by luxury sales
Select Country, Body_Style, Luxury_Sales, R
From (
    Select C.Country, Cd.Body_Style, Count(*) As Luxury_Sales,
    Rank() Over(Partition By C.Country Order By Count(*) Desc) As R
    From Car_Data Cd
    Join Company_Info C
    On Cd.Company = C.Company
    Where Cd.Price > 70000
    Group By C.Country, Cd.Body_Style
) T
Where R <= 3;

-- =============================
-- BUSINESS ANALYTICS QUESTIONS
-- =============================
-- 373 Find price difference between current car and previous car price
select Model, Price,
Price - lag(Price) over(order by Price) as Price_difference
from car_data;

-- 374 find income difference between current and previous custmoer incme
select Customer_name, Annual_income,
Annual_income - lag(Annual_income) over(order by Annual_income)
as Income_dif
from car_data;

-- 375 find running total revenue orderred by price
select Model, Price,
sum(Price) over(order by Price) as running_revenue
from car_data;

-- 376 Find running total of cars sold per company
select Company,
Count(*) Over(Partition By Company Order By Price) As Running_Cars
From Car_Data;

-- 377 Find running average price per company
select Company, Price,
avg(Price) over(partition by Company order by Price) as Running_Avg_Price
from Car_Data;

-- 378 Find running average income per region
select Dealer_Region, Annual_Income,
avg(Annual_Income) Over(Partition By Dealer_Region Order By Annual_Income) As Running_Avg_Income
From Car_Data;

-- 379 Find cumulative revenue per country
select Country, Price,
Sum(Price) over(partition by Country order by Price) as Cumulative_Revenue
from Car_Data 
join Company_Info 
on car_data.Company = company_info.Company;

-- 380 Find cumulative cars sold per company
select Company,
count(*) over(partition by Company order by Price) 
as Cumulative_Sales
from Car_Data;

-- 381 Find cumulative luxury car sales per region
select Dealer_Region,
count(*) over(partition by Dealer_Region order by Price) 
as Luxury_Cumulative
from Car_Data
where Price > 70000;

-- 382 Find cumulative revenue per market type
select Market_Type, Price,
sum(Price) over(partition by Market_Type order by Price) 
as Cum_Revenue
from Car_Data;

-- 383 Find price difference between highest and lowest per company
select Company,
max(Price) over(partition by Company) -
Min(Price) Over(partition by Company) as Price_Gap
from Car_Data;

-- 384 Find revenue contribution percentage per company
select Company,
sum(Price) / sum(sum(Price)) over() * 100 as Revenue_Percent
From Car_Data
group by Company;

-- 385 Find revenue contribution percentage per region
select Dealer_Region,
sum(Price) / sum(sum(Price)) over() * 100 as Revenue_Percent
from Car_Data
group by Dealer_Region;

-- 386 Find revenue contribution percentage per country
select Country,
sum(Price) / sum(sum(Price)) over() * 100 as Revenue_Percent
from Car_Data Cd
join Company_Info C
on Cd.Company = C.Company
group by Country;


-- 387 Find percentage of luxury cars sold per company
select Company,
count(*) / sum(Count(*)) over() * 100 as Luxury_Percent
from Car_Data
where Price > 70000
group by Company;

-- 388 Find percentage of cars sold per body style
select Body_Style,
count(*) / sum(count(*)) over() * 100 as Body_Percent
from Car_Data
group by Body_Style;

-- 389 Find company revenue share per country
select Country, Company,
sum(Price) / sum(sum(Price)) over(partition by Country) * 100 as Share
from Car_Data Cd
join Company_Info C
on Cd.Company = C.Company
group by Country, Company;

-- 390 Find region revenue share per country
select Country, Dealer_Region,
sum(Price) / sum(sum(Price)) over(partition by Country) * 100 as Share
from Car_Data Cd
join Company_Info C
on Cd.Company = C.Company
group by Country, Dealer_Region;

-- 391 Find company share of luxury cars in each region
Select Dealer_Region, Company,
Count(*) / Sum(Count(*)) Over(Partition By Dealer_Region) * 100 As Share
From Car_Data
Where Price > 70000
Group By Dealer_Region, Company;

-- 392 Find body style share of total revenue
Select Body_Style,
Sum(Price) / Sum(Sum(Price)) Over() * 100 As Revenue_Share
From Car_Data
Group By Body_Style;

-- 393 Find percentage difference between company price and global price
Select Company, Price,
(Price - Avg(Price) Over()) / Avg(Price) Over() * 100 As Percent_Diff
From Car_Data;

-- 394 Find income percentage difference between customers
Select Customer_Name, Annual_Income,
(Annual_Income - Lag(Annual_Income) Over(Order By Annual_Income)) /
Lag(Annual_Income) Over(Order By Annual_Income) * 100 As Income_Percent_Diff
From Car_Data;

-- 395 Find companies whose revenue share exceeds 20%
Select Company
From (
    Select Company,
    Sum(Price) / Sum(Sum(Price)) Over() * 100 As Share
    From Car_Data
    Group By Company
) T
Where Share > 20;

-- 396 Find regions contributing most revenue to country
Select *
From (
    Select Country, Dealer_Region, Sum(Price) As Revenue,
    Rank() Over(Partition By Country Order By Sum(Price) Desc) As R
    From Car_Data Cd
    Join Company_Info C
    On Cd.Company = C.Company
    Group By Country, Dealer_Region
) T
Where R = 1;

-- 397 Find companies contributing most revenue to market type
Select *
From (
    Select Market_Type, Company, Sum(Price) As Revenue,
    Rank() Over(Partition By Market_Type Order By Sum(Price) Desc) As R
    From Car_Data
    Group By Market_Type, Company
) T
Where R = 1;

-- 398 Find regions contributing most luxury car sales
Select *
From (
    Select Dealer_Region, Count(*) As Sales,
    Rank() Over(Order By Count(*) Desc) As R
    From Car_Data
    Where Price > 70000
    Group By Dealer_Region
) T
Where R = 1;

-- 399 Find companies contributing most expensive cars
Select *
From (
    Select Company, Max(Price) As Max_Price,
    Rank() Over(Order By Max(Price) Desc) As R
    From Car_Data
    Group By Company
) T
Where R = 1;

-- -- 400 Find revenue gap between top and second company
Select Company, Revenue,
Revenue - Lead(Revenue) Over(Order By Revenue Desc) As Revenue_Gap
From (
    Select Company, Sum(Price) As Revenue
    From Car_Data
    Group By Company
) T;

