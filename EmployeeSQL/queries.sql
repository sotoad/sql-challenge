--queries--

--List the following details of each employee: employee number, last name, first name, sex, and salary.
select employees.emp_no as employee_number, last_name, first_name, sex, salary
from salaries
inner join employees on employees.emp_no = salaries.emp_no;


--List first name, last name, and hire date for employees who were hired in 1986.
select first_name, last_name, hire_date
from employees 
where hire_date between '1/1/1986' and '12/31/1986';


--List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
select dept_mananger.emp_no as manager_employee_number, employees.last_name, employees.first_name, dept_mananger.dept_no as department_number, dept_name as department_name
from ((departments
inner join dept_mananger on dept_mananger.dept_no = departments.dept_no)
inner join employees on employees.emp_no = dept_mananger.emp_no);

--List the department of each employee with the following information: employee number, last name, first name, and department name.
select employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
from ((dept_emp
inner join employees on employees.emp_no = dept_emp.emp_no)
inner join departments on departments.dept_no = dept_emp.dept_no);

--List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
select first_name, last_name, sex 
from employees
where first_name = 'Hercules' and last_name like 'B%';

--List all employees in the Sales department, including their employee number, last name, first name, and department name.
select employees.emp_no, employees.last_name, employees.first_name, departments.dept_name as department_name
from ((dept_emp
inner join employees on employees.emp_no = dept_emp.emp_no)
inner join departments on departments.dept_no = dept_emp.dept_no)
where departments.dept_name = 'Sales';

--List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
select employees.emp_no, employees.last_name, employees.first_name, departments.dept_name as department_name
from ((dept_emp
inner join employees on employees.emp_no = dept_emp.emp_no)
inner join departments on departments.dept_no = dept_emp.dept_no)
where departments.dept_name in ('Sales', 'Development');

--In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
select last_name, count(last_name)
from employees
group by last_name
order by last_name desc;