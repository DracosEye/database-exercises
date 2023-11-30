use employees;

describe departments;
describe dept_emp;
describe dept_manager;
describe employees;
describe salaries;
describe titles;

use hippo_ben;

alter table albums add unique (artist, name);

#Fails
insert into albums (artist, name, release_date, sales, genre) values ('AC/DC', 'Back in Black', 1990, 40, 'crap');

insert into albums (artist, name, release_date, sales, genre) values ('AC/DC', 'Back in Green', 1990, 40, 'crap');

select * from albums;

insert into albums (artist, name, release_date, sales, genre) values ('Other Band', 'Back in Black', 1990, 40, 'crap');

show indexes from albums;