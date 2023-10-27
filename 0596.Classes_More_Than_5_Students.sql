select class from(select class, count(class) from courses group by 1 having count(class) >= 5) t1;
