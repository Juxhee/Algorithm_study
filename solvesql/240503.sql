select event_date_kst as dt, count(distinct user_pseudo_id) as users
from ga
where date(event_date_kst) between '2021-08-02' and '2021-08-09'
group by date(event_date_kst)
order by dt
