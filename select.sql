select track_name, track_duration
from tracks
where track_duration = (select max(track_duration) from tracks);

select track_name, track_duration
from tracks
where track_duration >= 210;

select collection_name, collection_year 
from collections
where collection_year between 2018 and 2022;

select executor_name
from executors
where executor_name not like '% %';

select track_name
from tracks
where lower(track_name) like 'мой %' or lower(track_name) like '% мой' or lower(track_name) like '% мой %' or lower(track_name) like 'мой' 
or lower(track_name) like 'my %' or lower(track_name) like '% my' or lower(track_name) like '% my %' or lower(track_name) like 'my';

#Задание 3

select genre_name, count (executor_name) from executors e 
join genres_executors ge  on e.executor_id = ge.executor_id 
join genres g on ge.genre_id = g.genre_id 
group by g.genre_id;

select count(track_name) from tracks t 
join albums a on a.album_id = t.album_id 
where a.album_year between 2019 and 2020;

select album_name, AVG(track_duration) from tracks t 
join albums a on a.album_id = t.album_id 
group by a.album_name;

select executor_name from executors e 
where executor_name not in (
select executor_name from albums a 
join executors_albums ea on a.album_id = ea.album_id 
join executors e on ea.executor_id = e.executor_id
where a.album_year = 2020);

select collection_name from collections c 
join collections_tracks ct on c.collection_id = ct.collection_id 
join tracks t on ct.track_id = t.track_id 
join albums a on t.album_id = a.album_id 
join executors_albums ea on a.album_id = ea.album_id 
join executors e on ea.executor_id = e.executor_id 
where e.executor_name like 'Ramstein';
