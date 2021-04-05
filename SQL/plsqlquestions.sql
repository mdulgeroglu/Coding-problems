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



-- ------------------------------------------------------------



-- Display the name and type of all objects in your schema that are either functions or procedures. Display the result set in order of the object name. Note the aliases used for column names. Select the correct table from USER_OBJECTS, ALL_OBJECTS, DBA_OBJECTS.

SELECT object_name AS "NAME", object_type AS "TYPE"
FROM USER_OBJECTS
WHERE object_type LIKE 'FUNCTION' OR object_type LIKE 'PROCEDURE'
ORDER BY object_name;


/* Part 1 - Write a function that adds 6.525% sales tax to the price of food items. The price of the food item will be passed as a parameter. Be sure to explicitly code the parameter mode. Code one exception that handles any types of error and returns NULL. Reminder: There are only 2 decimal places acceptable when displaying currency.
Table: f_food_items.
Function name: func_exam2.
*/
CREATE OR REPLACE FUNCTION func_exam2
   (p_price  IN  FLOAT)
RETURN FLOAT IS
BEGIN
    RETURN ROUND(p_price * 1.06525, 2);
EXCEPTION
    WHEN OTHERS THEN
        RETURN NULL;
END;

/* Part 2 – Code the SQL statement that is needed to provide the food item id, description, price, and the price with tax for all food items. Order the result set in alpha order by food description.
Submit - Your answer should show the function code, leave a blank line, and then show the SQL 
*/

SELECT food_item_number, description, price, func_exam2(price)
FROM f_food_items
ORDER BY description;



Write an anonymous block to display the song id, type, title, and artist for all songs that have a type code between 10 and 80. Display the number of songs listed at the bottom of the list. Order the result set by title in reverse alpha order. Use a cursor. Table: d_songs


DECLARE
    CURSOR d_songs_cur IS
        SELECT id, type_code, title, artist
        FROM d_songs
        WHERE type_code BETWEEN 10 AND 80;
BEGIN
    FOR r_songs IN d_songs_cur LOOP
        DBMS_OUTPUT.PUT_LINE(r_songs.id || ' ' || r_songs.type_code || ' ' || r_songs.title || ' ' || r_songs.artist);
    END LOOP;
END;


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


































