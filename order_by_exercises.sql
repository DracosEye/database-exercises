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

select * from employees
where last_name like 'E%e'
order by emp_no desc;

select * from employees
where last_name like '%q%' and last_name not like '%qu%';