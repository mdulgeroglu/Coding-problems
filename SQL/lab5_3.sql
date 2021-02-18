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


























