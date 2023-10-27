select user_id, count(distinct(follower_id)) followers_count from followers group by 1 order by 1;
