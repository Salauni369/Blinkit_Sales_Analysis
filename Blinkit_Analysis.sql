
-- for retrieve all the data
select * from blinkit_data

-- for knowing counting of rows
select count(*) from blinkit_data

-- for cleaning
update blinkit_data
set Item_Fat_Content =
case 
when Item_Fat_Content in ('LF','low fat') then 'Low Fat'
when Item_Fat_Content = 'reg' then 'Regular'
else Item_Fat_Content
end 

-- for seeing actual changes
select distinct (item_Fat_Content)from blinkit_data

-- for total sales
select sum(Sales) as Total_sales from blinkit_data

-- total sales in millions
select cast(sum(Sales)/1000000 as decimal(10,2)) as Total_sales from blinkit_data

-- average sales 
select cast(avg(Sales) as decimal(10,2)) as Average_sales from blinkit_data

-- number of the orders
select count(*)as no_of_item from blinkit_data

-- total sales for low fat
select cast(sum(Sales)/1000000 as decimal(10,2)) as Total_sales from blinkit_data
where Item_Fat_Content='Low Fat'

-- average rating
select cast(avg(Rating)as decimal(10,2))as avg_rating from blinkit_data

-- total sales by fat content
select Item_Fat_Content, 
       sum(Sales)as total_sales ,
       avg(Sales)as avg_Sales,
       avg(Rating)as avg_rating,
       count(*)as no_of_item
from blinkit_data
group by Item_Fat_Content 
order by Item_Fat_Content desc 

-- total sales by item type
select Item_type , cast(sum(Sales) as decimal(10,3)) as Total_sales,
       avg(Sales)as avg_Sales,
       avg(Rating)as avg_rating,
       count(*)as no_of_item
from blinkit_data
group by Item_type
order by item_type desc 

-- total sales by outlet and fat content
select Outlet_Location_Type, Item_Fat_Content, 
       sum(Sales)as total_sales ,
       avg(Sales)as avg_Sales,
       avg(Rating)as avg_rating,
       count(*)as no_of_item
from blinkit_data
group by  Outlet_Location_Type,Item_Fat_Content 
order by total_sales desc 

-- pivot for fat content by outlet
select Outlet_Location_Type,
       isnull([Low Fat],0)as Low_Fat,
       isnull([Regular],0)as Regular
from (
    select Outlet_Location_Type,Item_Fat_Content, sum(Sales)as total_sales 
    from  blinkit_data 
    group by Outlet_Location_Type,Item_Fat_Content
) as sourcetable
Pivot(
    sum(total_sales)
    for Item_Fat_Content in ([Low Fat],[Regular])
) as PivotTable
order by Outlet_Location_Type desc ;

-- total sales by outlet year
select Outlet_Establishment_Year, 
       sum(Sales)as total_sales ,
       avg(Sales)as avg_Sales,
       avg(Rating)as avg_rating,
       count(*)as no_of_item
from blinkit_data
group by   Outlet_Establishment_Year
order by  total_sales desc ;

-- percentage of sales by outlet size
select Outlet_Size,
       cast(sum(Sales) as decimal (10,2)) as total_sales ,
       cast((sum(Sales)*100.0/sum(sum(Sales)) over()) as decimal(10,2)) as sales_percentage
from blinkit_data
group by Outlet_size
order by total_sales desc ;

-- all metrics by outlet type
select outlet_type ,
       cast(sum(Sales) as decimal(10,3)) as Total_sales,
       avg(Sales)as avg_Sales,
       avg(Rating)as avg_rating,
       count(*)as no_of_item
from blinkit_data
group by outlet_type
order by outlet_type desc ;

-- sales by outlet location
select outlet_Location_type ,
       cast(sum(Sales) as decimal(10,3)) as Total_sales,
       avg(Sales)as avg_Sales,
       avg(Rating)as avg_rating,
       count(*)as no_of_item
from blinkit_data
group by outlet_Location_type
order by outlet_Location_type desc ;
