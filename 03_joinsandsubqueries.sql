-- 181., 182. change table name for company_info_updated and region_info_updated
rename table company_info_updated to company_info;
rename table region_info_updated to region_info;

-- =====================
-- SUBQUERIES AND JOINS 
-- =====================

-- 183. find customers whose Anuual income is above avg income 
select Customer_name, Annual_income 
from car_data
where Annual_income > 
(select avg(Annual_income) from car_data);

-- 184. find cars whose peice is above avg.  price
select Company, Model, Price from car_data 
where Price > (Select avg(Price) from car_data);

-- 185. find ccustomers who bought cars cheaper than the avg price
select Customer_name, Company, Model, Price from car_data 
where Price < (Select avg(Price) from car_data);

-- 186. find companies who sold car above avg.  price
select Company from car_data 
where Price > (Select avg(Price) from car_data);

-- 187. find cars whose peice is above avg.  price
select Company, Model, Price from car_data 
where Price > (Select avg(Price) from car_data);

-- 188. find cars whose price is equal to max price
select Company, Model, Price from car_data 
where Price = (Select max(Price) from car_data);

-- 189. ind cars whose price is equal to min price
select Company, Model, Price from car_data 
where Price = (Select min(Price) from car_data);

-- 190. find cars whose peice is above avg.  price
select Customer_name, Annual_income from car_data 
where Annual_income > (
	Select max(Annual_income) 
	from car_data
	where Company = 'Toyota'
);

-- 191. find cars whose car price is above avg. bmw price
select Customer_name, Model from car_data 
where Price > (
	Select avg(Price) 
	from car_data
	where Company = 'BMW'
);

-- 192. find customers whose avg income is less than male avg income
select Customer_name, Annual_income from car_data 
where Annual_income < (
	Select avg(Annual_income) 
	from car_data
	where Gender = 'Male'
);

-- 193. find cars whose price is greater than the avg price of austin region
select Company, Model, Price
from car_data
where Price >(
	select avg(Price) from car_data
    where Dealer_Region = 'Austin'
);

-- 194. Find companies whose average price is greater than the global average price.
select Company from car_data
group by Company
having avg(Price) > (select avg(Price) from car_data);

-- 195. Find regions where average price is greater than global average price
select Dealer_Region from car_data
group by Dealer_Region
having avg(Price) > (select avg(Price) from car_data);

-- 196.Find body styles whose average price is greater than overall average
select Body_style from car_data
group by Body_style
having avg(Price) > (select avg(Price) from car_data);

-- 197.Find companies whose minimum price is greater than overall minimum price
select Company from car_data
group by Company
having min(Price) > (select min(Price) from car_data)
order by Company asc;


-- 198. Find companies whose maximum price is less than overall maximum price.
select Company from car_data
group by Company
having max(Price) < (select max(Price) from car_data)
order by Company asc;

-- 200. Find customers earning more than the average income in their region.
select Customer_name, Dealer_Region, Annual_income from car_data
where Annual_income > 
(select avg(Annual_income) from car_data
	where Dealer_Region = Dealer_Region
);

-- 201.Find companies selling cars above average income buyers.
select distinct Company, Price
from car_data
having Price > (
    select avg(Annual_income)
    from car_data
);

-- 202.Find customers buying cars more expensive than the regional average
select Customer_name, Company, Price, Dealer_Region 
from car_data
where Price > (
	select avg(Price) from car_data
    where Dealer_Region = Dealer_Region
);
-- 203.Find companies whose average price is higher than Toyota’s average price.
select Company 
from car_data
group by Company
having avg(Price) > (
	select avg(Price) 
    from car_data
    where Company = 'Toyota'
);

-- 204. Find companies whose average income of buyers is greater than overall average income.
select Company
from car_data
group by Company
having avg(Annual_income) >
(
    select avg(Annual_income)
    from car_data
);

-- 205.Find customers whose income is higher than BMW buyers' average income.
select Customer_name, Annual_income
from car_data
where Annual_income >
(
    select avg(Annual_income)
    from car_data
    where Company = 'BMW'
);

-- 206.Find body styles with average price higher than SUV average price
select Body_style
from car_data
group by Body_style
having avg(Price) >
(
    select avg(Price)
    from car_data
    where Body_style = 'SUV'
);


