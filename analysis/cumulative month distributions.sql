--pull distribution figures by monnth... UNIONs are a workaround. should be done with window functions

select
 sum(case when act_desc in ('Tents', 'Tarpaulin') then total_hh end) as tt_sum,
 sum(case when act_desc in ('Cash for Shelter (15,000 NPR)', 'CGI Bundle (72ft/bundle)') then total_hh end) as cc_sum,
 'April' as mo
from distributions
where       
district in 
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
and (act_status ilike '%completed%' or act_status ilike '%ongoing%')
and (comp_month <= 4 and comp_year = 2015 and comp_month >=4)

UNION


select
 sum(case when act_desc in ('Tents', 'Tarpaulin') then total_hh end) as tt_sum,
 sum(case when act_desc in ('Cash for Shelter (15,000 NPR)', 'CGI Bundle (72ft/bundle)') then total_hh end) as cc_sum,
 'May' as mo
from distributions
where       
district in 
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
and (act_status ilike '%completed%' or act_status ilike '%ongoing%')
and (comp_month <= 5 and comp_year = 2015 and comp_month >=4)

UNION


select
 sum(case when act_desc in ('Tents', 'Tarpaulin') then total_hh end) as tt_sum,
 sum(case when act_desc in ('Cash for Shelter (15,000 NPR)', 'CGI Bundle (72ft/bundle)') then total_hh end) as cc_sum,
 'June' as mo
from distributions
where       
district in 
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
and (act_status ilike '%completed%' or act_status ilike '%ongoing%')
and (comp_month <= 6 and comp_year = 2015 and comp_month >=4)

UNION


select
 sum(case when act_desc in ('Tents', 'Tarpaulin') then total_hh end) as tt_sum,
 sum(case when act_desc in ('Cash for Shelter (15,000 NPR)', 'CGI Bundle (72ft/bundle)') then total_hh end) as cc_sum,
 'July' as mo
from distributions
where       
district in 
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
and (act_status ilike '%completed%' or act_status ilike '%ongoing%')
and (comp_month <= 7 and comp_year = 2015 and comp_month >=4)

UNION


select
 sum(case when act_desc in ('Tents', 'Tarpaulin') then total_hh end) as tt_sum,
 sum(case when act_desc in ('Cash for Shelter (15,000 NPR)', 'CGI Bundle (72ft/bundle)') then total_hh end) as cc_sum,
 'August' as mo
from distributions
where       
district in 
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
and (act_status ilike '%completed%' or act_status ilike '%ongoing%')
and (comp_month <= 8 and comp_year = 2015 and comp_month >=4)

UNION


select
 sum(case when act_desc in ('Tents', 'Tarpaulin') then total_hh end) as tt_sum,
 sum(case when act_desc in ('Cash for Shelter (15,000 NPR)', 'CGI Bundle (72ft/bundle)') then total_hh end) as cc_sum,
 'Sept' as mo
from distributions
where       
district in 
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
and (act_status ilike '%completed%' or act_status ilike '%ongoing%')
and (comp_month <= 9 and comp_year = 2015 and comp_month >=4)

UNION


select
 sum(case when act_desc in ('Tents', 'Tarpaulin') then total_hh end) as tt_sum,
 sum(case when act_desc in ('Cash for Shelter (15,000 NPR)', 'CGI Bundle (72ft/bundle)') then total_hh end) as cc_sum,
 'Oct' as mo
from distributions
where       
district in 
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
and (act_status ilike '%completed%' or act_status ilike '%ongoing%')
and (comp_month <= 10 and comp_year = 2015 and comp_month >=4)

UNION


select
 sum(case when act_desc in ('Tents', 'Tarpaulin') then total_hh end) as tt_sum,
 sum(case when act_desc in ('Cash for Shelter (15,000 NPR)', 'CGI Bundle (72ft/bundle)') then total_hh end) as cc_sum,
 'Nov' as mo
from distributions
where       
district in 
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
and (act_status ilike '%completed%' or act_status ilike '%ongoing%')
and (comp_month <= 11 and comp_year = 2015 and comp_month >=4)
