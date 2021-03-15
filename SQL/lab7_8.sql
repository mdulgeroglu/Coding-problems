/*
1.What happens when Oracle encounters a runtime problem while executing a PL/SQL block?
The normal operation of the  program is stopped. An exception occurs and either an internal defined or user defined error is handled.

2.What do you need to add to your PL/SQL block to address these problems?
You need to include exception handlers to trap the errors so that the program does not completely fail when there is an error.

3.List three advantages of handling exceptions within a PL/SQL block.
a. Protects the user from errors. default error messages are usually unhelful to the user.
b. Protects the database. Data can be lost or overwritten.
c. Saves time and money. If the user can see a helpful message and resovles the problem by themselves, they don't have to ask for help.
'


4.Run this PL/SQL code and then answer the questions that follow.
DECLARE
    v_jobid employees.job_id%TYPE;
BEGIN
    SELECT job_id
    INTO v_jobid
    FROM employees
    WHERE department_id = 80;
END;

A.What happens when you run the block?
Returns error "ORA-01422: exact fetch returns more than requested number of rows"

B.In your own words, explain what you can do to fix this problem.
The SQL statment returns more than 1 row to assign to v_jobid.

C.Modify the code to fix the problem. Use a TOO_MANY_ROWS exception handler.
DECLARE
    v_jobid employees.job_id%TYPE;
BEGIN
    SELECT job_id
    INTO v_jobid
    FROM employees
    WHERE department_id = 80;
EXCEPTION
    WHEN TOO_MANY_ROWS THEN
        DBMS_OUTPUT.PUT_LINE('Error: Too many rows!');
END;

D.Run your modified code. What happens this time?
The exception TOO_MANY_ROWS is thrown and the error message is displayed.


5.What are the three types of exceptions that can be handled in a PL/SQL block?
a. Predefined error. Default errors that are already defined by oracle.
b. Non-predefined error. These are errors that have error numbers and error messages but you need to declare them with your own names.
c. User-defined error. These are custom errors that you can define and use based on your specific needs.

6.What is the difference in how each of these three types of exception is handled in the PL/SQL block?
Predefined errors have predefined exceptions by oracle you dont need to declare them. Non-predefined errors have predefined codes and messages but you must declare them with a name that you choose. User-defined errors need to be declared and defined by you.

*/


/*
7.Enter and run the following PL/SQL block. Look at the output and answer the following questions:
DECLARE
    v_number NUMBER(6,2) := 100;
    v_region_id regions.region_id%TYPE;
    v_region_name regions.region_name%TYPE;
BEGIN
    SELECT region_id, region_name INTO v_region_id, v_region_name
    FROM regions
    WHERE region_id = 1;
    DBMS_OUTPUT.PUT_LINE('Region: ' || v_region_id || ' is: ' || v_region_name);
END;
A.What error message is displayed and why ?
ORA-01403: no data found

B.Modify the block to handle this exception and re-run your code. Now what happens and why?
The
DECLARE
    v_number NUMBER(6,2) := 100;
    v_region_id regions.region_id%TYPE;
    v_region_name regions.region_name%TYPE;
BEGIN
    SELECT region_id, region_name INTO v_region_id, v_region_name
    FROM regions
    WHERE region_id = 1;
    DBMS_OUTPUT.PUT_LINE('Region: ' || v_region_id || ' is: ' || v_region_name);
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Error: No data found.');
END;

C.Modify the block again to change the WHERE clause to region_id = 29. Re-run the block. Now what happens and why?
DECLARE
    v_number NUMBER(6,2) := 100;
    v_region_id regions.region_id%TYPE;
    v_region_name regions.region_name%TYPE;
BEGIN
    SELECT region_id, region_name INTO v_region_id, v_region_name
    FROM regions
    WHERE region_id = 29;
    DBMS_OUTPUT.PUT_LINE('Region: ' || v_region_id || ' is: ' || v_region_name);
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Error: No data found.');
END;
*/






