-- 207.Find companies whose max price is higher than Ford's max price
select Company
from car_data
group by Company
having max(Price) >
(
    select max(Price)
    from car_data
    where Company = 'Ford'
);

-- 208.Find companies whose min price is lower than Toyota's min price.
select Company
from car_data
group by Company
having min(Price) <
(
    select min(Price)
    from car_data
    where Company = 'Toyota'
);

-- 209. Find customers whose income is greater than the average income of their company buyers.
select Company, Customer_name, Annual_income 
from car_data c1
where Annual_income > (
	select avg(Annual_income)
    from car_data c2
    where c1.Company = c2.Company
);
-- 210. Find customers who bought cars more expensive than the average price of that company.
select Company, Customer_name, Price 
from car_data c1
where Price > (
	select avg(Price)
    from car_data c2
    where c1.Company = c2.Company
)
order by Company;

-- 211. Find customers whose income is higher than the regional average income.
select Dealer_Region, Customer_name, Annual_income 
from car_data c1
where Annual_income > (
	select avg(Annual_income)
    from car_data c2
    where c1.Dealer_Region = c2.Dealer_Region
);

-- 212. Find cars whose price is higher than the average price of that body style.
select Company, Model, Body_style, Price
from car_data c1
where Price >
(
    select avg(Price)
    from car_data c2
    where c2.Body_style = c1.Body_style
);

-- 213. Find customers whose car price is above the company average price.
select Customer_name, Company, Price
from car_data c1
where Price >
(
    select avg(Price)
    from car_data c2
    where c2.Company = c1.Company
);

-- 214. Find customers whose income is below the company average income.
select Customer_name, Company, Annual_income
from car_data c1
where Annual_income <
(
    select avg(Annual_income)
    from car_data c2
    where c2.Company = c1.Company
);

-- 215.Find customers who bought cars above the average price in their region.
select Customer_name, Dealer_Region, Price
from car_data c1
where Price >
(
    select avg(Price)
    from car_data c2
    where c2.Dealer_Region = c1.Dealer_Region
);

-- 216. Find companies where a car is sold above its company average price.
select distinct Company
from car_data c1
where Price >
(
    select avg(Price)
    from car_data c2
    where c2.Company = c1.Company
);

-- 217. Find customers whose income is above the average income of the same gender.
select Customer_name, Gender, Annual_income
from car_data c1
where Annual_income >
(
    select avg(Annual_income)
    from car_data c2
    where c2.Gender = c1.Gender
);

-- 218. Find customers whose car price is below the regional average price.
select Dealer_Region, Customer_name, Model, Price
from car_data c1
where Price >
(
    select avg(Price)
    from car_data c2
    where c2.Dealer_Region = c1.Dealer_Region
);
-- 219. Find companies where max price exceeds company average price.
select Company
from car_data 
group by Company
having max(Price) > avg(Price);

-- 220. Find regions where max income exceeds regional average income.
select Dealer_Region
from car_data
group by Dealer_Region
having max(Annual_income) > avg(Annual_income);

-- 221. Find customers whose income is higher than the average income of the same body style buyers.
select Customer_name, Body_style, Annual_income
from car_data c1
where Annual_income >
(
    select avg(Annual_income)
    from car_data c2
    where c2.Body_style = c1.Body_style
);

-- 222. Find companies where price variance exists (price greater than min price).
select distinct Company
from car_data c1
where Price >
(
    select min(Price)
    from car_data c2
    where c2.Company = c1.Company
);

-- 223. Find customers whose income is greater than the average income of people buying the same model.
select Customer_name, Model, Annual_income
from car_data c1
where Annual_income >
(
    select avg(Annual_income)
    from car_data c2
    where c2.Model = c1.Model
);

-- 224. Find regions where some cars are priced above regional average price.
select distinct Dealer_Region
from car_data c1
where Price >
(
    select avg(Price)
    from car_data c2
    where c2.Dealer_Region = c1.Dealer_Region
);

-- 225.Find companies where some customers earn above the company average.
select distinct Company
from car_data c1
where Annual_income >
(
    select avg(Annual_income)
    from car_data c2
    where c2.Company = c1.Company
);

