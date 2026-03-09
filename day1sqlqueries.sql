-- 1.create and 2.use the database
create database carsales;
use carsales;

-- 3.rename the table name that has been imported 
rename table `car sales.xlsx - car_data` to car_data;

select * from car_data;

-- 4.select the table with limit 10
select * from car_data limit 10;

-- 5,select data with limit 20 and skip 10
select * from car_data limit 20 offset 10;

-- 6.select unique body styles
select distinct Body_style
from car_data;

-- 7.select unique colors of cars
select distinct Color
from car_data;

-- 8.select all models 
Select Model from car_data;

-- 9.show all customers and thier income
select Customer_name, Annual_income
from car_data;

-- 10.show company and transmission
select distinct Company, Transmission
from car_data;

-- 11.select company, model, color
select Company, Model, Color
from car_data;

-- 12.select company, model, price
select Company, Model, Price
from car_data;

-- 13.show customer name and company
select Customer_name, Company
from car_data;

-- 14.display model and price
select Model, Price
from car_data;

-- `15.show company and annual_income
select Company, Annual_income
from car_data;

-- 16.show first 20 rows
select * from car_data limit 20;

-- 17. show company, model and price
select Company, Model, Price
from car_data;

-- 18. show Customer name ,company, model and price
select Compnay_name, Company, Model, Price
from car_data;

-- 19.rename column
alter table  car_data
change`Annual Income` Annual_income varchar(255);

-- 20,21,22.change column name for body style and customer name
alter table car_data change column `Body Style` Body_style varchar(50);
alter table car_data change column `Customer Name` Customer_name varchar(50);
alter table car_data change column `Price ($)` Price varchar(50);

-- 23.company is bmw 
select * from car_data 
where Company = 'BMW';

-- 24.where transmission is auto 
select * from car_data 
where Transmission = 'auto';

-- 25.where color is black 
select * from car_data 
where Color = 'black';

-- 26.where bodystyle is sedan
select * from car_data 
where Body_style = 'sedan';

-- 27.show cars where price is greater than 50k
select Customer_name, Company, Model, Price from car_data 
where Price > 50000;

-- 28.show cars where price is less than 30k
select Customer_name, Company, Model, Price from car_data 
where Price < 30000;

-- 29.Select person whose income is greater than 80000
select Customer_name, Annual_income from car_data
where Annual_income > 80000;

-- 30.show cars wher eprice is between 50k to 80k
select Customer_name, Company, Model, Price from car_data 
where Price between 30000 and 80000;

-- 31.select where company is bmw and auto with black color
select * from car_data 
where company = 'BMW' 
and Transmission = 'Auto' 
and Color = 'Black';

-- 32.select cars whose price is in between 50k to 90k
select * from car_data
where Price between 50000 and 90000;

-- 33.select customers from Austin with bmw and above 50k
select * from car_data
where Dealer_Region = 'Austin'
and Company = 'BMW' 
and Price > 50000;

-- 34.select car brands, model whose transmission is auto
select Customer_name, company, model, Transmission from car_data
where Transmission = 'Auto';

-- 35.customers whose female and drive a toyota
select * from car_data 
where Gender = 'Female' and Company = 'Toyota';

-- 36. show customers who have annual income more than 100k and drives a black bmw
select Customer_name, company, model, Transmission, Color, Annual_income from car_data
where Company = 'BMW' and 
Annual_income > 1000000 and 
Color = 'Black';

-- 37. show customers who have annual income less than 30k and drives a black nissan hatchback
select Customer_name, company, model, Transmission, Color, Annual_income, Body_style from car_data
where Company = 'Nissan' and 
Annual_income < 30000 and 
Color = 'Black' and
Body_style = 'Hatchback';

-- 38. show customer whose first letter of name starts with G and drives toyota hatchback
select Customer_name, company, model, Body_style from car_data
where Company = 'Toyota' and 
Body_style = 'Hatchback' and
Customer_name like 'G%';

-- 39. sort by price ascending
select Customer_name, company, model, Price from car_data
order by Price asc;

-- -- 40. sort by price descending
select Customer_name, company, model, Price from car_data
order by Price desc;

-- 41. sort by iincome ascending
select Customer_name, company, model, Price, Annual_income from car_data
order by Annual_income asc;

-- -- 42. sort by income descending
select Customer_name, company, model, Price, Annual_income from car_data
order by Annual_income desc;

-- 43. sort by company name 
select Customer_name, Company, model, Price from car_data
order by Company asc;

-- 44. sort by model name 
select Customer_name, Company, Model, Price from car_data
order by Model asc;

-- 45. sort by bodystyle name 
select Customer_name, Company, model, Price, Body_style from car_data
order by Body_style asc;

-- 46. sort by Color name 
select Customer_name, Company, model, Price, Color from car_data
order by Color asc;

-- 47. sort by Transmission name 
select Customer_name, Company, model, Price, Transmission from car_data
order by Transmission asc;

-- 48. sort by company name then price
select Customer_name, Company, model, Price from car_data
order by Company asc, Price asc;

-- 49. sort by income then company
select Customer_name, Company, model, Price, Annual_income from car_data
order by Annual_income asc, Company asc;

-- 50. sohow cheap cars first
select Customer_name, Company, model, Price from car_data
order by Price asc;

-- 51. show expensive cars first
select Customer_name, Company, model, Price from car_data
order by Price desc;

-- 52. sort by Customer name
select Customer_name, Company, model, Price from car_data
order by Customer_name desc;

-- 53. top 20 most expensive cars
select Customer_name, Company, model, Price from car_data
order by Price desc limit 20;

-- 54. top 10 least expensive cars
select Customer_name, Company, model, Price from car_data 
order by Price asc limit 10;


-- 55. order data by annula income
select * from car_data 
order by Annual_income desc;

-- 56. top 10 richest customers
select * from car_data 
order by Annual_income desc limit 10;

-- 57. top 10 Poorest customers
select * from car_data 
order by Annual_income asc limit 10;

-- 58. count no. of male customers
select Gender, count(Gender) as total_male_customers
from car_data
where Gender = 'Male';

-- 59. count no. of female customers
select count(Gender) as total_male_customers
from car_data
where Gender = 'Female';

-- 60. count no. of cars sold with auto transmission
select count(Transmission) as total_automatic_customers
from car_data
where Transmission = 'auto';

-- 61. count no. of cars sold with manual transmission
select count(Transmission) as total_manual_customers
from car_data
where Transmission = 'manual';

-- 62. count no. of cars sold with red color
select count(Color) as total_redcars_customers
from car_data
where Color = 'red';

-- 63. count no. of cars sold price is above 70k
select count(Price) as total_cars_above70k
from car_data
where Price > 70000;

-- 64. count no. of cars sold price is less than 30k
select count(Price) as total_cars_less30k
from car_data
where Price < 30000;

-- 63. count no. of cars sold customer income is above 100k
select count(income) as customer_income_above100k
from car_data
where Annual_income > 100000;

-- 64 .count no. of cars sold customer income is between 50k to 100k
select count(income) as customer_income_btw50kto100k
from car_data
where Price between 50000 and 100000;

-- 65. count no. of toyota cars with auto transmission
select count(Company) as total_toyota_auto
from car_data
where Company = 'Toyota' and
Transmission = 'auto';

-- 66.count total number of customers who drives toyota
select  Company, count(Company)as total_toyotacustomers
from car_data
where Company = 'Toyota'
group by Company;

-- 67.count total number of cars of each company 
select Company , count(Company) over(
	partition by Company 
)as Total_no_of_carsold from car_data;

-- 69. count no. of cars sold per company
select Company, count(*)as total_cars_sold 
from car_data
group by Company
order by Company asc;

-- 70. count no. of cars sold per region
select Dealer_Region, count(*)as total_cars_sold_perregion 
from car_data
group by Dealer_Region
order by Dealer_Region asc;

-- 71. count no. of cars sold per body dtyle
select Body_style, count(*)as total_cars_sold_bodystyle 
from car_data
group by Body_style
order by Body_style asc;

-- 72. count no. of cars sold per transmission type
select Transmission, count(*)as total_cars_sold_transmission 
from car_data
group by Transmission
order by Transmission asc;

-- 73. count no. of cars sold per gender in each region
select Gender,Dealer_Region, count(Gender)as total_cars_sold_gender_region 
from car_data
group by Gender, Dealer_Region;

-- 74. Count number of BMW cars priced above 60000
select Company, count(Company) as bmw_customers_above60k
from car_data
where Company = 'BMW' and 
Price > 60000;

-- 75. Count number of SUV cars sold to female customers
select count(Body_style) as female_SUV
from car_data
where Body_style = 'SUV' and 
Gender = 'Female';

-- 76. Count number of black colored Toyota cars
select count(Company) as black_toyotas
from car_data
where Company = 'Toyota' and 
Color = 'Black';

-- 77. Count number of manual cars sold in Austin region.
select count(Transmission) as Manuals_in_austin
from car_data
where Transmission = 'manual' and 
Dealer_Region = 'Austin';

-- 78. Count number of customers buying sedan cars with price above 40000.
select count(Company) as sedans_above40k
from car_data
where Body_style = 'sedan' and 
Price > 40000;

-- 79. Find companies that sold more than 200 cars.
select company, count(*) as Companies_sold_above50_cars
from car_data
group by company
having count(*) > 200;

-- 80. Count distinct car companies in the dataset
select count(distinct company) as total_companies
from car_data;

-- 81. Count distinct car models in the dataset
select count(distinct model) as total_models
from car_data;

-- 82. Count distinct dealer regions
select count(distinct dealer_region) as total_regions
from car_data;

-- 83. Count distinct body styles.
select count(distinct body_style) as total_body_styles
from car_data;

-- 84. Count distinct colors of cars sold
select count(distinct color) as total_colors
from car_data;

-- 85.Show distinct company and transmission pairs
select distinct company, transmission
from car_data;

-- 86. Show distinct company and color combinations
select distinct company, color
from car_data;

-- 87.Show distinct company and body style
select distinct company, body_style
from car_data;

-- 88.Show distinct color and body style
select distinct color, body_style
from car_data;

-- 89. Show distinct transmission and body style
select distinct transmission, body_style
from car_data;


