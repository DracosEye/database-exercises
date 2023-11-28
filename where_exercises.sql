use employees;

select * from employees
where first_name in ('Irena', 'Vidya', 'Maya');

select * from employees
where last_name like 'E%';

select * from employees
where last_name like '%q%';