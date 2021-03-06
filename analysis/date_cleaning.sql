--ad hoc data cleaning


--planned and neither date > delete (74)
delete from distributions
where act_desc in ('Tents', 'Tarpaulin','tarpaulin','Cash for Shelter (15,000 NPR)', 'CGI Bundle (72ft/bundle)')
and
act_status like 'Planned (funded)' and (start_dt is null and comp_dt is null)

--no status > delete (52)
delete from distributions
where act_desc in ('Tents', 'Tarpaulin','tarpaulin','Cash for Shelter (15,000 NPR)', 'CGI Bundle (72ft/bundle)')
and
act_status is null

--if no comp_dt but start_dt, set and vice versa
--blank start (434)
update distributions set 
start_dt = comp_dt,
start_day = comp_day,
start_month = comp_month,
start_year = comp_year 
where act_desc in ('Tents', 'Tarpaulin','tarpaulin','Cash for Shelter (15,000 NPR)', 'CGI Bundle (72ft/bundle)')
and start_dt is null and comp_dt is not null

--blank comp (113)
update distributions set 
comp_dt = start_dt,
comp_day = start_day,
comp_month = start_month,
comp_year = start_year
where act_desc in ('Tents', 'Tarpaulin','tarpaulin','Cash for Shelter (15,000 NPR)', 'CGI Bundle (72ft/bundle)')
and start_dt is not null and comp_dt is null

--not a planned activity and blank date: set to as_of
--start date (508)
update distributions set 
start_dt = as_of,
start_day = extract(day from to_date(as_of, 'DD/MM/YYYY')),
start_month = extract(month from to_date(as_of, 'DD/MM/YYYY')),
start_year = extract(year from to_date(as_of, 'DD/MM/YYYY')) 
where act_desc in ('Tents', 'Tarpaulin','tarpaulin','Cash for Shelter (15,000 NPR)', 'CGI Bundle (72ft/bundle)')
and act_status not like 'Planned (funded)'
and start_dt is null

--comp date (508)
update distributions set 
comp_dt = as_of,
comp_day = extract(day from to_date(as_of, 'DD/MM/YYYY')),
comp_month = extract(month from to_date(as_of, 'DD/MM/YYYY')),
comp_year = extract(year from to_date(as_of, 'DD/MM/YYYY')) 
where act_desc in ('Tents', 'Tarpaulin','tarpaulin','Cash for Shelter (15,000 NPR)', 'CGI Bundle (72ft/bundle)')
and act_status not like 'Planned (funded)'
and comp_dt is null

--no VDC and ongoing/planned > delete (119)
delete from distributions 
where vdc is null
and (act_status ilike '%ongoing%' or act_status ilike '%planned%')
