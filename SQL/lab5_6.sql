/*1.Copy and execute the following anonymous block. Then modify it to declare and use a single record instead of a scalar variable for each column. Make sure that your code will still work if an extra column is added to the departments table later. Execute your modified block and save your code.
*/
DECLARE
    v_dept_record departments%ROWTYPE;
BEGIN
    SELECT * INTO v_dept_record
    FROM departments
    WHERE department_id = 80;
    DBMS_OUTPUT.PUT_LINE(v_dept_record.department_id || ' ' || v_dept_record.department_name || ' ' || v_dept_record.manager_id || ' ' || v_dept_record.location_id);
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('This department does not exist');
END;



/*2.For this exercise, you use the employees and departments table. Create a PL/SQL block that fetches and displays the names of the five departments with the most employees (Hint: use a join condition). For each of these departments, display the department name and the number of employees. Order your output so that the department with the most employees is displayed first. Use %ROWTYPE and the explicit cursor attribute %ROWCOUNT.
*/


DECLARE
    TYPE emp_dept IS RECORD (
    department_name     departments.department_name%TYPE,
    emp_count           PLS_INTEGER);
    CURSOR cur_dept IS
        SELECT department_id
        FROM departments;
    v_emp_dept_record        emp_dept;
    r_employees  cur_dept%ROWTYPE;
    v_dept PLS_INTEGER;
    v_counter PLS_INTEGER := 0;
    v_empcounter PLS_INTEGER := 0;

BEGIN
    FOR r_employees IN cur_dept LOOP
    
        v_dept := r_employees.department_id;

        SELECT dpt.department_name , COUNT(epe.employee_id) AS 'EMPCOUNT'
        INTO v_emp_dept_record
        FROM departments dpt JOIN employees epe
        ON (dpt.department_id = epe.department_id)
        WHERE dpt.department_id = v_dept
        GROUP BY dpt.department_name
        ORDER BY empcount DESC;

        DBMS_OUTPUT.PUT_LINE(v_emp_dept_record.department_name || r_employees.EMPCOUNT);
        
        v_counter := v_counter + 1;
        EXIT WHEN v_counter >= 5;

    END LOOP;


EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('This department does not exist');
END;































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