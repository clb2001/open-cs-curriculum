with batman_actors as (
    select distinct(people.person_id) as person_id from people inner join crew on people.person_id = crew.person_id
    where crew.characters like '%"Batman"%' and crew.category = 'actor'
)
select people.name, round(avg(ratings.rating),2) as avg_rating
  from people inner join batman_actors on people.person_id = batman_actors.person_id
  inner join crew on batman_actors.person_id = crew.person_id
  inner join ratings on crew.title_id = ratings.title_id
  group by (batman_actors.person_id)
  order by avg_rating DESC limit 10;