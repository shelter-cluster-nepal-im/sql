--find top 5 sourcing agencies by district

SELECT main.district, main.source_agency, main.sum_hh, case when ong.sum_on is NULL then 0 else ong.sum_on end, case when comp.sum_comp is NULL then 0 else comp.sum_comp end, main.r FROM
(
	SELECT * 
	FROM
	(
	  SELECT district, source_agency, sum_hh, ROW_NUMBER() OVER (PARTITION BY district ORDER BY sum_hh DESC) AS r
	  FROM
	  (
	  	select dist_code, 
	  			district,
				case when (source_agency ilike '%ifrc%' or source_agency ilike '%red cross%') or (imp_agency ilike '%ifrc%' or imp_agency ilike '%red cross%') then 'Red Cross'
				when source_agency ilike '%iom%' or imp_agency ilike '%iom%' then 'IOM'
				when source_agency ilike 'none' or source_agency ilike '%internal%' then imp_agency 
				else source_agency end as source_agency,
		  		sum(total_hh) as sum_hh 
	  	from distributions
	  	where dist_code in
	  	(
	  		select distinct(dist_code) from codes where priority is TRUE
	  	)
	  	and source_agency not ilike '%government%'
	  	and imp_agency not ilike '%government%'
	  	and (act_status ilike '%complete%'
	  	or act_status ilike '%ongoing%')
	  	group by 1, 2, 3
	  ) g
	) x
	WHERE
	  x.r <= 5
) main
LEFT OUTER JOIN 
(
	select district, 
				case when (source_agency ilike '%ifrc%' or source_agency ilike '%red cross%') or (imp_agency ilike '%ifrc%' or imp_agency ilike '%red cross%') then 'Red Cross'
			when source_agency ilike '%iom%' or imp_agency ilike '%iom%' then 'IOM'
			when source_agency ilike 'none' or source_agency ilike '%internal%' then imp_agency 
			else source_agency end as source_agency,
	  		sum(total_hh) as sum_on 
	from distributions
	where act_status ilike '%ongoing%'
	group by 1, 2
) ong
ON main.district = ong.district AND main.source_agency = ong.source_agency
LEFT OUTER JOIN 
(
	select district,
				case when (source_agency ilike '%ifrc%' or source_agency ilike '%red cross%') or (imp_agency ilike '%ifrc%' or imp_agency ilike '%red cross%') then 'Red Cross'
			when source_agency ilike '%iom%' or imp_agency ilike '%iom%' then 'IOM'
			when source_agency ilike 'none' or source_agency ilike '%internal%' then imp_agency 
			else source_agency end as source_agency,
			sum(total_hh) as sum_comp 
	from distributions
	where act_status ilike '%complete%'
	group by 1, 2
) comp
ON main.district = comp.district AND main.source_agency = comp.source_agency
ORDER BY main.district ASC, main.r ASC

