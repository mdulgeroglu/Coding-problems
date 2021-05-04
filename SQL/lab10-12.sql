/*
2.Create the specification for the check_emp_pkg which you studied in this lesson. The specification should declare a constant and two procedures, as follows:
g_max_length_of_service, datatype NUMBER, initialized to 100
chk_hiredate with one input parameter having the same datatype as employees.hire_date
chk_dept_mgr with two input parameters having the same datatypes as employees.employee_id and employees.manager_id.

CREATE OR REPLACE PACKAGE check_emp_pkg
IS
    g_max_length_of_service CONSTANT NUMBER:= 100;
    PROCEDURE chk_hiredate;
        (p_date     IN employees.hire_date%TYPE);
    PROCEDURE chk_dept_mgr
        (p_empid    IN employees.employee_id%TYPE,
         p_mgr      IN departments.manager_id%TYPE);
END check_emp_pkg;
*/

/*
3.Create the package body for check_emp_pkg. Remember that the names and parameters of the procedures in the body must be identical to those in the specification, or the body will not compile.
The code for chk_hiredate should RAISE_APPLICATION_ERROR if the employee was hired more than 100 years ago (hint: use MONTHS_BETWEEN, comparing with g_max_length_of_service * 12).
The second procedure, chk_dept_mgr, accepts two input parameters: an employee_id and a manager_id. The code should find the manager of the employee’s department and check whether this manager has the same manager_id as the second parameter. If the manager_id is the same, display a suitable “success” message; if they are different, raise an application error. Include an exception handler for NO_DATA_FOUND.

CREATE OR REPLACE PACKAGE BODY check_emp_pkg
IS
    PROCEDURE chk_hiredate
        (p_date     IN  employees.hire_date%TYPE)
    IS BEGIN
        IF MONTHS_BETWEEN(SYSDATE, p_date) > (g_max_length_of_service * 12) THEN
            RAISE_APPLICATION_ERROR(-20200, 'Invalid Hiredate')
        END IF;
    END chk_hiredate;
    PROCEDURE chk_dept_mgr
        (p_empid    IN  employees.employee_id%TYPE,
         p_mgr      IN  employees.manager_id%TYPE)
    IS
        v_dpt_id        employees.department_id%TYPE
        v_mgr_id        employees.manager_id%TYPE
    BEGIN
        SELECT department_id
        INTO v_dpt_id
        FROM employees
        WHERE employee_id = v_mgr_id;
        
        SELECT manager_id
        INTO v_mgr_id
        FROM departments
        WHERE deparment_id = v_dpt_id;
        
        IF v_mgr_id = p_mgr THEN
            DBMS_OUTPUT.PUT_LINE('success');
        EXCEPTION
            WHEN NO_DATA_FOUND THEN
                RAISE_APPLICATION_ERROR(-20201, 'This department does not exist');
    END chk_dept_mgr;
END check_emp_pkg;
*/

CREATE OR REPLACE PACKAGE BODY check_emp_pkg
IS
    PROCEDURE chk_hiredate
        (p_date     IN  employees.hire_date%TYPE)
    IS BEGIN
        IF MONTHS_BETWEEN(SYSDATE, p_date) > g_max_length_of_service * 12 THEN
            RAISE_APPLICATION_ERROR(-20200, 'Invalid Hiredate');
        END IF;
    END chk_hiredate;

    PROCEDURE chk_dept_mgr
        (p_empid    IN  employees.employee_id%TYPE,
         p_mgr      IN  employees.manager_id%TYPE)
    IS
        v_dpt_id        employees.department_id%TYPE;
        v_mgr_id        employees.manager_id%TYPE;
    BEGIN
        SELECT department_id
        INTO v_dpt_id
        FROM employees
        WHERE employee_id = v_mgr_id;
        
        SELECT manager_id
        INTO v_mgr_id
        FROM departments
        WHERE deparment_id = v_dpt_id;
        
        IF v_mgr_id = p_mgr THEN
            DBMS_OUTPUT.PUT_LINE('success');
        EXCEPTION
            WHEN NO_DATA_FOUND THEN
                RAISE_APPLICATION_ERROR(-20201, 'This department does not exist');
    END chk_dept_mgr;
END check_emp_pkg;

/*
4. Procedure chk_hiredate:
A. Test the chk_hiredate procedure using input value 17-Jan-87 (it should succeed).
BEGIN
    check_emp_pkg.chk_hiredate('17-jan-87');
END;

B. Test the chk_dept_mgr procedure twice using input values (174,149) and (174,176). The first should succeed while the second should fail.
BEGIN
    check_emp_pkg.chk_dept_mgr(174, 149);
END;
BEGIN
    check_emp_pkg.chk_dept_mgr(174, 176);
END;

*/



/*
CREATE OR REPLACE PACKAGE overload
IS
    PROCEDURE what_am_i(p_in VARCHAR2);
    PROCEDURE what_am_i(p_in NUMBER);
    PROCEDURE what_am_i(p_in DATE);
END;

CREATE OR REPLACE PACKAGE BODY overload
AS
    PROCEDURE what_am_i(p_in VARCHAR2)
    IS BEGIN
        DBMS_OUTPUT.PUT_LINE('Here I am a Varchar2');
    END what_am_i;
    PROCEDURE what_am_i(p_in NUMBER)
    IS BEGIN
        DBMS_OUTPUT.PUT_LINE('Here I am a Number');
    END what_am_i;
    PROCEDURE what_am_i(p_in DATE)
    IS BEGIN
        DBMS_OUTPUT.PUT_LINE('Here I am a Date');
    END what_am_i;
END overload;
*/




/*

*/



/*

*/






Create a package that has 3 procedures that each display the procedure name
CREATE OR REPLACE PACKAGE display_me
IS
  PROCEDURE proc1;
  PROCEDURE proc2;
  PROCEDURE proc3;
END display_me;

SELECT text
FROM user_source
WHERE UPPER(type)='PACKAGE' AND UPPER(name)='DISPLAY_ME'
ORDER BY line;

Part 2 - Create package body

CREATE OR REPLACE PACKAGE BODY display_me
IS
  /* declare variables here that global for the entire body */
PROCEDURE proc1
IS
BEGIN
  DBMS_OUTPUT.PUT_LINE('This is proc1');
END proc1;

PROCEDURE proc2 
IS
BEGIN
  DBMS_OUTPUT.PUT_LINE('This is proc2');
END proc2;

PROCEDURE proc3
IS
BEGIN
  DBMS_OUTPUT.PUT_LINE('This is proc3');
END proc3;

END display_me;


BEGIN
  display_me.proc2;
  display_me.proc1;
  display_me.proc3;
END







Working code:

Issue - see bold lines
The INTO belongs on the EXECUTE IMMEDIATE statement and cannot be part of the string.

CREATE OR REPLACE PROCEDURE counting
  (p_name VARCHAR2)
IS
  v_amount NUMBER(10,0);
  v_command VARCHAR2(300);
BEGIN
  v_command := 'SELECT COUNT(*) FROM ' || p_name ;
  EXECUTE IMMEDIATE v_command INTO v_amount ;
  DBMS_OUTPUT.PUT_LINE('There are ' || v_amount || ' rows');
END;

BEGIN
  counting('COUNTRIES');
END;