-- 226. Find body styles where max price exceeds body style average price.
select Body_style
from car_data
group by Body_style
having max(Price) > avg(Price);

-- 227. Find customers whose car price is higher than average price of their gender group.
select Customer_name, Gender, Price
from car_data c1
where Price >
(
    select avg(Price)
    from car_data c2
    where c2.Gender = c1.Gender
);

-- 228. Find companies where average income of buyers exceeds global average.
-- assume global avg income is 58999
select Company
from car_data
group by Company
having avg(Annual_income) > 58999;

-- 229. Find customers whose income exceeds average income of their body style group.
select Customer_name, Body_style, Annual_income
from car_data c1
where Annual_income >
(
    select avg(Annual_income)
    from car_data c2
    where c2.Body_style = c1.Body_style
);

-- 230. Find regions where average income exceeds national average.
select Dealer_Region
from car_data
group by Dealer_Region
having avg(Annual_income) >
(
    select avg(Annual_income)
    from car_data
);

-- 231. Find customers whose income exceeds average income of customers buying the same model.
select Customer_name, Model, Annual_income
from car_data c1
where Annual_income >
(
    select avg(Annual_income)
    from car_data c2
    where c2.Model = c1.Model
);

-- 232. Find companies where minimum price exceeds global average price.
select Company
from car_data
group by Company
having min(Price) >
(
    select avg(Price)
    from car_data
);

-- 233. Find customers whose income exceeds average income of the same company buyers.
select Customer_name, Company, Annual_income
from car_data c1
where Annual_income >
(
    select avg(Annual_income)
    from car_data c2
    where c2.Company = c1.Company
);

-- ==============
-- JOINS QUERIES
-- ==============

-- 234. List customers with company country
select car_data.Customer_name,company_info.Country
from car_data
inner join company_info
on car_data.Company = company_info.Company;

-- 235. List customers with region market type
select car_data.Customer_name, region_info.Market_Type
from car_data
inner join region_info
on car_data.Dealer_Region = region_info.Dealer_Region;

-- 236. total cars sold by in every country
select company_info.Country, count(*) as total_cars_sold
from car_data
join company_info
on car_data.Company = company_info.Company
group by company_info.Country
order by total_cars_sold desc;

-- 237. avg car price per country
select company_info.Country, round(avg(Price),2) as avg_price_per_country
from car_data
join company_info
on car_data.Company = company_info.Company
group by company_info.Country
order by avg_price_per_country desc;

-- 238. Find average customer income per country.
select company_info.Country, round(avg(Annual_income),2) as avg_income
from car_data
join company_info
on car_data.Company = company_info.Company
group by company_info.Country;

-- 239. Count number of customers per market type.
select company_info.Market_type, count(*) as total_customers
from car_data
join company_info
on car_data.Company = company_info.Company
group by company_info.Market_type;

-- 240. Find most expensive car per country.
select company_info.Country, max(Price) as most_expensive_car
from car_data
join company_info
on car_data.Company = company_info.Company
group by company_info.Country;

-- 241. Find cheapest car per country.
select company_info.Country, min(Price) as least_expensive_car
from car_data
join company_info
on car_data.Company = company_info.Company
group by company_info.Country;

-- 242. Find companies selling cars in each market type.
select region_info.Market_type, count(*) as total_customers
from car_data
join region_info
on car_data.Dealer_Region = region_info.Dealer_Region
group by region_info.Market_type;

-- 243. Count total cars sold per region.
select region_info.Dealer_Region, count(*) as total_cars_sold
from car_data
join region_info
on car_data.Dealer_Region = region_info.Dealer_Region
group by region_info.Dealer_Region;

-- 244. Find average income per region.
select region_info.Dealer_Region, avg(car_data.Annual_income) as avg_income
from car_data
join region_info
on car_data.Dealer_Region = region_info.Dealer_Region
group by region_info.Dealer_Region;

-- 245. Find max price per region.
select region_info.Dealer_Region, max(car_data.Price) as max_price
from car_data
join region_info
on car_data.Dealer_Region = region_info.Dealer_Region
group by region_info.Dealer_Region;

