use employees;

select *
from employees
where hire_date =
      (select hire_date from employees where emp_no = '101010');

select title
from titles
where emp_no in (
    select emp_no
    from employees
    where first_name = 'Aamod'
    );

select first_name, last_name
from employees
where gender = 'F' and emp_no in (
    select emp_no from titles
                  where title = 'Manager' and to_date like '9%'
    );

select dept_name
from departments
where dept_no in (
    select dept_no from dept_emp
                   where emp_no in (
                       select emp_no from employees
                                     where gender = 'F' and emp_no in (
                                         select emp_no from titles
                                                       where to_date like '9%' and title = 'Manager'
                                         )
                       )
    );

# Could not use a subquery, since it would not allow the 'limit 1' to be included in the subquery
select first_name, last_name
from employees
join salaries on employees.emp_no = salaries.emp_no
order by salaries.salary desc
limit 1;