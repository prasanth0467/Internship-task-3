#  CALCULATING TOTAL REVENUE  #
SELECT * FROM sales.transactions;
select sum(sales_amount) as total_revenue
from transactions;


#  CALCULATING AVERAGE REVENUE PER CUSTOMER  #
SELECT * FROM sales.transactions;
select avg(total_revenue) as average_revenue_per_customer from(
select customer_code,sum(sales_amount) as total_revenue from transactions
group by customer_code)
as customer_revenue;


#  TOP 5 CUSTOMERS BY REVENUE  #
SELECT * FROM sales.transactions;
select c.custmer_name,sum(t.sales_amount) as total_sales from transactions t 
join customers c on t.customer_code=c.customer_code
group by c.custmer_name
order by total_sales desc
limit 5;


#  CREATING VIEWS  #
SELECT * FROM sales.transactions;
create view customer_revenue_view as 
select customer_code,sum(sales_amount) as total_revenue from transactions
group by customer_code;


#  LEFT JOIN  #
#  SHOWS CUSTOMERS AND THEIR PURCHASED AMOUNTS  #
SELECT * FROM sales.customers;
select c.customer_code,c.custmer_name,t.product_code,t.sales_amount 
from customers c left join transactions t on c.customer_code=t.customer_code;


#  RIGHT JOIN  #
#  SHOWS SALES AMOUNT DETAILS AND CUSTOMERS  #
SELECT * FROM sales.customers;
select c.customer_code,c.custmer_name,t.product_code,t.sales_amount 
from customers c right join transactions t on c.customer_code=t.customer_code;


#  INDEXES  #
SELECT * FROM sales.transactions;
# WITHOUT INDEX USAGE #
select * from transactions where customer_code='Cus002';
#  USING INDEX  #
create index index_customer_code on transactions(customer_code);
select * from transactions where customer_code='Cus002';