/* 
The following code is supposed to display the lowest and highest elevations for a country name entered by the user. However, the code does not work. Fix the code by following the guidelines for retrieving data that you learned in this lesson.

DECLARE
    v_country_name wf_countries.country_name%TYPE
    := ‘United States of America’;
    v_lowest_elevation wf_countries.lowest_elevation%TYPE;
    v_highest_elevation wf_countries.highest_elevation%TYPE;
BEGIN
    SELECT lowest_elevation, highest_elevation
    FROM wf_countries;
    DBMS_OUTPUT.PUT_LINE('The lowest elevation in'||country_name||' is '||v_lowest_elevation ||’ and the highest elevation is '||v_highest_elevation||'.');
END; 
*/

DECLARE
    v_country_name          countries.country_name%TYPE          := 'United States of America';
    v_lowest_elevation      countries.lowest_elevation%TYPE;
    v_highest_elevation     countries.highest_elevation%TYPE;
BEGIN
    SELECT lowest_elevation, highest_elevation
    INTO v_lowest_elevation, v_lowest_elevation
    FROM countries
    WHERE country_name = v_country_name;
    DBMS_OUTPUT.PUT_LINE('The lowest elevation in ' || v_country_name || ' is ' || v_lowest_elevation || ' and the highest elevation is ' || v_highest_elevation);
END; 