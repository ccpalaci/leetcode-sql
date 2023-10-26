select t2.product_id, coalesce(round(income/units1,2),0) as average_price from
(select product_id,
sum(case when purchase_date between start_date and end_date then price*units else 0 end) as income,
sum(case when purchase_date between start_date and end_date then units else 0 end) units1
from
(select * from prices p
left join unitssold u
using(product_id)) t1
group by 1) t2
