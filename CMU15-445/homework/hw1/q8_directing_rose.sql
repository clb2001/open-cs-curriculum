select distinct(A.name) as res from people as A inner join crew
  on A.person_id = crew.person_id where crew.category = 'director'
  and crew.title_id in (select title_id from crew
  inner join people on people.person_id = crew.person_id
  where people.name like 'Rose%' and crew.category = 'actress')
  order by res;