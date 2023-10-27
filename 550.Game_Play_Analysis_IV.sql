select
round(avg(case when next_day = date_add(event_date, interval 1 day) then 1 else 0 end),2) fraction
from
(select
player_id,
event_date,
lead(event_date) over(partition by player_id order by event_date) next_day,
row_number() over(partition by player_id order by event_date) rn
from activity) t1
where rn = 1;