-- 246. Find min price per region.
select region_info.Dealer_Region, min(car_data.Price) as min_price
from car_data
join region_info
on car_data.Dealer_Region = region_info.Dealer_Region
group by region_info.Dealer_Region;

-- 247. Find total revenue per company country.
select company_info.Country, sum(car_data.Price) as total_revenue
from car_data
join company_info
on car_data.Company = company_info.Company
group by company_info.Country;

-- 248. Find average price per market type.
select region_info.Market_type, avg(car_data.Price) as avg_price
from car_data
join region_info
on car_data.Dealer_Region = region_info.Dealer_Region
group by region_info.Market_type;

-- 249. Find company with highest revenue per country.
select company_info.Country, car_data.Company, sum(car_data.Price) as revenue
from car_data
join company_info
on car_data.Company = company_info.Company
group by company_info.Country, car_data.Company
order by revenue desc;

-- 250. Find body style distribution per country.
select company_info.Country, car_data.Body_style, count(*) as total
from car_data
join company_info
on car_data.Company = company_info.Company
group by company_info.Country, car_data.Body_style;

-- 251. Find average income of customers per company country.
select company_info.Country, avg(car_data.Annual_income) as avg_income
from car_data
join company_info
on car_data.Company = company_info.Company
group by company_info.Country;

-- 252. Find total cars sold per company.
select company_info.Company, count(*) as total_cars_sold
from car_data
join company_info
on car_data.Company = company_info.Company
group by company_info.Company;

-- 253. Find average price per company.
select company_info.Company, avg(car_data.Price) as avg_price
from car_data
join company_info
on car_data.Company = company_info.Company
group by company_info.Company;

-- 254. Find companies selling cars in multiple regions.
select company_info.Company
from car_data
join company_info
on car_data.Company = company_info.Company
group by company_info.Company
having count(distinct car_data.Dealer_Region) > 1;

-- 255. Find regions selling cars from multiple countries.
select car_data.Dealer_Region
from car_data
join company_info
on car_data.Company = company_info.Company
group by car_data.Dealer_Region
having count(distinct company_info.Country) > 1;

-- 256. Find countries where average income exceeds 80k.
select company_info.Country, avg(car_data.Annual_income) as avg_income
from car_data
join company_info
on car_data.Company = company_info.Company
group by company_info.Country
having avg(car_data.Annual_income) > 80000;

-- 257. Find regions where average price exceeds 50k.
select Dealer_Region, avg(Price) as avg_price
from car_data
group by Dealer_Region
having avg(Price) > 50000;

-- ===================
-- JOINS + SUBQUERIES
-- ===================

-- 258. Find countries where average price exceeds global average.
select company_info.Country, round(avg(Price),2) as avg_price_country
from car_data 
join company_info
on car_data.Company = company_info.Company
group by company_info.Country
having avg(Price)>(
	select avg(Price)
    from car_data
);

-- 259. Find companies whose average price exceeds country average.
select car_data.Company, round(avg(Price),2) as avg_price
from car_data 
join company_info
on car_data.Company = company_info.Company
group by car_data.Company, company_info.Country
having avg(Price)>(
	select avg(Price)
    from car_data 
    join company_info
    on car_data.Company = company_info.Company
    where company_info.Country = company_info.Country
);

-- 260. Find regions whose average income exceeds country average income.
select Dealer_Region from car_data
group by Dealer_Region
having avg(Annual_income) >(
	select avg(Annual_income)
    from car_data
);

-- 261. Find customers whose income exceeds country average income.
select car_data.Customer_name, Annual_income
from car_data 
join company_info c1
on car_data.Company = c1.Company
where car_data.Annual_income > (
	select avg(Annual_income)
    from car_data 
    join company_info c2
    on car_data.Company = c2.Company
    where c1.Country = c2.Country
);
    
-- 262. Find companies selling cars above global average price.
select distinct Company
from car_data
where Price >
(
    select avg(Price)
    from car_data
);

-- 263. Find regions selling cars above global average price.
select distinct car_data.company, car_data.Price
from car_data 
join company_info c1
on car_data.company = c1.company
where car_data.price >
(
    select avg(price)
    from car_data
);

