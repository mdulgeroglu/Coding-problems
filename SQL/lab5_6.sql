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



/* 2.For this exercise, you use the employees and departments table. Create a PL/SQL block that fetches and displays the names of the five departments with the most employees (Hint: use a join condition). For each of these departments, display the department name and the number of employees. Order your output so that the department with the most employees is displayed first. Use %ROWTYPE and the explicit cursor attribute %ROWCOUNT.
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

BEGIN
    FOR r_employees IN cur_dept LOOP
    
        v_dept := r_employees.department_id;

        SELECT dpt.department_name , COUNT(epe.employee_id) AS EMPCOUNT
        INTO v_emp_dept_record
        FROM departments dpt JOIN employees epe
        ON (dpt.department_id = epe.department_id)
        WHERE dpt.department_id = v_dept
        GROUP BY dpt.department_name
        ORDER BY empcount DESC;

        DBMS_OUTPUT.PUT_LINE(RPAD(v_emp_dept_record.department_name, 15) || ' ' ||v_emp_dept_record.emp_count);
        
        v_counter := v_counter + 1;
        EXIT WHEN v_counter >= 5;

    END LOOP;
    
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('This department does not exist');
END;

Administration  4
Marketing       7
Shipping        7
IT              5
Sales - Europe  4


-- ----------------------------------------

DECLARE    
    CURSOR cur_dep_emp IS
        -- SELECT *
        SELECT dpt.department_name , COUNT(epe.employee_id) AS EMPCOUNT
                FROM departments dpt JOIN employees epe
                ON (dpt.department_id = epe.department_id)
                GROUP BY dpt.department_name
                ORDER BY empcount DESC;
        -- WHERE ROWNUM < 6;
    r_dep_emp   cur_dep_emp%ROWTYPE;
BEGIN
    -- FOR v_emp_dept_record IN emp_dept LOOP
    OPEN cur_dep_emp;
        LOOP
            FETCH cur_dep_emp INTO r_dep_emp;
            EXIT WHEN cur_dep_emp%ROWCOUNT > 10 OR cur_dep_emp%NOTFOUND;
            DBMS_OUTPUT.PUT_LINE(RPAD(r_dep_emp.department_name, 15) || ' ' ||r_dep_emp.EMPCOUNT);
        END LOOP;
    CLOSE cur_dep_emp;
END;

Shipping        7
Marketing       7
IT              5
Accounting      5
Sales - America 4


/*5. Modify the following PL/SQL block so that it uses a cursor FOR loop. Keep the explicit cursor declaration in the DECLARE section. Test your changes.
DECLARE
    CURSOR wf_currencies_cur IS
        SELECT currency_code, currency_name
        FROM wf_currencies
        ORDER BY currency_name;
    v_curr_code     wf_currencies.currency_code%TYPE;
    v_curr_name     wf_currencies.currency_name%TYPE;
BEGIN
    OPEN wf_currencies_cur;
    LOOP
        FETCH wf_currencies_cur
        INTO v_curr_code, v_curr_name;
        EXIT WHEN wf_currencies_cur%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE(v_curr_code || ' ' || v_curr_name);
    END LOOP;
    CLOSE wf_currencies_cur;
END;
*/

DECLARE
    CURSOR wf_currencies_cur IS
        SELECT currency_code, currency_name
        FROM currencies
        ORDER BY currency_name;
    r_currencies    wf_currencies_cur%ROWTYPE;
BEGIN
    FOR r_currencies IN wf_currencies_cur LOOP
        DBMS_OUTPUT.PUT_LINE(r_currencies.currency_code || ' ' || r_currencies.currency_name);
    END LOOP;
END;



/* 6. Write a PL/SQL block to display the country_name and area of all countries in a chosen region. The region_id should be passed to the cursor as a parameter. Test your block using two region_ids: 5 (South America) and 30 (Eastern Asia). Do not use a cursor FOR loop.

country_name
area 
of all countries in a chosen region
region_id param
*/

DECLARE
    CURSOR cur_countries (v_region countries.region_id%TYPE) IS
        SELECT country_name, area, region_id
        FROM countries
        WHERE region_id = v_region;
    r_countries     cur_countries%ROWTYPE;
BEGIN
    OPEN cur_countries(30);
        LOOP
            FETCH cur_countries INTO r_countries;
            EXIT WHEN cur_countries%NOTFOUND;
            DBMS_OUTPUT.PUT_LINE(r_countries.region_id|| ' : ' || r_countries.country_name || ' : ' || r_countries.area);
        END LOOP;
    CLOSE cur_countries;
END;

/* 7. Write and run a PL/SQL block which produces a listing of departments and their employees. Use the departments and employees tables. In a cursor FOR loop, retrieve and display the department_id and department_name for each department, and display a second line containing ‘----------‘ as a separator. In a nested cursor FOR loop, retrieve and display the first_name, last_name and salary of each employee in that department, followed by a blank line at the end of each department. Order the departments by department_id, and the employees in each department by last_name.
You will need to declare two cursors, one to fetch and display the departments, the second to fetch and display the employees in that department, passing the department_id as a parameter.
Your output should look something like this (only the first few departments are shown):
10 Administration
-----------------------------
Jennifer Whalen 4400
20 Marketing
-----------------------------
Pat Fay 6000
Michael Hartstein 13000
50 Shipping
-----------------------------
Curtis Davies 3400
Randall Matos 2600
Kevin Mourgos 5800
Trenna Rajs 3500
Peter Vargas 2500
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