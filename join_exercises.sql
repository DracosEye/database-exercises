use hippo_ben;

CREATE TABLE roles (
                       id INT UNSIGNED NOT NULL AUTO_INCREMENT,
                       name VARCHAR(100) NOT NULL,
                       PRIMARY KEY (id)
);

CREATE TABLE users (
                       id INT UNSIGNED NOT NULL AUTO_INCREMENT,
                       name VARCHAR(100) NOT NULL,
                       email VARCHAR(100) NOT NULL,
                       role_id INT UNSIGNED DEFAULT NULL,
                       PRIMARY KEY (id),
                       FOREIGN KEY (role_id) REFERENCES roles (id)
);

INSERT INTO roles (name) VALUES ('admin');
INSERT INTO roles (name) VALUES ('author');
INSERT INTO roles (name) VALUES ('reviewer');
INSERT INTO roles (name) VALUES ('commenter');

INSERT INTO users (name, email, role_id) VALUES
                                             ('bob', 'bob@example.com', 1),
                                             ('joe', 'joe@example.com', 2),
                                             ('sally', 'sally@example.com', 3),
                                             ('adam', 'adam@example.com', 3),
                                             ('jane', 'jane@example.com', null),
                                             ('mike', 'mike@example.com', null);

insert into users (name, email, role_id) values
                                             ('superman', 'manofsteel@added.com', 2),
                                             ('batman', 'darkknight@added.com', 2),
                                             ('wonder woman', 'lassochick@added.com', 2),
                                             ('emmett', 'blankslate@added.com', null);

# Only users and roles that have a non-null match will be displayed
select users.name as user_name, roles.name as role_name from users
join roles on users.role_id = roles.id;

# All users will be displayed, even those whose roles are null
select users.name as user_name, roles.name as role_name from users
left join roles on users.role_id = roles.id;

# All roles will be listed, with the ones who are unfilled showing null as the associated username
select users.name as user_name, roles.name as role_name from users
right join roles on users.role_id = roles.id;

select count(roles.name) as number_of_users, roles.name from users
join roles on users.role_id = roles.id
group by roles.name;

use employees;

select departments.dept_name as Department_Name, concat(employees.first_name, ' ', employees.last_name) as Department_Manager
from employees
join dept_manager
on dept_manager.to_date like '9%' and dept_manager.emp_no = employees.emp_no
join departments
on departments.dept_no = dept_manager.dept_no;

select departments.dept_name as Department_Name, concat(employees.first_name, ' ', employees.last_name) as Department_Manager
from employees
join dept_manager
on dept_manager.to_date like '9%' and dept_manager.emp_no = employees.emp_no and employees.gender = 'F'
join departments
on departments.dept_no = dept_manager.dept_no;

select titles.title, count(titles.title) as Total
from titles
join dept_emp
on titles.emp_no = dept_emp.emp_no and titles.to_date like '9%' and dept_emp.dept_no = 'd009'
group by titles.title
order by Total desc;

select departments.dept_name as Department_Name, concat(employees.first_name, ' ', employees.last_name) as Department_Manager, salaries.salary as Salary
from employees
join titles
    on titles.title = 'Manager' and titles.to_date like '9%' and titles.emp_no = employees.emp_no
join dept_emp
    on dept_emp.emp_no = employees.emp_no
join departments
    on dept_emp.dept_no = departments.dept_no
join salaries
    on salaries.emp_no = dept_emp.emp_no and salaries.to_date like '9%';