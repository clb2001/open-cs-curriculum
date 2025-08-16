select titles.type as TITLE_TYPE, round(avg(ratings.rating), 2) as AVG_RATING, 
  min(ratings.rating) as MIN_RATING, max(ratings.rating) as MAX_RATING
  from (titles inner join ratings on titles.title_id = ratings.title_id) T
  inner join akas on T.title_id = akas.title_id
  where akas.types in ('imdbDisplay', 'original') and akas.language = 'de'
  group by T.type -- forgot group by!
  order by AVG_RATING; 