@lab5_3.SQL

/*
2. Write a PL/SQL block to display the country name and the area of each country in a chosen
region. The region_id should be passed to the cursor as a parameter. Test your block using two
region_ids: 5 (South America) and 30 (Eastern Asia). Do not use a cursor FOR loop.
*/


DECLARE
    CURSOR cur_countries (v_region countries.region_id%TYPE) IS
        SELECT country_name, area, region_id
        FROM countries
        WHERE region_id = v_region;
    r_countries     cur_countries%ROWTYPE;
BEGIN
    OPEN cur_countries (5);
        LOOP
            FETCH cur_countries INTO r_countries;
            EXIT WHEN cur_countries%NOTFOUND;
            DBMS_OUTPUT.PUT_LINE(r_countries.region_id|| ' : ' || r_countries.country_name || ' : ' || r_countries.area);
        END LOOP;
    CLOSE cur_countries;

    OPEN cur_countries (143);
        LOOP
            FETCH cur_countries INTO r_countries;
            EXIT WHEN cur_countries%NOTFOUND;
            DBMS_OUTPUT.PUT_LINE(r_countries.region_id|| ' : ' || r_countries.country_name || ' : ' || r_countries.area);
        END LOOP;
    CLOSE cur_countries;
END;

