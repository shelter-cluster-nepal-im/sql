--pull tarps/tents and cash/cgi coverage by district


create table maps.dist_damage_10_27 as
select dist_code_tt, sum_tt, sum_cc, case when tot_dmg_cnt = 0 then 0 else sum_tt/tot_dmg_cnt end as pct_tt, case when tot_dmg_cnt = 0 then 0 else sum_cc/tot_dmg_cnt end as pct_cc  from 
(
    select * from
    (
        select dist_code as dist_code_tt, sum(total_hh) as sum_tt
        from distributions 
        where (act_status like 'Ongoing%' or act_status like 'Completed%')
        and act_desc in ('Tents', 'Tarpaulin')
        and district in 
		(
		'Bhaktapur',
		'Dhading',
		'Dolakha',
		'Gorkha',
		'Kabhrepalanchok',
		'Kathmandu',
		'Lalitpur',
		'Makawanpur',
		'Nuwakot',
		'Okhaldhunga',
		'Ramechhap',
		'Rasuwa',
		'Sindhuli',
		'Sindhupalchok'
		)
        group by 1
    ) a
    FULL OUTER JOIN  
    (   
        select dist_code as dist_code_cc, sum(total_hh) as sum_cc
        from distributions 
        where (act_status like 'Ongoing%' or act_status like 'Completed%')
        and act_desc in ('Cash for Shelter (15,000 NPR)', 'CGI Bundle (72ft/bundle)')        
        and district in 
		(
		'Bhaktapur',
		'Dhading',
		'Dolakha',
		'Gorkha',
		'Kabhrepalanchok',
		'Kathmandu',
		'Lalitpur',
		'Makawanpur',
		'Nuwakot',
		'Okhaldhunga',
		'Ramechhap',
		'Rasuwa',
		'Sindhuli',
		'Sindhupalchok'
		)
        group by 1
    ) b
    ON dist_code_tt = dist_code_cc
) main
INNER JOIN
(
    select dist_code, sum(tot_dmg_cnt) as tot_dmg_cnt
    from vdc_damage
    group by 1
) damage
ON main.dist_code_tt = damage.dist_code;

select * from maps.dist_damage_10_27;