-- 264. Find body styles whose average price exceeds country average price.
select Body_style 
from car_data 
join company_info c1
on car_data.Company = c1.Company
group by Body_style, c1.Country
having avg(car_data.Price) >
(
    select avg(car_data.Price)
    from car_data 
    join company_info c2
    on car_data.Company = c2.Company
    where c2.Country = c1.Country
);

-- 265. Find customers buying cars above country average price.
select car_data.Customer_name
from car_data 
join company_info c1
on car_data.Company = c1.Company
where car_data.Price >
(
    select avg(car_data.Price)
    from car_data 
    join company_info c2
    on car_data.Company = c2.Company
    where c2.Country = c1.Country
);

-- 266. Find companies where max price exceeds global max price minus 10k.
select car_data.dealer_region
from car_data 
join company_info c1
on car_data.company = c1.company
group by car_data.dealer_region, c1.country
having avg(car_data.annual_income) >
(
    select avg(car_data.annual_income)
    from car_data 
    join company_info c2
    on car_data.company = c2.company
    where c2.country = c1.country
);

-- 267. Find regions where avg income exceeds national average income.
select car_data.customer_name
from car_data 
join company_info c1
on car_data.company = c1.company
where car_data.Annual_income >
(
    select avg(car_data.Annual_income)
    from car_data 
    join company_info c2
    on car_data.company = c2.company
    where c2.country = c1.country
);

-- 268. Find customers whose income exceeds country average buyer income.
select car_data.Customer_name
from car_data 
join company_info c1
on car_data.Company = c1.Company
where car_data.Annual_income >
(
    select avg(car_data.Annual_income)
    from car_data
    join company_info c2
    on car_data.Company = c2.Company
    where c2.Country = c1.Country
);

-- 269. Find companies whose average income buyers exceeds country average.
select car_data.Company
from car_data 
join company_info c1
on car_data.Company = c1.Company
group by car_data.Company, c1.Country
having avg(car_data.Annual_income) >
(
    select avg(car_data.Annual_income)
    from car_data 
    join company_info c2
    on car_data.Company = c2.Company
    where c2.Country = c1.Country
);

-- 270. Find regions whose total revenue exceeds global average revenue per region.
select Dealer_Region
from car_data
group by Dealer_Region
having sum(Price) >
(
    select avg(region_revenue)
    from (
        select sum(Price) as region_revenue
        from car_data
        group by Dealer_Region
    ) t
);

-- 271. Find companies whose total cars sold exceeds country average sales.
select car_data.Company
from car_data 
join company_info c1
on car_data.Company = c1.Company
group by car_data.Company, c1.Country
having count(*) >
(
    select avg(company_sales)
    from (
        select count(*) as company_sales
        from car_data 
        join company_info c2
        on car_data.Company = c2.Company
        where c1.Country = c2.Country
        group by c2.Company
    ) t
);

-- 272. Find countries with total revenue exceeding global average revenue.
select c1.Country
from car_data
join company_info c1
on car_data.Company = c1.Company
group by c1.Country
having SUM(car_data.Price) >
(
    select avg(country_revenue)
    from (
        select SUM(car_data.Price) as country_revenue
        from car_data
        join company_info c2
        on car_data.Company = c2.Company
        group by c2.Country
    ) t
);

-- 273. Find companies whose minimum price exceeds country minimum price.
select car_data.Company
from car_data 
join company_info c1
on car_data.Company = c1.Company
group by car_data.Company, c1.Country
having min(Price) >
(
    select min(Price)
    from car_data 
    join company_info c2
    on car_data.Company = c2.Company
    where c1.Country = c2.Country
);

-- 274. Find companies whose max price exceeds country average price.
select car_data.Company
from car_data 
join company_info c1
on car_data.Company = c1.Company
group by car_data.Company, c1.Country
having max(Price) >
(
    select avg(Price)
    from car_data 
    join company_info c2
    on car_data.Company = c2.Company
    where c1.Country = c2.Country
);

-- 275. Find regions where max income exceeds country average income.
select car_data.dealer_region
from car_data 
join company_info c1
on car_data.company = c1.company
group by car_data.dealer_region, c1.country
having avg(car_data.price) >
(
    select avg(car_data.price)
    from car_data 
    join company_info c2
    on car_data.company = c2.company
    where c2.country = c1.country
);

