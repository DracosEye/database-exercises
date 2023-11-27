use hippo_ben;

delete from albums
where release_date > 1991;

delete from albums
where genre like '%disco%' or '%Disco%';

delete from albums
where artist = 'Whitney Houston';