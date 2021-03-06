--find all distributions in priority districts that do not have a valid VDC entry

select a.district, w, wo, ROUND((w/(w+wo))::numeric, 2) as pct from
(
select district, sum(total_hh) as wo from distributions
where district in 
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
and vdc_code like 'None'
group by 1
)a
INNER JOIN
(
select district, sum(total_hh) as w from distributions
where district in 
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
and vdc_code not like 'None'
group by 1
)b
ON a.district = b.district