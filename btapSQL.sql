select department_id from employees where last_name = 'Zlotkey'

select last_name, hire_date from employees 
where department_id in (select department_id from employees where last_name = 'Zlotkey')
AND last_name <> 'Zlotkey'

-- Excise 2
Select employee_id, last_name, salary from employees
where salary > (select avg(salary) from employees)
order by salary ASC

Select avg(salary) from employees


select * from employees

-- Execise 3
select employee_id, last_name, department_id from employees
where department_id in (select department_id from employees where last_name LIKE '%u%')


select * from departments

--Execute 4
-- C1
select last_name, department_id, job_id from employees 
where department_id in
(select department_id from departments where location_id = 1700)

-- C2: JOIN
select e.last_name, e.department_id, e.job_id 
from employees e inner join departments d on e.department_id = d.department_id
where d.location_id = 1700


--Ex 5
-- C1: select lồng
select last_name, salary from employees where manager_id in
(select employee_id from employees where last_name = 'King')

--C2: self join (cùng 1 bảng nên hệ thống đã tự hiểu => dùng inner join)
select e.last_name, e.salary from employees e inner join employees manager on e.manager_id = manager.employee_id
where manager.last_name = 'King'

--Ex 6

SELECT department_id, last_name, job_id FROM employees WHERE department_id IN
(SELECT department_id FROM departments WHERE department_name = 'Executive')


-- Ex 7
select employee_id, last_name, salary from employees
where salary > (select avg(salary) from employees) AND last_name LIKE '%u%'


-- Ex8 
select max(salary) AS Maximum, min(salary) AS Minimum, sum(salary) AS Sumary, avg(salary) AS Average from employees
where salary IN (select round(max(salary),0) from employees, round(min(salary),0),round(sum(salary),0),round(avg(salary),0) from employees)

--Ex9
select last_name AS Name, LEN(last_name) AS Length from employees
where last_name LIKE 'A%'
OR last_name LIKE 'J%'
OR last_name LIKE 'M%'
ORDER BY last_name ASC


-- Ex 10
select employee_id, last_name, salary, salary + salary * (15.5/100) AS New_salary from employees

--Ex 11
select e.last_name, e.department_id, d.department_name
from  employees e
FULL join departments d
ON e.department_id = d.department_id


-- Ex 12 
select e.employee_id 
from employees e JOIN employees manager ON e.manager_id = manager.employee_id
JOIN departments d ON e.department_id = d.department_id
JOIN locations m ON d.location_id = m.location_id 
where e.hire_date > manager.hire_date AND m.city = 'Toronto'
