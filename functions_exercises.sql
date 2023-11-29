use employees;

select * from employees
where first_name in ('Irena', 'Vidya', 'Maya')
order by last_name desc, first_name desc;

select * from employees
where last_name like 'E%';

select * from employees
where last_name like '%q%';

select * from employees
where (first_name = 'Irena' or first_name = 'Vidya' or first_name = 'Maya') and gender = 'M';

select * from employees
where last_name like 'E%' or last_name like '%e';

select concat(first_name, ' ', last_name) as name from employees
where last_name like 'E%e'
order by emp_no desc;

select * from employees
where last_name like '%q%' and last_name not like '%qu%';

select *, datediff(now(), hire_date) as days_worked_here from employees
where month(birth_date) = 12 and dayofmonth(birth_date) = 25 and year(hire_date) between 1990 and 1999
order by birth_date, hire_date desc;