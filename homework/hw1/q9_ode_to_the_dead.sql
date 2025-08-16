-- Online Anallytical processing
-- select crew.category as [CATEGORY], people.name as [NAME], people.died as [DEATH YEAR],
--   titles.primary_title as [LONGEST WORK TITLE], titles.runtime_minutes as [WORK RUNTIME], 
--   RANK() over (partition by crew.category order by crew.category, people.died, people.name) as [CATEGORY RANK]
--   from (people inner join crew on people.person_id = crew.person_id)
--   inner join titles on titles.title_id = crew.title_id;
-- select crew.category, people.name, people.died, titles.primary_title, titles.runtime_minutes,
-- disgusting!
with longest_per_person as (
    select category, name, died, primary_title, runtime_minutes,
    DENSE_RANK() over (partition by crew.category order by people.died, people.name) as rank_num,
    DENSE_RANK() over (partition by crew.category, people.person_id order by titles.runtime_minutes, titles.title_id) as rank_num_runtime
    from (people inner join crew on people.person_id = crew.person_id)
    inner join titles on titles.title_id = crew.title_id
    where died not NULL and runtime_minutes not NULL and category not NULL
),
top_titles as (
    select category, name, died, primary_title, runtime_minutes, rank_num
    from longest_per_person where rank_num <= 5 and rank_num_runtime = 1
)
select * from top_titles order by category, died, name;