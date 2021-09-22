-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

-- Modify this code to update the DB schema diagram.
-- To reset the sample schema, replace everything with
-- two dots ('..' - without quotes).
DROP TABLE IF EXISTS TITLES;
DROP TABLE IF EXISTS SALERIES;
DROP TABLE IF EXISTS EMPLOYEES;
DROP TABLE IF EXISTS DEPT_EMP;
DROP TABLE IF EXISTS DEPT_MANAGER;
DROP TABLE IF EXISTS DEPARTMENTS;

CREATE TABLE "departments" (
    "dept_no" VARCHAR  NOT NULL,
    "dept_name" VARCHAR   NOT NULL,
    CONSTRAINT "pk_departments" PRIMARY KEY (
        "dept_no"
     )
);

CREATE TABLE "dept_emp" (
    "emp_no" int   NOT NULL,
    "dept_no" VARCHAR   NOT NULL
);

CREATE TABLE "dept_manager" (
    "dept_no" VARCHAR   NOT NULL,
    "emp_no" int   NOT NULL
);

CREATE TABLE "employees" (
    "emp_no" int   NOT NULL,
    "emp_title_id" VARCHAR NOT NULL,
    "birth_date" date   NOT NULL,
    "first_name" VARCHAR   NOT NULL,
    "last_name" VARCHAR   NOT NULL,
    "sex" VARCHAR   NOT NULL,
    "hire_date" date   NOT NULL,
    CONSTRAINT "pk_employees" PRIMARY KEY (
        "emp_no"
     )
);

CREATE TABLE "salaries" (
    "emp_no" int   NOT NULL,
    "salary" int   NOT NULL
);

CREATE TABLE "titles" (
    "title_id" VARCHAR   NOT NULL,
    "title" VARCHAR   NOT NULL,
    CONSTRAINT "pk_titles" PRIMARY KEY (
        "title_id"
     )
);
-----------------------
ALTER TABLE employees 
  DROP CONSTRAINT IF EXISTS fk_employees_emp_title_id;
  
ALTER TABLE dept_manager 
  DROP CONSTRAINT IF EXISTS fk_dept_manager_dept_no;
  
ALTER TABLE dept_manager 
  DROP CONSTRAINT IF EXISTS fk_dept_manager_emp_no;

ALTER TABLE dept_emp 
  DROP CONSTRAINT IF EXISTS fk_dept_emp_dept_no;
  
ALTER TABLE dept_emp 
  DROP CONSTRAINT IF EXISTS fk_dept_emp_emp_no;

ALTER TABLE saleries
  DROP CONSTRAINT IF EXISTS fk_saleries_emp_dept_no;

ALTER TABLE saleries
  DROP CONSTRAINT IF EXISTS fk_saleries_emp_no;

ALTER TABLE titles 
  DROP CONSTRAINT IF EXISTS pk_titles;
  
ALTER TABLE departments 
  DROP CONSTRAINT IF EXISTS pk_departments;
  
 ALTER TABLE employees 
  DROP CONSTRAINT IF EXISTS pk_employees;