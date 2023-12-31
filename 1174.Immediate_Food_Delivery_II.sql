select
round(avg(case when order_date = customer_pref_delivery_date then 1 else 0 end)*100,2) as immediate_percentage
from(
select
*,
row_number() over(partition by customer_id order by order_date asc) as rn
from delivery) t1
where rn = 1;
