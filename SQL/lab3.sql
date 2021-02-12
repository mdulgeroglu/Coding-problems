/* 13.
Write a PL/SQL block to find the total monthly salary paid by the company for a given department number from the employees table. Display a message indicating whether the total salary is greater than or less than $19,000. Test your block twice using the Administration department (department_id =10) and the IT department (department_id =60). The IT department should be greater than $19,000, while the Administration department’s total should be less than $19,000.
*/

DECLARE
    v_dept          employees.department_id%TYPE    := 10;
    v_limit         employees.salary%TYPE           := 19000;
    v_salary_sum    employees.salary%TYPE;
    v_status        VARCHAR2(12);
BEGIN
    SELECT SUM(salary)
    INTO v_salary_sum
    FROM employees
    WHERE department_id = v_dept;
    
    IF v_salary_sum > v_limit THEN
        v_status := 'greater';
    ELSIF v_salary_sum < v_limit THEN
        v_status := 'less';
    -- ELSIF v_salary_sum = v_limit THEN
        -- v_status := 'equal';
    ELSE
        DBMS_OUTPUT.PUT_LINE('error');
    END IF;
    
    DBMS_OUTPUT.PUT_LINE('Total salary for department '|| v_dept ||' is '|| v_status ||' than '|| v_limit);
END;



/* 16.
Use a CASE statement:
    A.Write a PL/SQL block to select the number of countries using a supplied currency name. 
    
    If the number of countries is greater than 20, 
        display “More than 20 countries”. 
    If the number of countries is between 10 and 20, 
        display “Between 10 and 20 countries”. 
    If the number of countries is less than 10, 
        display “Fewer than 10 countries”. 
Use a CASE statement.
*/

DECLARE
    v_currency          VARCHAR2(30)    := 'US DOLLAR';
    v_number_countries  PLS_INTEGER;
    v_display           VARCHAR2(60);
BEGIN
    SELECT COUNT(country_id)
    INTO v_number_countries
    FROM countries cte JOIN currencies cre
    ON (cte.currency_code = cre.currency_code)
    WHERE UPPER(cre.currency_name) = UPPER(v_currency);
    
    CASE 
        WHEN v_number_countries > 20 THEN
            v_display := 'More than 20 countries';
        WHEN v_number_countries BETWEEN 10 AND 20 THEN
            v_display := 'Between 10 and 20 countries';
        WHEN v_number_countries < 10 THEN
            v_display := 'Fewer than 10 countries';
        ELSE
            v_display := 'error';
    END CASE;
        
    DBMS_OUTPUT.PUT_LINE(v_display || ' are using the ' || UPPER(v_currency));
END;




































