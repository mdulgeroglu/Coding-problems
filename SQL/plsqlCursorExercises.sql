-- PL/SQL Cursor Exercises

-- Display country name, and language names for each country. Use the tables countries, spoken_languages, and languages. Run the query for country id 5 and 143. Use nested Cursors using Cursor FOR Loops.

DECLARE
    v_var countries.country_id%TYPE := 0;
    CURSOR cur_countries IS
        SELECT country_id, country_name
        FROM countries
        WHERE country_id IN (27, 20);
        
    CURSOR cur_language IS
        SELECT *
        FROM spoken_languages sle JOIN languages lge
        ON (sle.language_id = lge.language_id)
        WHERE country_id = v_var;
BEGIN
    FOR r_countries IN cur_countries LOOP
        DBMS_OUTPUT.PUT_LINE('Country: ' || r_countries.country_name);
        v_var := r_countries.country_id;
        
        DBMS_OUTPUT.PUT_LINE('Spoken languages: ');
        FOR r_languages IN cur_language LOOP
            DBMS_OUTPUT.PUT_LINE(r_languages.language_name);
        END LOOP;
    END LOOP;
END;
