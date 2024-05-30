DROP TABLE IF EXISTS employees, departments, titles, dept_emp, dept_manager, salaries;

-- Create employees table
CREATE TABLE employees (
    emp_no INT PRIMARY KEY,
	emp_title_id CHAR (50),
    birth_date DATE NOT NULL,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    sex VARCHAR(1) NOT NULL,
    hire_date DATE NOT NULL
);

-- Create departments table
CREATE TABLE departments (
    dept_no CHAR(4) PRIMARY KEY,
    dept_name VARCHAR(40) NOT NULL
);

-- Create titles table
CREATE TABLE titles (
    title_id CHAR (50) PRIMARY KEY,
    title VARCHAR(50) NOT NULL,
	emp_no INT,
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

-- Create dept_emp table
CREATE TABLE dept_emp (
    emp_no INT,
    dept_no CHAR(4),
	PRIMARY KEY (emp_no, dept_no),
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
    FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);

-- Create dept_manager table
CREATE TABLE dept_manager (
    dept_no CHAR(4),
    emp_no INT,
	PRIMARY KEY (dept_no, emp_no),
    FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

-- Create salaries table
CREATE TABLE salaries (
    emp_no INT,
    salary INT NOT NULL,
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

COPY employees(emp_no, emp_title_id, birth_date, first_name, last_name, sex, hire_date)
FROM '/Users/lorenzodavis/Desktop/sql-challenge/data/employees.csv'
DELIMITER ','
CSV HEADER;

COPY departments(dept_no, dept_name)
FROM '/Users/lorenzodavis/Desktop/sql-challenge/data/departments.csv'
DELIMITER ','
CSV HEADER;

COPY titles(title_id, title)
FROM '/Users/lorenzodavis/Desktop/sql-challenge/data/titles.csv'
DELIMITER ','
CSV HEADER;

COPY dept_emp(emp_no, dept_no)
FROM '/Users/lorenzodavis/Desktop/sql-challenge/data/dept_emp.csv'
DELIMITER ','
CSV HEADER;

COPY dept_manager(dept_no, emp_no)
FROM '/Users/lorenzodavis/Desktop/sql-challenge/data/dept_manager.csv'
DELIMITER ','
CSV HEADER;

COPY salaries(emp_no, salary)
FROM '/Users/lorenzodavis/Desktop/sql-challenge/data/salaries.csv'
DELIMITER ','
CSV HEADER;