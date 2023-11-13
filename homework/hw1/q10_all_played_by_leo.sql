-- use CTE
-- with recursive L_role as(
--     select characters from crew inner join people
--     on crew.person_id = people.person_id
--     where people.name = 'Leonardo DiCaprio'
--     union all
--     select crew.characters from (crew inner join people
--     on crew.person_id = people.person_id)
--     inner join L_role on L_role.characters = crew.characters
--     where people.name = 'Leonardo DiCaprio'
-- ),
-- distinct_role AS (
--   SELECT DISTINCT characters
--   FROM L_role
-- )
-- SELECT GROUP_CONCAT(characters, ',')
-- FROM distinct_role;

-- not this:
-- SELECT c.characters as json_data
-- FROM people AS p, crew AS c
-- WHERE p.name = "Leonardo DiCaprio" AND p.born = 1974 AND p.person_id = c.person_id
-- ORDER BY c.characters
WITH json_table(json_data) AS (
	SELECT c.characters as json_data
	FROM people AS p, crew AS c
	WHERE p.name = "Leonardo DiCaprio" AND p.born = 1974 AND p.person_id = c.person_id
	ORDER BY c.characters
)
characters(character) AS (
    SELECT DISTINCT value as character
	FROM json_table, json_each(json_table.json_data)
	WHERE character <> "" AND character NOT LIKE "%SELF%"
	ORDER BY character
)
SELECT GROUP_CONCAT(character) FROM characters;
select * from json_table;