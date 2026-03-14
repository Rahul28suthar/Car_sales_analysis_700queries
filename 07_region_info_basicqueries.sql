-- 501,502,503 update the values of column market type
select * from region_info;

update region_info
set Market_Type = 'Rural'
where Dealer_Region in ('Aurora', 'Janesville');

update region_info
set Market_Type = 'Suburban'
where Dealer_Region = 'Austin';

update region_info
set Market_Type = 'Metro'
where Dealer_Region = 'Pasco';

-- 504,505,506,507 update values of the column country
update region_info
set Country = 'USA'
where Dealer_Region IN ('Middletown','Austin');

update region_info
set Country = 'Germany'
where Dealer_Region IN ('Pasco', 'Janesville');

update region_info
set Country = 'Japan'
where Dealer_Region IN ('Scottsade');

update region_info
set Country = 'Other'
where Dealer_Region = 'Greenville';


-- 508 Show all dealer regions where Market_Type = 'Urban'
select Dealer_Region, Country, Market_Type
from Region_Info
where Market_Type = 'Urban';

-- 509 Show all dealer regions where Market_Type = 'Rural'
select Dealer_Region, Country, Market_Type
from Region_Info
where Market_Type = 'Rural';

-- 510 Show regions where Market_Type = 'Suburban'
select Dealer_Region, Country, Market_Type
from Region_Info
where Market_Type = 'Suburban';

-- 511 Show regions where Market_Type = 'Metro'
select Dealer_Region, Country, Market_Type
from Region_Info
where Market_Type = 'Metro';

-- 512 Show regions where Market_Type is not 'Urban'
select Dealer_Region, Country, Market_Type
from Region_Info
where Market_Type <> 'Urban';

-- 513 Show regions where Country = 'USA'
select Dealer_Region, Country, Market_Type
from Region_Info
where Country = 'USA';

-- 514 Show regions where Country = 'Germany'
select Dealer_Region, Country, Market_Type
from Region_Info
where Country = 'Germany';

-- 515 Show regions where Country = 'Japan'
select Dealer_Region, Country, Market_Type
from Region_Info
where Country = 'Japan';

-- 516 Show regions where Country is not 'USA'
select Dealer_Region, Country, Market_Type
from Region_Info
where Country not like 'USA';

-- 517 Show regions where Country is not 'Germany'
select Dealer_Region, Country, Market_Type
from Region_Info
where Country not like 'Germany';

-- 518 Show regions where Country is USA or UK
-- UK is not in the table
select Dealer_Region, Country, Market_Type
from Region_Info
where Country = 'USA' or Country = 'UK';

-- 519 Show regions where Country is Germany or France
select Dealer_Region, Country, Market_Type
from Region_Info
where Country = 'Germany' or Country = 'France';

-- 520 Show regions where Market_Type is Urban or Metro
select Dealer_Region, Country, Market_Type
from Region_Info
where Market_Type = 'Urban' or Market_Type = 'Metro';

-- 521 Show regions where Market_Type is Rural or Suburban
select Dealer_Region, Country, Market_Type
from Region_Info
where Market_Type = 'Rural' or Market_Type = 'Suburban';

-- 522 Show regions where Country is USA and Market_Type is Urban
select Dealer_Region, Country, Market_Type
from Region_Info
where Country = 'USA' and Market_Type = 'Urban';

-- 523 Show regions where Country is USA and Market_Type is Rural
select Dealer_Region, Country, Market_Type
from Region_Info
where Country = 'USA' and Market_Type = 'Rural';

-- 524 Show regions where Country is Germany and Market_Type is Urban
select Dealer_Region, Country, Market_Type
from Region_Info
where Country = 'Germany' and Market_Type = 'Urban';

-- 525 Show regions where Country is Japan and Market_Type is Metro
select Dealer_Region, Country, Market_Type
from Region_Info
where Country = 'Japan' and Market_Type = 'Metro';

-- 526 Show regions where Dealer_Region starts with 'N'
select Dealer_Region, Country, Market_Type
from Region_Info
where Dealer_Region like 'N%';

-- 527 Show regions where Dealer_Region starts with 'S'
select Dealer_Region, Country, Market_Type
from Region_Info
where Dealer_Region like 'S%';

-- 528 Show regions where Dealer_Region contains 'o'
select Dealer_Region, Country, Market_Type
from Region_Info
where Dealer_Region like '%o%';

