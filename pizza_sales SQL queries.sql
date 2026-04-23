
select * from Pizza_Sales

-----daily trends of the week 
select DATENAME(DW, order_date) as order_Day, count(distinct order_id) as Total_orders
from Pizza_Sales
group by DATENAME(DW, order_date)

------monthly trends
select DATENAME(MONTH,order_date) as Month_Name, count(distinct order_id) as total_orders from Pizza_Sales 
group by DATENAME(MONTH,order_date) 
order by total_orders desc

------% of sales by pizza category
select pizza_category, sum(total_price) as Total_sales, sum(total_price) * 100 / (select sum(total_price) from Pizza_Sales) as [PCT of Total sales by pizza category]
from Pizza_Sales
group by pizza_category

---% of sales by pizza cateogory according to each month-
select pizza_category, sum(total_price) as Total_sales, sum(total_price) * 100 / (select sum(total_price) from Pizza_Sales where month(order_date) = 1) as [PCT of Total sales by pizza category]
from Pizza_Sales
where month(order_date) = 1
group by pizza_category

-----% Sales by Pizza Size
select pizza_size, CAST(sum(total_price) AS DECIMAL(10,2)) as Total_sales, CAST(sum(total_price) * 100 / (select sum(total_price) from Pizza_Sales ) AS DECIMAL(10,2))
as [PCT of Total sales by pizza size]
from Pizza_Sales
group by pizza_size
order by [PCT of Total sales by pizza size] desc

---Top 5 Best-Selling Pizzas (by revenue)
select top 5 pizza_name , sum(total_price) as total_revenue from Pizza_Sales
group by pizza_name 
order by total_revenue desc

------bottom 5 least-Selling Pizzas (by revenue)
select top 5 pizza_name , sum(total_price) as total_revenue from Pizza_Sales
group by pizza_name 
order by total_revenue asc

---Top 5 Best-Selling Pizzas (by quantity)
select top 5 pizza_name , sum(quantity) as total_quantity from Pizza_Sales
group by pizza_name 
order by total_quantity desc

------bottom 5 least-Selling Pizzas (by quantity)
select top 5 pizza_name , sum(quantity) as total_quantity from Pizza_Sales
group by pizza_name 
order by total_quantity asc

---Top 5 Best-Selling Pizzas (by orders)
select top 5 pizza_name , count(distinct order_id) as total_orders from Pizza_Sales
group by pizza_name 
order by total_orders desc

------bottom 5 least-Selling Pizzas (by orders)
select top 5 pizza_name , count(distinct order_id) as total_orders from Pizza_Sales
group by pizza_name 
order by total_orders asc
