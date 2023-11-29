use employees;

select datediff(hire_date, curdate()) / 365, hire_date from employees where first_name = 'Maya' order by datediff(hire_date, curdate());

select gender, count(*) from employees group by gender;

select last_name, count(last_name) as quantity from employees group by last_name;

use hippo_ben;

select avg(sales) from albums;

select artist, avg(sales) from albums;

select artist, avg(sales) from albums group by artist;

select artist, avg(sales) as average_sales from albums group by artist order by average_sales desc;

select artist, truncate(avg(sales), 2) as average_sales from albums group by artist order by average_sales desc;

select truncate(max(datediff(hire_date, birth_date)/365), 2) from employees;
select truncate(min(datediff(hire_date, birth_date)/365), 2) from employees;