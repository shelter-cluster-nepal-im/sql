--count number of agencies in VDCs

select COALESCE(a.hlcit_code, b.vdc_code), case when count IS NULL then 0 else count end from
(
	select hlcit_code from codes where priority is TRUE
) a
FULL OUTER JOIN	
(
	select vdc_code, count(distinct(imp_agency)) from distributions
	where act_status ilike '%planned%' or act_status ilike '%ongoing%'
	group by 1
) b
on a.hlcit_code = b.vdc_code