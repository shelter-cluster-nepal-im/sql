-- find age of tarp deliveries

-- < 93 days
select * from 
(
select vdc_code, sum(case when CURRENT_DATE - comp_dt::date < 94 then quantity end)/sum(quantity) as pct
from distributions 
where (act_status ilike 'completed%' or act_status ilike 'ongoing%')
and act_desc ilike 'tarp%'
and comp_dt not like 'None'
and CURRENT_DATE - comp_dt::date >=0
group by 1
) a
where pct is not null

-- 94-123 days
select * from 
(
select vdc_code, sum(case when CURRENT_DATE - comp_dt::date between 94 and 123 then quantity end)/sum(case when quantity = 0 then NULL else quantity end) as pct
from distributions 
where (act_status ilike 'completed%' or act_status ilike 'ongoing%')
and act_desc ilike 'tarp%'
and comp_dt not like 'None'
and CURRENT_DATE - comp_dt::date >=0
group by 1
) a
where pct is not null

-- 124-148 days
select * from 
(
select vdc_code, sum(case when CURRENT_DATE - comp_dt::date between 124 and 148 then quantity end)/sum(case when quantity = 0 then NULL else quantity end) as pct
from distributions 
where (act_status ilike 'completed%' or act_status ilike 'ongoing%')
and act_desc ilike 'tarp%'
and comp_dt not like 'None'
and CURRENT_DATE - comp_dt::date >=0
group by 1
) a
where pct is not null
