-- ===============================
-- WHERE SECTION FOR COMPANY_INFO
-- ===============================

-- 436 Show all companies from USA
select Company, Country
from Company_Info
where Country = 'USA';

-- 437 Show all companies from Germany
select Company, Country
from Company_Info
where Country = 'Germany';

-- 438 Show all companies from Japan
select Company, Country
from Company_Info
where Country = 'Japan';

-- 439 Show companies not from USA
select Company, Country
from Company_Info
where Country <> 'USA';

-- 440 Show companies not from Germany
select Company, Country
from Company_Info
where Country <> 'Germany';

-- 441 Show companies where country is USA or Japan
select Company, Country
from Company_Info
where Country = 'USA' or Country = 'Japan';

-- 442 Show companies where country is Germany or Italy
select Company, Country
from Company_Info
where Country = 'Germany' or Country = 'Italy';

-- 443 Show companies excluding USA and Japan
select Company, Country
from Company_Info
where Country not in ('USA','Japan');

-- 444 Show companies where company name starts with 'T'
select Company, Country
from Company_Info
where Company like 'T%';

-- 445 Show companies where company name starts with 'B'
select Company, Country
from Company_Info
where Company like 'B%';

-- 446 Show companies where company name starts with 'M'
select Company, Country
from Company_Info
where Company like 'M%';

-- 447 Show companies where company name ends with 'a'
select Company, Country
from Company_Info
where Company like '%a';

-- 448 Show companies where company name ends with 'n'
select Company, Country
from Company_Info
where Company like '%n';

-- 449 Show companies where company name contains 'o'
select Company, Country
from Company_Info
where Company like '%o%';

-- 450 Show companies where company name contains 'a'
select Company, Country
from Company_Info
where Company like '%a%';

-- 451 Show companies where company name length > 6 characters
select Company, Country
from Company_Info
where length(Company) > 6;

-- 452 Show companies where company name length < 5 characters
select Company, Country
from Company_Info
where length(Company) < 5;

-- 453 Show companies where country starts with 'U'
select Company, Country
from Company_Info
where Country like 'U%';

-- 454 Show companies where country starts with 'G'
select Company, Country
from Company_Info
where Country like 'G%';

-- 455 Show companies where country contains 'a'
select Company, Country
from Company_Info
where Country like '%a%';

-- 456 Show companies where company name does not contain 'o'
select Company, Country
from Company_Info
where Company not like '%o%';

-- 457 Show companies where company name does not start with 'T'
select Company, Country
from Company_Info
where Company not like 'T%';

-- 458 Show companies where country is not Japan
select Company, Country
from Company_Info
where Country <> 'Japan';

-- 459 Show companies where country is not Italy
select Company, Country
from Company_Info
where Country <> 'Italy';

-- 460 Show companies where country is either France or Germany
select Company, Country
from Company_Info
where Country in ('France','Germany');

-- 461 Show companies where country is either UK or USA
select Company, Country
from Company_Info
where Country in ('UK','USA');

-- 462 Show companies where country name length > 5
select Company, Country
from Company_Info
where length(Country) > 5;

-- 463 Show companies where company name length > 7
select Company, Country
from Company_Info
where length(Company) > 7;

-- 464 Show companies where company name contains 'r'
select Company, Country
from Company_Info
where Company like '%r%';

-- 465 Show companies where company name contains 's'
select Company, Country
from Company_Info
where Company like '%s%';

-- 466 Show companies where company name starts with a vowel
select Company, Country
from Company_Info
where Company like 'A%' or Company like 'E%' or Company like 'I%' or Company like 'O%' or Company like 'U%';

-- 467 Show companies where country ends with 'a'
select Company, Country
from Company_Info
where Country like '%a';

-- 468 Show companies where country contains 'e'
select Company, Country
from Company_Info
where Country like '%e%';

-- 469 Show companies where company name contains 't'
select Company, Country
from Company_Info
where Company like '%t%';

-- 470 Show companies where company name contains 'l'
select Company, Country
from Company_Info
where Company like '%l%';

-- 471 Show companies where company name contains 'd'
select Company, Country
from Company_Info
where Company like '%d%';

-- 472 Show companies where country contains 'i'
select Company, Country
from Company_Info
where Country like '%i%';

-- 473 Show companies where company name starts with 'H'
select Company, Country
from Company_Info
where Company like 'H%';

-- 474 Show companies where company name starts with 'F'
select Company, Country
from Company_Info
where Company like 'F%';

-- 475 Show companies where company name ends with 'o'
select Company, Country
from Company_Info
where Company like '%o';

-- 476 Show companies where company name contains 'y'
select Company, Country
from Company_Info
where Company like '%y%';

-- 477 Show companies where company name contains 'u'
select Company, Country
from Company_Info
where Company like '%u%';

-- 478 Show companies where country starts with 'C'
select Company, Country
from Company_Info
where Country like 'C%';

-- 479 Show companies where country starts with 'I'
select Company, Country
from Company_Info
where Country like 'I%';

-- 480 Show companies where country contains 'r'
select Company, Country
from Company_Info
where Country like '%r%';

-- 481 Show companies where company name starts with 'A'
select Company, Country
from Company_Info
where Company like 'A%';

-- 482 Show companies where company name starts with 'S'
select Company, Country
from Company_Info
where Company like 'S%';

-- 483 Show companies where company name starts with 'P'
select Company, Country
from Company_Info
where Company like 'P%';

-- 484 Show companies where company name starts with 'L'
select Company, Country
from Company_Info
where Company like 'L%';

-- 485 Show companies where company name starts with 'N'
select Company, Country
from Company_Info
where Company like 'N%';

-- ===============================
-- COUNT SECTION FOR COMPANY_INFO
-- ===============================
-- 486 Count total companies
select count(*) as Total_Companies
from Company_Info;

-- 487 Count companies from USA
select count(*) as USA_Companies
from Company_Info
where Country = 'USA';

-- 488 Count companies from Germany
select count(*) as Germany_Companies
from Company_Info
where Country = 'Germany';

-- 489 Count companies from Japan
select count(*) as Japan_Companies
from Company_Info
where Country = 'Japan';

-- 490 Count companies not from USA
select count(*) as Non_USA_Companies
from Company_Info
where Country <> 'USA';

-- 491 Count companies not from Germany
select count(*) as Non_Germany_Companies
from Company_Info
where Country <> 'Germany';

-- 492 Count companies where country is USA or Japan
select count(*) as USA_Japan_Companies
from Company_Info
where Country in ('USA','Japan');

-- 493 Count companies where country is Germany or France
select count(*) as Germany_France_Companies
from Company_Info
where Country in ('Germany','France');

-- 494 Count companies where company name starts with 'T'
select count(*) as T_Companies
from Company_Info
where Company like 'T%';

-- 495 Count companies where company name starts with 'B'
select count(*) as B_Companies
from Company_Info
where Company like 'B%';

-- 496 Count companies where company name starts with 'M'
select count(*) as M_Companies
from Company_Info
where Company like 'M%';

-- 497 Count companies where company name ends with 'a'
select count(*) as A_End_Companies
from Company_Info
where Company like '%a';

-- 498 Count companies where company name ends with 'n'
select count(*) as N_End_Companies
from Company_Info
where Company like '%n';

-- 499 Count companies where company name contains 'o'
select count(*) as O_Companies
from Company_Info
where Company like '%o%';

-- 500 Count companies where company name contains 'a'
select count(*) as A_Companies
from Company_Info
where Company like '%a%';
