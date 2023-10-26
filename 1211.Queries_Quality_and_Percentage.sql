select query_name
, round(sum(rating/position)/count(1),2) as quality
, round(sum(case when rating < 3 then 1 else 0 end)/count(1)*100,2) as poor_query_percentage
from queries
group by 1