-- 276. Find companies whose avg buyer income exceeds regional average.
select Company
from car_data c1
group by Company
having avg(Annual_income) >
(
    select avg(Annual_income)
    from car_data c2
    where c2.Dealer_Region = c1.Dealer_Region
);

-- 277. Find regions where average car price exceeds country average. 
select Dealer_Region
from car_data 
join company_info c1
on car_data.Company = c1.Company
group by Dealer_Region, c1.Country
having avg(Price) >
(
    select avg(Price)
    from car_data 
    join company_info c2
    on car_data.Company = c2.Company
    where c1.Country = c2.Country
);
-- ===================
-- BUSINESS QUESTIONS
-- ===================

-- 278. find top 3 richest customers country.
select car_data.Customer_name , company_info.Country, max(car_data.Annual_income)
from car_data
join company_info
on car_data.Company = company_info.Company
group by Customer_name, company_info.Country
order by max(car_data.Annual_income) desc limit 3;

-- 279. find top 3 most expensive cars regions country .
select car_data.Model , region_info.Country, max(car_data.Price)
from car_data
join region_info
on car_data.Dealer_Region = region_info.Dealer_Region
group by car_data.Model, region_info.Country
order by max(car_data.Price) desc limit 3;

-- 280. find regions where average price is higher than country average.
select car_data.dealer_region
from car_data 
join company_info c1
on car_data.company = c1.company
group by car_data.dealer_region, c1.country
having avg(car_data.price) >
(
    select avg(car_data.price)
    from car_data 
    join company_info c2
    on car_data.company = c2.company
    where c2.country = c1.country
);

-- 281. find countries where price variance is highest.
select country, (max(price) - min(price)) as price_variance
from car_data 
join company_info c1
on car_data.company = c1.company
group by country
order by price_variance desc
limit 1;

-- 282. find companies with highest price variance across regions.
select company, (max(price) - min(price)) as price_variance
from car_data
group by company
order by price_variance desc;

-- 283. find regions where average price increased above company average.
select c1.dealer_region, c1.company
from car_data c1
group by c1.dealer_region, c1.company
having avg(c1.price) >
(
    select avg(c2.price)
    from car_data c2
    where c2.company = c1.company
);
-- 284. find countries where high-income buyers prefer specific body styles.
select company_info.country, car_data.body_style, count(*) as buyers
from car_data 
join company_info 
on car_data.company = company_info.company
where car_data.annual_income > 80000
group by company_info.country, car_data.body_style
order by buyers desc;

-- 285. find companies selling luxury cars across the most regions.
select company, count(distinct dealer_region) as regions_selling_luxury
from car_data
where price > 70000
group by company
order by regions_selling_luxury desc;

-- 286. find most car company sold in each region
select Dealer_Region, count(*) as Total_cars_sold
from car_data
group by Dealer_Region
order by Total_cars_sold desc limit 1;

-- 287. most sold body style in each country
select car_data.Body_style, company_info.Country, count(*)
as bodystyle_count
from car_data
join company_info
on car_data.Company = company_info.Company
group by company_info.Country,car_data.Body_style
order by company_info.Country asc;

-- 288. find avg buyer income per country
select  company_info.Country,
round(avg(car_data.Annual_income),2) as avg_income
from car_data
join company_info
on car_data.Company = company_info.Company
group by company_info.Country
order by avg_income desc;

-- 289. find avg buyer income per region
select Dealer_Region, round(avg(car_data.Annual_income),2)
as avg_income
from car_data
group by Dealer_Region
order by avg_income desc;

-- 290. Countries where avg income buyer > 850k
select  company_info.Country,
round(avg(car_data.Annual_income),2) as avg_income
from car_data
join company_info
on car_data.Company = company_info.Company
group by company_info.Country
having avg_income > 850000
order by avg_income desc;

-- 291. countries generating highest revenue 
select company_info.Country , sum(car_data.Price)
as total_revenue
from car_data
join company_info
on car_data.Company = company_info.Company
group by company_info.Country 
order by total_revenue desc limit 1;

-- 292. countries selling highest priced cars
select company_info.Country, max(car_data.Price)
as most_expensive_cars
from car_data
join company_info
on car_data.Company = company_info.Company
group by company_info.Country
order by most_expensive_cars desc;

