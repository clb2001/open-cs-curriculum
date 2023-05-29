with helper as (select distinct(people.person_id) 
  from people where people.born in 
  (select premiered from titles where primary_title = 'The Prestige'))
select count(*) from helper inner join crew on helper.person_id = crew.person_id
  where helper.person_id = crew.person_id and crew.category in ('actor', 'actress')
  group by crew.category;