select t1.reports_to as employee_id, e.name, t1.count as reports_count, t1.avg_age as average_age
from employees e
join (
  select reports_to, round(avg(age), 0) as avg_age, count(reports_to) as count
  from employees
  where reports_to > 0
  group by 1
) t1 on t1.reports_to = e.employee_id
order by 1;
