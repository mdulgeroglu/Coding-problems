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
The statment is successfully processed and the result is "Region: 29 is: Caribbean".
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



/* 8.Enter and run the following PL/SQL code. What output is displayed, and why? Save your code.
The result is:
Lorentz
King
first the employees last name with id 100 is assigned to v_last_name. Then the inner block is run and the employees last name with id 107 is assigned into v_last_name and printed (this is within the scope of the inner block). Then the outer block v_last_name is printed. The two v_last_name variables have different scope.

DECLARE
    v_last_name employees.last_name%TYPE;
BEGIN
    SELECT last_name INTO v_last_name
    FROM employees
    WHERE employee_id = 100;
    /* This employee’s last name is King */

    DECLARE
        v_last_name employees.last_name%TYPE;
    BEGIN
        SELECT last_name INTO v_last_name
        FROM employees
        WHERE employee_id = 107;
        /* This employee’s last name is Lorentz */
        DBMS_OUTPUT.PUT_LINE(v_last_name);
    END;

    DBMS_OUTPUT.PUT_LINE(v_last_name);
END;
*/


/* 9.In your own words, list the benefits of subprograms.
Subprograms allow you to break a program into smaller modules. They are similar to functions and can serve your needs when you are writing complex statements.

10.In your own words, describe what a stored procedure is.
A procedure is similar to a class where you can write code and save it to use in the future. It can also be useful if you have repetitive tasks. You can pass parameters to a procedure and it will return what you defined back to you.
*/

/* 11. The remaining questions in this practice use a copy of the employees table.
A.Create the copy by executing the following SQL statement:
CREATE TABLE employees_dup AS SELECT * from employees;

B.Create the following procedure in Application Express:
CREATE OR REPLACE PROCEDURE name_change IS
BEGIN
UPDATE employees_dup
SET first_name = 'Susan'
WHERE department_id = 60;
END name_change;

C.Save the definition of your procedure in case you need to modify it later. In the “Save SQL” popup, name your saved work “My name change procedure”.

D.Execute the procedure by running the following anonymous block:
BEGIN
name_change;
END;
*/

12.
SELECT from the table to check that the procedure has executed correctly and performed the UPDATE:
Create a second procedure named pay_raise which changes the salary of all employees in employees_dup to a new value of
30000. Execute the procedure from anonymous block, then SELECT from the table to check that procedure has executed correctly.
*/








