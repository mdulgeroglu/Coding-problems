/* 2. Modify the following PL/SQL block so that it uses a cursor FOR loop. Keep the explicit cursor declaration in the DECLARE section. Test your changes.
DECLARE
    CURSOR countries_cur IS
    SELECT country_name, national_holiday_name, national_holiday_date
    FROM countries
    WHERE region_id = 5;
    countries_rec countries_cur%ROWTYPE;
BEGIN
    OPEN countries_cur;
    LOOP
    FETCH countries_cur INTO countries_rec;
    EXIT WHEN countries_cur%NOTFOUND;
    DBMS_OUTPUT.PUT_LINE ('Country: ' || countries_rec.country_name || ' National holiday: '|| countries_rec.national_holiday_name || ', held on: '|| countries_rec.national_holiday_date);
    END LOOP;
    CLOSE countries_cur;
END;

*/

DECLARE
    CURSOR countries_cur IS
        SELECT country_name, national_holiday_name, national_holiday_date
        FROM countries
        WHERE region_id = 5;
BEGIN
    FOR countries_rec IN countries_cur LOOP
        DBMS_OUTPUT.PUT_LINE ('Country: ' || countries_rec.country_name || ' National holiday: '|| countries_rec.national_holiday_name || ', held on: '|| countries_rec.national_holiday_date);
    END LOOP;
END;

/*
3. Modify your answer to question 2 to declare the cursor using a subquery in the FOR…LOOP
statement, rather than in the declaration section. Test your changes again.
*/

BEGIN
    FOR countries_rec
    IN (SELECT country_name, national_holiday_name, national_holiday_date
        FROM countries
        WHERE region_id = 5)
    LOOP
    DBMS_OUTPUT.PUT_LINE ('Country: ' || countries_rec.country_name || ' National holiday: '|| countries_rec.national_holiday_name || ', held on: '|| countries_rec.national_holiday_date);
    END LOOP;
END;


/*
4. Using the COUNTRIES table, write a cursor that returns countries with a highest_elevation greater
than 8,000 m. For each country, display the country_name, highest_elevation, and climate. Use a
cursor FOR loop, declaring the cursor using a subquery in the FOR…LOOP statement.
*/

BEGIN
    FOR countries_rec IN (
        SELECT country_name, highest_elevation, climate FROM countries WHERE highest_elevation > 8000) LOOP
        DBMS_OUTPUT.PUT_LINE ('Country: ' || RPAD(countries_rec.country_name, 28) || ' | ' || 'Highest Elevation: '|| RPAD(countries_rec.highest_elevation, 4) || ' | ' || 'Climate: '|| countries_rec.climate);
    END LOOP;
END;





















