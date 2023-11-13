select primary_title as TITLE, 
  (case when ended not in ('NULL') then ended - premiered else 2023 - premiered end) YEARS_RUNNING
  from titles 
  where type = 'tvSeries' and premiered not in ('NULL')
  order by YEARS_RUNNING DESC limit 20;