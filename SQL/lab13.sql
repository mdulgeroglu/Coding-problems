/* 1. What are triggers commonly used for in the database?

Triggers can be used to perform actions automatically without having to write extra code. 
*/

/* 2. List the types of events that cause a database trigger to fire?
*/

/* 3. What is the most important thing to check before creating a database trigger?
*/

/* 4. When creating a DML statement trigger on a table, what are the components that you must define?

*/

/*
5. A business rule states that each time one or more employees are added to the employees table, an audit record must also be created. This rule could be enforced using application code, but we have decided to enforce it using a DML statement trigger.


A. Create an audit table by executing the following SQL statement:
CREATE TABLE audit_table
(action VARCHAR2(15),
user_name VARCHAR2(30) DEFAULT USER,
last_change_date TIMESTAMP DEFAULT SYSTIMESTAMP);

B. Create a statement level trigger that inserts a row into the audit table immediately after one or more rows are added to the employees_dup table that you created in a previous lesson. The audit table row should contain value “Inserting” in the action column. The other two columns should have their default values. Save your trigger code for later.
*/

CREATE TABLE audit_table
(action VARCHAR2(15),
user_name VARCHAR2(30) DEFAULT USER,
last_change_date TIMESTAMP DEFAULT SYSDATE);



CREATE OR REPLACE TRIGGER employees_dup_trigger
AFTER INSERT ON employees_dup
BEGIN
    INSERT INTO audit_table (action, user_name, last_change_date)
    VALUES ('Inserting', USER, SYSDATE );
END; 

BEGIN
    INSERT INTO employees_dup (last_name, email, hire_date, job_id)
    VALUES ('test', 'test', TO_DATE('25-Mar-2021', 'DD-Mon-YYYY'), 'SA_REP');
END;

DELETE FROM employees_dup WHERE last_name LIKE 'test';



LAST_NAME	VARCHAR2(25)	No	-	-
EMAIL
HIRE_DATE
JOB_ID

/*
C. Test your trigger by inserting a row into employees, then querying the audit table to see that it contains a row.

D. Make sure the trigger does not fire with a DELETE by deleting the employee you just entered. Recheck the audit_table table to make sure that there is not another new row.

*/


/* 6. What is the difference between a statement trigger and a row trigger?
*/

/* 7. A row trigger fires at least once even if no rows are affected. True or false?
*/

/*  8. Imagine that the following four DML triggers have been defined on the employees table: a BEFORE INSERT statement trigger, a BEFORE UPDATE statement trigger, an AFTER UPDATE row trigger, and an AFTER DELETE statement trigger. An UPDATE statement updates three employee rows. How many times will each trigger fire?
*/












-- employees                   Data Type	  Null    Default  Primary Key
employee_id             	   NUMBER(6,0)	  No	  -	       1
first_name              	   VARCHAR2(20)	  Yes	  -	       -
last_name               	   VARCHAR2(25)	  No	  -	       -
email               	       VARCHAR2(25)	  No	  -	       -
phone_number                   VARCHAR2(20)	  Yes	  -	       -
hire_date               	   DATE	          No	  -	       -
job_id              	       VARCHAR2(10)	  No	  -	       -
salary              	       NUMBER(8,2)	  Yes	  -	       -
commission_pct                 NUMBER(2,2)	  Yes	  -	       -
manager_id              	   NUMBER(6,0)	  Yes	  -	       -
department_id                  NUMBER(4,0)	  Yes	  -	       -
bonus               	       VARCHAR2(5)	  Yes	  -	       -
-- ------------------------------------------------------------------------
employees.employee_id
employees.first_name
employees.last_name
employees.email
employees.phone_number
employees.hire_date
employees.job_id
employees.salary
employees.commission_pct
employees.manager_id
employees.department_id
employees.bonus
epe.employee_id
epe.first_name
epe.last_name
epe.email
epe.phone_number
epe.hire_date
epe.job_id
epe.salary
epe.commission_pct
epe.manager_id
epe.department_id
epe.bonus


-- departments                 Data Type	  Null    Default  Primary Key
department_id             	   NUMBER(4,0)	  No	  -	       1
department_name                VARCHAR2(30)	  No	  -	       -
manager_id               	   NUMBER(6,0)	  Yes	  -	       -
location_id               	   NUMBER(4,0)	  Yes	  -	       -
-- ------------------------------------------------------------------------
departments.department_id
departments.department_name
departments.manager_id
departments.location_id
dpt.department_id
dpt.department_name
dpt.manager_id
dpt.location_id