use employees;

select distinct title from titles;

select concat(first_name, ' ', last_name) as name from employees
where last_name like 'E%e'
group by name;

select count(last_name) as name_count, last_name from employees
where last_name like '%q%' and last_name not like '%qu%'
group by last_name;

select count(gender) as num_employees, gender from employees
where first_name in ('Irena', 'Maya', 'Vidya')
group by gender;