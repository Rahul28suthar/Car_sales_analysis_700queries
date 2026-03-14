-- =============
-- CASE QUERIES
-- =============

-- 401 Categorize customers into Ultra Rich (>150000), Rich (100000–150000), Middle (50000–100000), Low (<50000) based on Annual_Income.
select Customer_name, Annual_income,
case
	when Annual_income > 500000 then 'Ultra Rich'
    when Annual_income between 100000 and 500000 then 'Ultra Rich'
    when Annual_income between  100000 and 500000 then 'Ultra Rich'
    else 'Low_income'
end as income_category
from car_data;
    
-- 402 Create a column showing High Value Buyer if Price > 70000.
select Customer_Name, Price,
case
	when Price > 70000 Then 'High Value Buyer'
	else 'Non-High Value Buyer'
end as Buyer_Type
from Car_Data;

-- 403 Label customers as Premium Customer if they bought a car above the average price.
select Customer_name, Price,
case 
	when Price > (Select avg(Price) from car_data) then 'Premium Cutomer'
    else 'Normal Customer'
end as Customer_type
from car_data;
    
-- 404 Categorize customers as Budget Buyer / Mid Buyer / Luxury Buyer based on car price.
select Customer_name, Price,
case 
	when Price > 70000 then 'Luxury Buyer'
    when Price between 40000 and 70000 then 'Mid-buyer'
    else 'Budget-buyer'
end as Buyer_type
from car_data;

-- 405 Show whether a customer bought Luxury Brand or Normal Brand based on company.
select Company,
case
	when Company in ('BMW', 'Mercedes-B', 'Lexus', 'Jaguar', 'Volvo', 'Cadillac','Porsche','Audi')
    then 'Luxury Brand'
    else 'Non-luxury Brand'
end as brand_category
from car_data
group by Company;    

-- 406 Categorize cars into Economy / Standard / Luxury using price ranges.
select Model, Price,
case
	when Price < 30000 Then 'Economy'
	when Price between 30000 and 70000 then 'Standard'
	else 'Luxury'
end As Car_Category
from Car_Data;

-- 407 Above or Below Market Price
select Model, Price,
case
	when Price > (select avg(Price) from Car_Data)
	then 'Above Market Price'
	else 'Below Market Price'
end as Market_Label
from Car_Data;

-- 408 High Ticket Purchase if Price > 80000
select Model, Price,
case
	when Price > 80000 then 'High Ticket Purchase'
	else 'Normal Purchase'
end as Purchase_Type
from Car_Data;

-- 409 Expensive SUV vs Normal SUV
select Model, Body_Style, Price,
case
	when Body_Style='SUV' and Price > 70000
	then 'Expensive SUV'
	else 'Normal SUV'
end as SUV_Type
from Car_Data;

-- 410 Premium Segment if price in top 25%
-- help of chatgpt
SELECT Model, Price,
CASE
    WHEN NTILE(4) OVER (ORDER BY Price DESC) = 1
    THEN 'Premium Segment'
    ELSE 'Normal Segment'
END AS Segment
FROM Car_Data;

-- 411 Automatic vs Manual Segment
select Model, Transmission,
case
	when Transmission='Automatic' then 'Automatic Segment'
	else 'Manual Segment'
end as Transmission_Type
from Car_Data;

-- 412 Luxury Automatic Cars vs Regular Automatic Cars
Select Model, Transmission, Price,
case
	when Transmission='Automatic' and Price > 70000
	then 'Luxury Automatic'
	else 'Regular Automatic'
end as Auto_Category
from Car_Data;

-- 413 Modern vs Traditional transmission
select Model, Transmission,
case
	when Transmission='Automatic' then 'Modern'
	else 'Traditional'
end as Transmission_Class
from Car_Data;

-- 414 High Price Manual Cars
select Model, Transmission, Price,
case
	when Transmission='Manual' and Price > 60000
	then 'High Price Manual'
	else 'Normal Manual'
end as Manual_Category
from Car_Data;

-- 415 Transmission demand High vs Low
select Transmission,
case
	when Count(*) > 50 then 'High Demand'
	else 'Low Demand'
end as Demand
from Car_Data
group by Transmission;

-- 416 High Revenue Region vs Low Revenue Region
select Dealer_Region,
case
	when Sum(Price) > (select avg(Price) from Car_Data)
	then 'High Revenue Region'
	else 'Low Revenue Region'
end as Region_Type
from Car_Data
group by Dealer_Region;

-- 417 Luxury Market region
select Dealer_Region,
case
	when avg(Price) > 70000
	then 'Luxury Market'
	else 'Normal Market'
end as Market_Type
from Car_Data
group by Dealer_Region;

-- 418 High Income Region
select Dealer_Region,
case
	when avg(Annual_Income) > 90000
	then 'High Income Region'
	else 'Normal Income Region'
