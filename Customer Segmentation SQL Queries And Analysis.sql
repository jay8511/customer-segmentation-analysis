use project_shopping_trends;
show tables;
select * from shopping;
SELECT * 
FROM shopping
LIMIT 10;
describe shoping_table;

-- Category-wise Analysis

select Purchase_Amount_USD from shopping limit 10;
select Category, count(*) as Total_Orders,Round(sum(Purchase_Amount_USD), 2) as Total_Revenue from shopping group by category order by Total_Revenue desc;

-- Discount Usage by Category

select Discount_Applied, count(*) from shopping group by Discount_Applied;
select category, count(*) as Total_Orders, sum(case when Discount_Applied =  'Yes' then 1 else 0 end)
as Discounted_Orders from shopping group by category order by Discounted_Orders desc; 

-- Age-wise Spending Analysis
select case 
when  age < 25 then 'Under 25'
when  age between 25 and 40 then '25-40'
when  age between 41 and 60 then '41-60'
else '60+'
end as Age_Group ,
count(*) as Total_Customers, round(AVG(Purchase_Amount_USD), 2) as AVG_Spend from shopping  group by Age_Group order by AVG_Spend desc;

-- Season-wise Revenue & Orders

select Season, count(*) as Total_Orders, round(avg(Purchase_Amount_USD), 2) as Avg_Spend  from shopping  group by  Season  order by Avg_Spend desc;

-- Location-wise Revenue

select Location, count(*) as Total_Orders, round(avg(Purchase_Amount_USD), 2) as Total_Revenue from shopping  group by  Location  order by Total_Revenue desc;
