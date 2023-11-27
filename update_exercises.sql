select name from albums;
update albums
set sales = sales * 10;
select name, sales from albums
where sales > 100;

select name from albums
where release_date < 1980;
update albums
set release_date = release_date - 100
where release_date < 1980;
select name, release_date from albums
where release_date < 1900;

select name from albums
where artist = 'Michael Jackson';
update albums
set artist = 'Peter Jackson'
where artist = 'Michael Jackson';
select artist, name from albums
where artist = 'Peter Jackson';