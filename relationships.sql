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

