/* 2. Modify the following PL/SQL block so that it uses a cursor FOR loop. Keep the explicit cursor declaration in the DECLARE section. Test your changes.
DECLARE
    CURSOR cur_countries IS
    SELECT country_name, national_holiday_name, national_holiday_date
    FROM countries
    WHERE region_id = 5;
    r_countries cur_countries%ROWTYPE;
BEGIN
    OPEN cur_countries;
    LOOP
    FETCH cur_countries INTO r_countries;
    EXIT WHEN cur_countries%NOTFOUND;
    DBMS_OUTPUT.PUT_LINE ('Country: ' || r_countries.country_name || ' National holiday: '|| r_countries.national_holiday_name || ', held on: '|| r_countries.national_holiday_date);
    END LOOP;
    CLOSE cur_countries;
END;

*/

DECLARE
    CURSOR cur_countries IS
        SELECT country_name, national_holiday_name, national_holiday_date
        FROM countries
        WHERE region_id = 5;
BEGIN
    FOR r_countries IN cur_countries LOOP
        DBMS_OUTPUT.PUT_LINE ('Country: ' || r_countries.country_name || ' National holiday: '|| r_countries.national_holiday_name || ', held on: '|| r_countries.national_holiday_date);
    END LOOP;
END;

/*
3. Modify your answer to question 2 to declare the cursor using a subquery in the FOR…LOOP
statement, rather than in the declaration section. Test your changes again.
*/

BEGIN
    FOR r_countries IN
        (SELECT country_name, national_holiday_name, national_holiday_date
        FROM countries
        WHERE region_id = 5)
    LOOP
    DBMS_OUTPUT.PUT_LINE ('Country: ' || r_countries.country_name || ' National holiday: '|| r_countries.national_holiday_name || ', held on: '|| r_countries.national_holiday_date);
    END LOOP;
END;


/*
4. Using the COUNTRIES table, write a cursor that returns countries with a highest_elevation greater
than 8,000  m. For each country, display the country_name, highest_elevation, and climate. Use a
cursor FOR loop, declaring the cursor using a subquery in the FOR…LOOP statement.
*/

BEGIN
    FOR r_countries IN (
        SELECT country_name, highest_elevation, climate FROM countries WHERE highest_elevation > 8000) LOOP
        DBMS_OUTPUT.PUT_LINE ('Country: ' || RPAD(r_countries.country_name, 28) || ' | ' || 'Highest Elevation: '|| RPAD(r_countries.highest_elevation, 4) || ' | ' || 'Climate: '|| r_countries.climate);
    END LOOP;
END;


/*
5. This question uses a join of the SPOKEN_LANGUAGES and COUNTRIES tables with a GROUP
BY and HAVING clause. Write a PL/SQL block to fetch and display all the countries that have more than six spoken
languages. For each such country, display country_name and the number of spoken languages.
Use a cursor FOR loop, but declare the cursor explicitly in the DECLARE section. After all the
rows have been fetched and displayed, display an extra row showing the total number of countries
having more than six languages. (Hint: Declare a variable to hold the value of %ROWCOUNT.)
*/

DECLARE
    v_count         PLS_INTEGER := 0;
    v_pad           PLS_INTEGER := 40;
    CURSOR cur_countries IS
        SELECT cte.country_name, COUNT(sle.language_id) AS COUNT
        FROM countries cte JOIN spoken_languages sle
        ON (cte.country_id = sle.country_id)
        GROUP BY cte.country_name
        HAVING COUNT(*) > 6;
BEGIN
    DBMS_OUTPUT.PUT_LINE(RPAD('Country Name', v_pad)|| ' | ' || 'Number of Spoken Languages');
    FOR r_countries IN cur_countries LOOP
        DBMS_OUTPUT.PUT_LINE (RPAD(r_countries.country_name, v_pad) || ' | ' || r_countries.COUNT);
        v_count := cur_countries%ROWCOUNT;
    END LOOP;
    DBMS_OUTPUT.PUT_LINE(RPAD('Total', v_pad)|| ' | ' || v_count);
END;


