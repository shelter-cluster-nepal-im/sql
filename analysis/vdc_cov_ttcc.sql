--pull tarps/tents and cash/cgi coverage by VDC

drop table if exists maps.dist_prof_cov_10_30;
create table maps.dist_prof_cov_10_30 as 
select * from
(
	select * from codes where priority is True 
) gc
FULL OUTER JOIN
(
	select vdc_code_tt, sum_tt, sum_cc, case when tot_dmg_cnt = 0 then 0 else sum_tt/tot_dmg_cnt end as pct_tt, case when tot_dmg_cnt = 0 then 0 else sum_cc/tot_dmg_cnt end as pct_cc, tot_dmg_cnt from 
	(
		select * from
		(
			select vdc_code as vdc_code_tt, sum(total_hh) as sum_tt
			from distributions 
			where (act_status like 'Ongoing%' or act_status like 'Completed%')
			and act_desc in ('Tents', 'Tarpaulin')
			group by 1
		) a
		FULL OUTER JOIN  
		(	
			select vdc_code as vdc_code_cc, sum(total_hh) as sum_cc
			from distributions 
			where (act_status like 'Ongoing%' or act_status like 'Completed%')
			and act_desc in ('Cash for Shelter (15,000 NPR)', 'CGI Bundle (72ft/bundle)')
			group by 1
		) b
		ON vdc_code_tt = vdc_code_cc
	) main
	INNER JOIN
	(
		select hlcit_code, tot_dmg_cnt
		from vdc_damage
	) damage
	ON main.vdc_code_tt = damage.hlcit_code
) out
ON out.vdc_code_tt = gc.hlcit_code;

update maps.dist_prof_cov_10_30 set pct_tt = 0 where pct_tt is Null;
update maps.dist_prof_cov_10_30 set pct_cc = 0 where pct_cc is Null;
update maps.dist_prof_cov_10_30 as p
	set tot_dmg_cnt = 
	vdc_damage.tot_dmg_cnt 
	from vdc_damage
	where vdc_damage.hlcit_code = p.hlcit_code;
	
select * from maps.dist_prof_cov_10_30