.read data.sql


CREATE TABLE bluedog AS
  SELECT color, pet FROM students Where color = 'blue' and pet = 'dog';

CREATE TABLE bluedog_songs AS
  SELECT color, pet, song FROM students Where color = 'blue' and pet = 'dog';


CREATE TABLE smallest_int AS
  SELECT time, smallest FROM students Where smallest > 2 order by smallest LIMIT 20;


CREATE TABLE matchmaker AS
  SELECT A.pet, A.song, A.color, B.color 
    FROM students AS A, students AS B
    WHERE A.pet = B.pet and A.song = B.song and A.time != B.time;


CREATE TABLE sevens AS
  SELECT A.seven FROM students as A, numbers as B Where (A.time = B.time and A.number = 7 and B.'7' = "True");

