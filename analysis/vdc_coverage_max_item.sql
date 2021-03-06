--find most most distributed item by VDC

select * from
(
	select *, ROW_NUMBER() OVER (PARTITION BY vdc_code ORDER BY cnt DESC) AS r
	from
	(
		select district, dist_code, vdc, vdc_code, act_desc, sum(total_hh) as cnt from distributions
		where vdc_code in (select hlcit_code from codes where priority is TRUE) 
		group by 1,2,3,4,5
	) a
) b
where r = 1