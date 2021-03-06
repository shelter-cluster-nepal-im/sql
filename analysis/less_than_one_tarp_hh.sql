--find pct of deliveries by vdc that are under 1 tarp per hh

select vdc_code, case when sum(under) = 0 then 1 else sum(more)/(sum(under)+sum(more)) end as ratio from
(
select vdc_code, count(case when tarp_per_hh <=1 then 1 end) as under, count(case when tarp_per_hh >1 then 1 end) as more
from
(
	select  vdc_code, quantity, total_hh, case when total_hh =0 then 0 else quantity/total_hh end as tarp_per_hh from distributions 
	where (act_status ilike 'completed%' or act_status ilike 'ongoing%')
	and act_desc ilike 'tarp%'
) a
group by 1
) b
group by 1