-- 529 Show regions where Dealer_Region ends with 't'
select Dealer_Region, Country, Market_Type
from Region_Info
where Dealer_Region like '%t';

-- 530 Show regions where Dealer_Region length > 6
select Dealer_Region, Country, Market_Type
from Region_Info
where length(Dealer_Region) > 6;

-- 531 Show regions where Country starts with 'U'
select Dealer_Region, Country, Market_Type
from Region_Info
where Country like 'U%';

-- 532 Show regions where Country contains 'a'
select Dealer_Region, Country, Market_Type
from Region_Info
where Country like '%a%';

-- 533 Count total dealer regions
select count(*) as Total_Regions
from Region_Info;

-- 534 Count regions where Market_Type = 'Urban'
select count(*) as Urban_Regions
from Region_Info
where Market_Type = 'Urban';

-- 535 Count regions where Market_Type = 'Rural'
select count(*) as Rural_Regions
from Region_Info
where Market_Type = 'Rural';

-- 536 Count regions where Market_Type = 'Suburban'
select count(*) as Suburban_Regions
from Region_Info
where Market_Type = 'Suburban';

-- 537 Count regions where Market_Type = 'Metro'
select count(*) as Metro_Regions
from Region_Info
where Market_Type = 'Metro';

-- 538 Count regions where Market_Type is not Urban
select count(*) as Non_Urban_Regions
from Region_Info
where Market_Type <> 'Urban';

-- 539 Count regions where Country = 'USA'
select count(*) as USA_Regions
from Region_Info
where Country = 'USA';

-- 540 Count regions where Country = 'Germany'
select count(*) as Germany_Regions
from Region_Info
where Country = 'Germany';

-- 541 Count regions where Country = 'Japan'
select count(*) as Japan_Regions
from Region_Info
where Country = 'Japan';

-- 542 Count regions where Country is not USA
select count(*) as Non_USA_Regions
from Region_Info
where Country <> 'USA';

-- 543 Count regions where Country is not Germany
select count(*) as Non_Germany_Regions
from Region_Info
where Country <> 'Germany';

-- 544 Count regions where Country is USA or UK
select count(*) as USA_UK_Regions
from Region_Info
where Country = 'USA' or Country = 'UK';

-- 545 Count regions where Country is Germany or France
select count(*) as Germany_France_Regions
from Region_Info
where Country = 'Germany' or Country = 'France';

-- 546 Count regions where Market_Type is Urban or Metro
select count(*) as Urban_Metro_Regions
from Region_Info
where Market_Type = 'Urban' or Market_Type = 'Metro';

-- 547 Count regions where Market_Type is Rural or Suburban
select count(*) as Rural_Suburban_Regions
from Region_Info
where Market_Type = 'Rural' or Market_Type = 'Suburban';

-- 548 Count regions where Country is USA and Market_Type is Urban
select count(*) as USA_Urban_Regions
from Region_Info
where Country = 'USA' and Market_Type = 'Urban';

-- 549 Count regions where Country is USA and Market_Type is Rural
select count(*) as USA_Rural_Regions
from Region_Info
where Country = 'USA' and Market_Type = 'Rural';

-- 550 Count regions where Country is Germany and Market_Type is Urban
select count(*) as Germany_Urban_Regions
from Region_Info
where Country = 'Germany' and Market_Type = 'Urban';

-- 551 Count regions where Country is Japan and Market_Type is Metro
select count(*) as Japan_Metro_Regions
from Region_Info
where Country = 'Japan' and Market_Type = 'Metro';

-- 552 Count regions where Dealer_Region starts with 'N'
select count(*) as N_Regions
from Region_Info
where Dealer_Region like 'N%';

-- 553 Count regions where Dealer_Region starts with 'S'
select count(*) as S_Regions
from Region_Info
where Dealer_Region like 'S%';

-- 554 Count regions where Dealer_Region contains 'o'
select count(*) as O_Regions
from Region_Info
where Dealer_Region like '%o%';

-- 555 Count regions where Dealer_Region ends with 't'
select count(*) as T_End_Regions
from Region_Info
where Dealer_Region like '%t';

-- 556 Count regions where Country starts with 'U'
select count(*) as U_Country_Regions
from Region_Info
where Country like 'U%';

-- 557 Count regions where Country contains 'a'
select count(*) as A_Country_Regions
from Region_Info
where Country like '%a%';

