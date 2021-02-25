/* Department 10 typically has 50 employees. Write a PL/SQL program to count the number of current employees in the department and how many employees need to be hired to bring the count to 50. Your solution MUST:

(1) Declare a variable to hold the count of current employees (v_num_empl), a variable to hold the number to be hired (v_num_hire), and a constant to store the value 50 (c_max_empl).
(2) Retrieve the count of employees currently in department 10.
(3) Compute the difference using c_max_empl and v_num_empl and store the result in v_num_hire.
(4) Display the current number of employees and the number of new hires needed. Include appropriate labels for the output. Use the employees table.
*/
DECLARE
    v_num_empl PLS_INTEGER;
    v_num_hire PLS_INTEGER;
    c_max_empl CONSTANT PLS_INTEGER := 50;
BEGIN
    SELECT COUNT(employee_id)
    INTO v_num_empl
    FROM employees
    WHERE department_id = 10;

    v_num_hire := c_max_empl - v_num_empl;

    DBMS_OUTPUT.PUT_LINE('The current number of employees is: ' || v_num_empl);
    DBMS_OUTPUT.PUT_LINE('The number to hire is: ' || v_num_hire);
END;



/* Write a PL/SQL program to declare a variable (v_val) and set it to the value below. Code an IF statement to determine if the v_val is odd, even, or one of the values is NULL. Display the value of v_val and the word “Even”, “Odd”, or “NULL”. Run the block 3 times using the value 24, 11, and NULL to test all the conditions. Hint: Use MOD().
*/
DECLARE
    v_val       PLS_INTEGER := 24;  --input value
    v_result    VARCHAR(4);         --store even/odd
BEGIN
    IF (MOD(v_val, 2) = 0) THEN
        v_result := 'even';
        DBMS_OUTPUT.PUT_LINE('The value is: ' || v_val);
        DBMS_OUTPUT.PUT_LINE('It is ' || v_result);
    ELSIF (MOD(v_val, 2) = 1) THEN
        v_result := 'odd';
        DBMS_OUTPUT.PUT_LINE('The value is: ' || v_val);
        DBMS_OUTPUT.PUT_LINE('It is ' || v_result);
    ELSIF (v_val IS NULL) THEN
        v_result := 'NULL';
        DBMS_OUTPUT.PUT_LINE('The value is: ' || v_val);
        DBMS_OUTPUT.PUT_LINE('It is ' || v_result);
    ELSE
        DBMS_OUTPUT.PUT_LINE('error');
    END IF;
END;



/* Code a FOR loop to display the numbers from 9 down to 1 and the value when doubled.
*/
DECLARE

BEGIN
    FOR v_val IN REVERSE 9..1 LOOP
        DBMS_OUTPUT.PUT_LINE(v_val || v_val*2);
    END LOOP;
END;


/* Correct the block below so it displays the data expected without moving declarations or executable statements. Hint: Use block labels and dot notation.
*/
<<outer>>
DECLARE
    v_course        VARCHAR2(7)     := 'INF-217';
    v_course_name   VARCHAR2(50)    := 'Database for Business';
BEGIN
    <<inner>>
    DECLARE
        v_course        VARCHAR2(7)     := 'INF-218';
        v_course_name   VARCHAR2(50)    := 'Database Programming';
    BEGIN
        DBMS_OUTPUT.PUT_LINE('The first course in the series is ' || outer.v_course);
        DBMS_OUTPUT.PUT_LINE('The first course name is ' || outer.v_course_name);

        DBMS_OUTPUT.PUT_LINE('The second course in the series is ' || inner.v_course);
        DBMS_OUTPUT.PUT_LINE('The second course name is ' || inner.v_course_name);
    END;
END;


















