-- Test case 22/23 break the rules in the description.
select employee_id, department_id from
(select employee_id, department_id,
row_number() over (partition by employee_id order by primary_flag asc) rn
from employee) t1
where rn = 1;