end as Region_Category
from Car_Data
group by Dealer_Region;

-- 419 Premium Sales Region
select Dealer_Region,
case
	when sum(case when Price>70000 then 1 else 0 end)/count(*) > 0.4
	then 'Premium Sales Region'
	else 'Regular Region'
end as Sales_Type
from Car_Data
group by Dealer_Region;

-- 420 Growing vs Stable Market
select Dealer_Region,
case
	when count(*) > 100 then 'Growing Market'
	else 'Stable Market'
end as Market_Status
from Car_Data
group by Dealer_Region;

-- 421 Luxury Brand vs Budget Brand based on average price
select Company,
case
	when avg(Price) > 70000 then 'Luxury Brand'
	else 'Budget Brand'
end as Brand_Category
from Car_Data
group by Company;

-- 422 High Volume Seller
select Company,
case
	when count(*) > (
    select avg(Cnt) from(
		select count(*) Cnt from Car_Data group by Company
        ) T)
	then 'High Volume Seller'
	else 'Low Volume Seller'
end as Seller_Type
from Car_Data
group by Company;

-- 423 Premium Manufacturer
select Company,
case
	when avg(Price) > 75000 then 'Premium Manufacturer'
	else 'Standard Manufacturer'
end as Manufacturer_Type
from Car_Data
group by Company;

-- 424 Top Brand / Mid Brand / Small Brand using revenue
select Company, Sum(Price) As Revenue,
case
	when sum(Price) > 5000000 then 'Top Brand'
	when sum(Price) between 2000000 and 5000000 then 'Mid Brand'
	else 'Small Brand'
end as Brand_Level
from Car_Data
group by Company;

-- 425 High Profit Brand
select Company,
case
	when avg(Price) > (select avg(Price) from Car_Data)
	then 'High Profit Brand'
	else 'Normal Brand'
end as Profit_Label
from Car_Data
group by Company;

-- 426 Emerging vs Mature Market
select Country,
case
	when Country in ('South Korea', 'Japan')
	then 'Emerging Market'
	Else 'Mature Market'
end as Market_Category
from Company_Info
group by Country;

-- 427 Global Brand if operating in developed country
select Company, Country,
case
	when Country in ('USA','Germany','Japan','UK')
	then 'Global Brand'
	else 'Regional Brand'
end as Brand_Type
from Company_Info;

-- 428 Luxury Market vs Mass Market per country
select Country,
case
	when avg(Price) > 70000
	then 'Luxury Market'
	else 'Mass Market'
end As Market_Type
from Car_Data Cd
join Company_Info Ci
on Cd.Company = Ci.Company
group By Country;

-- 429 Categorize countries by avg buyer income
select company_info.Country, avg(car_data.Annual_income),
case 
	when avg(Annual_income) > 850000 then 'Ultra-Rich'
    when avg (Annual_income) between 500000 and 850000 then 'rich'
    else 'Normal'
end as income_category
from car_data
join company_info
on car_data.Company = company_info.Company
group by company_info.Country; 
   
-- 430 Premium Market if luxury cars >30%
-- help of chatgpt
select Country,
case
	when sum(case when Price>70000 then 1 else 0 end)/Count(*) >0.3
	then 'Premium Market'
	else 'Normal Market'
end as Market_Level
from Car_Data Cd
join Company_Info Ci
on Cd.Company = Ci.Company
group by Country;

-- 431 Show High Revenue Sale if price > company average.
select Company,
case 
	when Price > avg(Price) over (partition by Company)
    then 'High-revenue'
    else 'Normal-revenue'
end as Revenue_cat
from car_data;
                    
-- 432 Classify sales into Major Deal / Standard Deal
select Model, Price,
case
    when Price > 70000
    then 'Major Deal'
    else 'Standard Deal'
end as Deal_Type
from Car_Data;

-- 433 Classify companies as International Brand or Local Brand based on number of countries.
select Company,
case
    when COUNT(DISTINCT Country) > 1
    then 'International Brand'
    else 'Local Brand'
end as Brand_Type
from Company_Info
group by Company;

-- 434 Label regions as Premium Demand Region if avg price > global avg.
select Dealer_Region,
case
    when avg(Price) > (select all(Price) from Car_Data)
    then 'Premium Demand Region'
    else 'Normal Region'
end as Region_Type
from Car_Data
group by Dealer_Region;

-- 435 Categorize countries by sales volume tiers
select Country, COUNT(*) AS Sales,
case
    when COUNT(*) > 100 then 'High Sales Country'
    when COUNT(*) between 50 and 100 then 'Medium Sales Country'
    else 'Low Sales Country'
end as Sales_Tier
from Car_Data cd
join Company_Info ci
on cd.Company = ci.Company
group by Country;