select distinct ConsecutiveNums from (select
    case when next = cur and cur = prev then cur end as ConsecutiveNums from
(select
    lag(num) over(order by id asc) as next,
    num as cur,
    lead(num) over(order by id asc) as prev
from
    logs) as t1) t2
where ConsecutiveNums is not null;
