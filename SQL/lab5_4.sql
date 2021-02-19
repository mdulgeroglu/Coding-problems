@lab5_3.SQL

/* 2. Write a PL/SQL block to display the country name and the area of each country in a chosen
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


/* 3. Modify your answer to question 2 to use a cursor FOR loop. You must still declare the cursor
explicitly in the DECLARE section. Test it again using regions 5 and 30.
*/
DECLARE
    CURSOR cur_countries (v_region countries.region_id%TYPE) IS
        SELECT country_name, area, region_id
        FROM countries
        WHERE region_id = v_region;
BEGIN
    FOR r_countries IN cur_countries (5) LOOP
        DBMS_OUTPUT.PUT_LINE(r_countries.region_id|| ' : ' || r_countries.country_name || ' : ' || r_countries.area);
    END LOOP;

    FOR r_countries IN cur_countries (143) LOOP
        DBMS_OUTPUT.PUT_LINE(r_countries.region_id|| ' : ' || r_countries.country_name || ' : ' || r_countries.area);
    END LOOP;
END;


/* 4. Modify your answer to question 3 to display the country_name and area of each country in a
chosen region that has an area greater than a specific value. The region_id and specific area
should be passed to the cursor as two parameters. Test your block twice using region_id 5 (South
America): the first time with area = 200000 and the second time with area = 1000000.
*/
DECLARE
    CURSOR cur_countries (v_region countries.region_id%TYPE, v_area countries.area%TYPE ) IS
        SELECT country_name, area
        FROM countries
        WHERE region_id = v_region AND area > v_area;
BEGIN
    FOR r_countries IN cur_countries (5, 1000000) LOOP
        DBMS_OUTPUT.PUT_LINE(r_countries.country_name || ' : ' || r_countries.area);
    END LOOP;
END;


/* 5. Modify your answer to question 4 to fetch and display two sets of countries in a single execution of
the block. You should open and close the cursor twice, passing different parameter values to it
each time. Before each set of output rows, display the message “Region: <region_id> Minimum
Area: <area>”., for example “Region: 5 Minimum Area: 200000”. Test your changes using (5,
200000) and (30, 500000).
*/
DECLARE
    CURSOR cur_countries (v_region countries.region_id%TYPE, v_area countries.area%TYPE ) IS
        SELECT country_name, area
        FROM countries
        WHERE region_id = v_region AND area > v_area;
BEGIN
    DBMS_OUTPUT.PUT_LINE('Region: 5, Minimum Area: 200000');
    DBMS_OUTPUT.PUT_LINE('-------------------------------');
    FOR r_countries IN cur_countries (5, 200000) LOOP
        DBMS_OUTPUT.PUT_LINE(RPAD(r_countries.country_name, 35) || ' : ' || r_countries.area);
    END LOOP;

    DBMS_OUTPUT.PUT_LINE('Region: 30, Minimum Area: 500000');
    DBMS_OUTPUT.PUT_LINE('--------------------------------');
    FOR r_countries IN cur_countries (30, 500000) LOOP
        DBMS_OUTPUT.PUT_LINE(RPAD(r_countries.country_name, 35) || ' : ' || r_countries.area);
    END LOOP;
END;
