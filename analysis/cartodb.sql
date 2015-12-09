#pull delivery counts grouped by code and priority dist = true
alter table nepal_vdcs add column hh_reached int;

update nepal_vdcs set hh_reached = a.reached 
from 
(select vdc_municipality_hlcit_code, sum(total_number_households) as reached 
from databasev5_0forhdx24_08_2015
where district_hlcit_code in 
(select hlcit_code from nepal_districts where priority_dist = True)
group by 1)a
where nepal_vdcs.admin4pcod = a.vdc_municipality_hlcit_code


#