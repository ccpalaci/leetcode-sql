select
case when count(1) != 0 then max(num) else null end as num from
(select num, count(1) co1 from mynumbers group by 1 having count(1) = 1) t1;
