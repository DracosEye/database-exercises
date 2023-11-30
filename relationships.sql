use employees;

show indexes from employees;

show indexes from salaries;

select emp_no, salary from salaries where salary between 60000 and 62000;

# To create an index
# ALTER TABLE table_name ADD INDEX index_name (column_name);
alter table salaries add index salary_index (salary);

drop index salary_index on salaries;

# Syntax for unique index
# ALTER TABLE table_name ADD UNIQUE (column_name)

select employees.last_name, salaries.salary from employees join salaries on employees.emp_no = salaries.emp_no
where salaries.to_date like '9%' limit 100;

use employees;

select concat(employees.first_name, ' ', employees.last_name) as name, salary from employees join salaries on employees.emp_no = salaries.emp_no
where salaries.to_date like '9%' limit 200;

#Department managers' birth days : subqueries sytle
select concat(first_name, ' ', last_name), birth_date from employees
where emp_no in (
    select emp_no from dept_manager
    );

#Department managers' birth days : join sytle
select concat(first_name, ' ', last_name) as name, birth_date from employees
join dept_manager on employees.emp_no = dept_manager.emp_no;