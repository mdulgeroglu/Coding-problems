/* 1. Function full_name:
A. Create a function called full_name. Pass two parameters to the function: an employee’s last name and first name. The function should return the full name in the format: last name, comma and space, first name (for example: Smith, Joe). Save your code.
CREATE OR REPLACE FUNCTION full_name
    (p_first_name   IN  VARCHAR2,
    p_last_name     IN  VARCHAR2)
RETURN VARCHAR2 IS
BEGIN
    RETURN p_last_name ||  ', '   || p_first_name;
END;


B.Test your function from an anonymous block which uses a local variable to store and display the returned value.
DECLARE
    v_full_name VARCHAR2 :=  full_name('Muhammed', 'Dulgeroglu');
BEGIN
    DBMS_OUTPUT.PUT_LINE('The full name is: ' || v_full_name);
END;


C.Modify your anonymous block from step b to remove the local variable declaration and call the function directly from within the DBMS_OUTPUT.PUT_LINE call. Test the block again.
BEGIN
    DBMS_OUTPUT.PUT_LINE('The full name is: ' || full_name('Muhammed', 'Dulgeroglu'));
END;

D.Now call the function from within a SQL SELECT statement. Execute a SQL statement (not a PL/SQL block) which displays the first_name, last_name and full name (using the function) of all employees in department 50. Your output should look like this:+
SELECT first_name, last_name, full_name(first_name, last_name)
FROM employees
WHERE department_id = 50;
*/



2. Function divide:
A. Create a function called divide that accepts two numbers as input and returns the result of dividing the first number by the second number, rounded to two decimal places. Save your code.
CREATE OR REPLACE FUNCTION f_divide
   (p_number1  IN  PLS_INTEGER,
    p_number2  IN  PLS_INTEGER)
RETURN NUMBER IS
BEGIN
    RETURN ROUND(p_number1/p_number2, 2);
END;


B. Test your function twice from an anonymous block using input values (50,2) and (25,3).
BEGIN
    DBMS_OUTPUT.PUT_LINE(f_divide(25,3));
END;


C. Test your function a third time using input values (16,0). What happens?
BEGIN
    DBMS_OUTPUT.PUT_LINE(f_divide(16,0));
END;
“divisor is equal to zero” error is displayed.


D. Modify the function code to trap the ZERO_DIVIDE exception. The exception handler should return a value of zero from the function if ZERO_DIVIDE is raised.
CREATE OR REPLACE FUNCTION f_divide
   (p_number1  IN  PLS_INTEGER,
    p_number2  IN  PLS_INTEGER)
RETURN NUMBER IS
BEGIN
    RETURN ROUND(p_number1/p_number2, 2);
EXCEPTION
    WHEN ZERO_DIVIDE THEN
        RETURN 0;
END;


E. Test your function again using input values (16,0) as before. Now what happens?
BEGIN
    DBMS_OUTPUT.PUT_LINE(f_divide(16,0));
END;
The exception is caught and the function returns 0.


3. List four major differences between a procedure and a function.
	1. Functions must have a RETURN clause, procedures do not.
	2. Functions must return a single value, procdures can have zero, one, or more output params.
	3. Functions are invoked as a part of an expression e.g., SELECT statements; procedures can be executed as a        standalone block.
	4. Functions cannot use DML or DDL commands.

4. Write a query to show all functions and procedures to which you have access. Include the owner of the object as well.
SELECT object_name, object_type, oracle_maintained
FROM USER_OBJECTS
WHERE object_type LIKE 'FUNCTION' OR object_type LIKE 'PROCEDURE'
ORDER BY object_type;


5. If you wanted user SUSAN to be able to execute SELECT and all DML statements on your wf_countries table, what SQL statement would you execute to give her the required privileges?
GRANT SELECT, INSERT, UPDATE, DELETE
ON countries TO SUSAN;


6. Another user TOM creates a table called tomtab, and does not grant you any privileges on it.
A. If you try to execute the following statement, will it work?
INSERT INTO tom.tomtab (….) VALUES (…..);
It will not work because TOM needs to grant INSERT on the table to anyone who wants to use INSERT.

B. Examine the following code. Now the INSERT statement has been included in a procedure which you have created. Will it work now?
CREATE OR REPLACE PROCEDURE my_ins_proc
IS
BEGIN
INSERT into tom.tomtab (….)
VALUES (……);
END;
It will not work unless tom grants me INSERT on his table or he creates the procedure and grants me EXECUTE.

C. TOM now executes the following statement:
GRANT INSERT ON tomtab TO <your user name>;
Will your my_ins_proc procedure work now? Why or why not?
Yes it will work because he granted me INSERT on his table.

D. TOM now REVOKEs your INSERT privilege on tomtab. TOM then writes the following procedure. Which privilege must TOM grant to you to allow you to execute the procedure? With this privilege, will your INSERT work now?
CREATE OR REPLACE PROCEDURE tom_ins_proc
IS
BEGIN
INSERT into tom.tomtab (….)
VALUES (……);
END;
He needs to grant me EXECUTE on tom_ins_proc. Yes it will work because TOM is creating a procedure for his own table which he is granting me EXECUTE for.

















