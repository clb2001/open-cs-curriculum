select cast(people.born / 10 * 10 as born) || 's' as DECADE,
    count(distinct people.person_id) as NUM_DIRECTORS from people 
    join crew on people.person_id = crew.person_id
    where crew.category = 'director' and people.born >= 1900
  group by people.born / 10 * 10;