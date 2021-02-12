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


/* 20. Write a PL/SQL block to 
    display the country_id and country_name values 
    from the WF_COUNTRIES table 
    for country_id whose values range from 1 through 3. 
Use a basic loop. Increment a variable from 1 through 3. 
Use an IF statement to test your variable and 
EXIT the loop after you have displayed the first 3 countries.
COUNTRY_ID	REGION_ID	COUNTRY_NAME
*/
DECLARE
    v_counter       PLS_INTEGER := 1;               -- counter
    v_id            countries.country_id%TYPE;      -- country_id from countries table goes in here
    v_name          countries.country_name%TYPE;    -- country_name from countries table goes in here
BEGIN
    DBMS_OUTPUT.PUT_LINE(RPAD('Country ID', 12) || RPAD('Country Name', 14));
    LOOP
        SELECT country_id, country_name
        INTO v_id, v_name
        FROM countries
        WHERE country_id = v_counter;
        
        DBMS_OUTPUT.PUT_LINE(RPAD(v_id, 12) || RPAD(v_name, 30));   -- output
        
        v_counter := v_counter + 1;         -- increment
        
        EXIT WHEN v_counter > 3;            -- exit
    END LOOP;
END;


/* 22.Write a PL/SQL block to produce a 
    list of available vehicle license plate numbers. 
    These numbers must be in the following format: NN-MMM, 
    where NN is between 60 and 65, and MMM is between 100 and 110. 
    
    Use nested FOR loops. 
    The outer loop should choose numbers between 60 and 65. 
    The inner loop should choose numbers between 100 and 110, and concatenate the two numbers together.
*/
DECLARE
BEGIN
    FOR v_count_out IN 60..65 LOOP
        FOR v_count_in IN 100..110 LOOP
            DBMS_OUTPUT.PUT_LINE(v_count_out || '-' || v_count_in);
        END LOOP;
    END LOOP;
END;


























