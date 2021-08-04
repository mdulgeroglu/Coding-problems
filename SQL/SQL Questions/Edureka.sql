
-- Write a query to fetch the EmpFname from the EmployeeInfo table in the upper case and use the ALIAS name as EmpName.

SELECT UPPER(EmpFname) AS "EmpName"
FROM EmployeeInfo;

SELECT UPPER(EmpFname) AS EmpName
FROM EmployeeInfo;


-- Write a query to fetch the number of employees working in the department ‘HR’.

SELECT COUNT(EmpID)
FROM EmployeeInfo
WHERE department = 'HR';

SELECT COUNT(*)
FROM EmployeeInfo
WHERE Department = 'HR';


-- Write a query to get the current date.

SELECT SYSDATE;
(FROM DUAL)

SELECT GETDATE();


-- Write a query to retrieve the first four characters of  EmpLname from the EmployeeInfo table.

SELECT SUBSTRING(EmpLname, 4)
FROM EmployeeInfo

SELECT SUBSTRING(EmpLname, 1, 4)
FROM EmployeeInfo;

-- Write a query to fetch only the place name(string before brackets) from the Address column of EmployeeInfo table.

SELECT (Address)
FROM EmployeeInfo

SELECT SUBSTRING(Address, 1, CHARINDEX('(',Address))
FROM EmployeeInfo;


-- Write a query to create a new table that consists of data and structure copied from the other table.

CREATE TABLE tab2 AS
(SELECT *
 FROM EmployeeInfo);

SELECT * INTO NewTable FROM EmployeeInfo WHERE 1 = 0;
CREATE TABLE NewTable AS SELECT * FROM EmployeeInfo;


-- Write q query to find all the employees whose salary is between 50000 to 100000.
SELECT ei.EmpId, (ei.EmpFname || ei.EmpLname), ep.salary
FROM EmployeeInfo ei JOIN EmployeePosition ep ON ei.EmpID = ep.EmpId
WHERE ep.salary BETWEEN 50000 AND 10000;

SELECT *
FROM EmployeePosition
WHERE Salary BETWEEN '50000' AND '100000';


-- Write a query to find the names of employees that begin with ‘S’
SELECT EmpFname
FROM EmployeeInfo
WHERE EmpFname LIKE 'S%'

SELECT *
FROM EmployeeInfo
WHERE EmpFname LIKE 'S%';


-- Write a query to fetch top N records.
SELECT TOP N *
FROM EmployeeInfo
-- LIMIT N
-- WHERE ROWNUM = N
**ORDER BY col;

SELECT TOP N *  FROM EmployeePosition   ORDER BY Salary DESC;
SELECT *        FROM EmpPosition        ORDER BY Salary DESC LIMIT N;


-- 10 Write a query to retrieve the EmpFname and EmpLname in a single column as “FullName”. The first name and the last name must be separated with space.
SELECT (EmpFname || " " || EmpLname) **AS
FROM EmployeeInfo

SELECT CONCAT(EmpFname, ' ', EmpLname) **AS 'FullName'
FROM EmployeeInfo;


-- 11 Write a query find number of employees whose DOB is between 02/05/1970 to 31/12/1975 and are grouped according to gender
SELECT COUNT(EmpId)
FROM EmployeeInfo
WHERE DOB BETWEEN TO_DATE('02-05-1970', 'DD-MM-YYYY') AND TO_DATE('31-12-1975', 'DD-MM-YYYY');
--WHERE DOB > '1970-05-02' AND DOB < '1975-12-31';
** GROUP BY gender

SELECT COUNT(*), Gender
FROM EmployeeInfo
WHERE DOB BETWEEN '02/05/1970 ' AND '31/12/1975'
GROUP BY Gender;

-- 12 Write a query to fetch all the records from the EmployeeInfo table ordered by EmpLname in descending order and Department in the ascending order.
SELECT *
FROM EmployeeInfo
ORDER BY EmpLname DESC, Department ASC;

SELECT *
FROM EmployeeInfo
ORDER BY EmpFname desc, Department asc;


-- 13 Write a query to fetch details of employees whose EmpLname ends with an alphabet ‘A’ and contains five alphabets.
SELECT *
FROM EmployeeInfo
WHERE UPPER(EmpLname) LIKE '____A';

SELECT *
FROM EmployeeInfo
WHERE EmpLname LIKE '____a';


-- 14 Write a query to fetch details of all employees excluding the employees with first names, “Sanjay” and “Sonia” from the EmployeeInfo table.
SELECT *
FROM EmployeeInfo
WHERE EmpLname NOT LIKE 'Sanjay' AND EmpLname NOT LIKE 'Sonia';

SELECT * FROM EmployeeInfo WHERE EmpFname NOT IN ('Sanjay','Sonia');


-- 15 Write a query to fetch details of employees with the address as “DELHI(DEL)”.
SELECT *
FROM EmployeeInfo
WHERE Address LIKE 'Delhi(DEL)';l

SELECT *
FROM EmployeeInfo
WHERE Address LIKE 'DELHI(DEL)%';


-- 16 Write a query to fetch all employees who also hold the managerial position.

SELECT ei.EmpId, ep.EmpPosition
FROM EmployeeInfo ei JOIN EmployeePosition ep ON ei.EmpID = ep.EmpId
WHERE ep.EmpPosition LIKE 'Manager';

SELECT E.EmpFname, E.EmpLname, P.EmpPosition
FROM EmployeeInfo E INNER JOIN EmployeePosition P ON
E.EmpID = P.EmpID AND P.EmpPosition IN ('Manager');


-- 17 Write a query to fetch the department-wise count of employees sorted by department’s count in ascending order.
SELECT department, COUNT(EmpId) AS "Employees"
FROM EmployeeInfo
GROUP BY department
ORDER BY Employees ASC;

SELECT Department, count(EmpID) AS EmpDeptCount
FROM EmployeeInfo
GROUP BY Department
ORDER BY EmpDeptCount ASC;

-- 18 Write a query to calculate the even and odd records from a table.
SELECT
  (SELECT COUNT(id) FROM testtab2 WHERE MOD(id, 2) = 0 ) AS "Even",
  (SELECT COUNT(id) FROM testtab2 WHERE MOD(id, 2) = 1 ) AS "Odd"
(FROM DUAL)

-- Rownum is better
SELECT
(SELECT COUNT(rn) AS "Even" FROM (SELECT rownum rn from testtab2) WHERE MOD(rn,2) = 0) AS "Even",
(SELECT COUNT(rn) AS "Odd" FROM (SELECT rownum rn from testtab2) WHERE MOD(rn,2) = 1) AS "Odd"
FROM DUAL

-- mysql?
SELECT EmpID FROM (SELECT rowno, EmpID from EmployeeInfo) WHERE MOD(rowno,2)=0;


-- 19 Write a SQL query to retrieve employee details from EmployeeInfo table who have a date of joining in the EmployeePosition table.

SELECT ei.EmpID, DateOfJoining
FROM EmployeeInfo ei JOIN EmployeePosition ep ON ei.EmpID = ep.EmpID




-- 20 Write a query to retrieve two minimum and maximum salaries from the EmployeePosition table.
SELECT MIN(Salary), MAX(Salary)
FROM EmployeePosition



-- 21 Write a query to find the Nth highest salary from the table without using TOP/limit keyword.
SELECT *
FROM EmployeePosition
ORDER BY salary
OFFSET 5;

SELECT Salary
FROM EmployeePosition E1
WHERE N-1 = (
      SELECT COUNT( DISTINCT ( E2.Salary ) )
      FROM EmployeePosition E2
      WHERE E2.Salary >  E1.Salary );


-- 22 Write a query to retrieve duplicate records from a table.
-- SELECT *
-- FROM EmployeePosition e1 JOIN EmployeePosition e2 ON e1.EmpID = e2.EmpID
-- WHERE   e1.EmpID != e2.EmpID
-- AND     e1.EmpPosition = e2.EmpPosition
-- AND     e1.DateOfJoining = e2.DateOfJoining
-- AND     e1.Salary = e2.Salary

SELECT EmpID, EmpPosition, DateOfJoining, Salary, COUNT(*)
FROM EmployeePosition
GROUP BY EmpID, EmpPosition, DateOfJoining, Salary
HAVING COUNT(*) > 1;

-- 23. Write a query to retrieve the list of employees working in the same department.


Select DISTINCT E.EmpID, E.EmpFname, E.Department
FROM EmployeeInfo E, EmployeeInfo E1
WHERE E.Department = E1.Department AND E.EmpID != E1.EmpID;


-- 24

WITH q1 AS(
    SELECT *
    FROM EmployeeInfo
    WHERE EmpID = (
        SELECT MIN(EmpID)
        FROM EmployeeInfo)),
    q2 AS(
    SELECT *
    FROM EmployeeInfo
    WHERE EmpID = (
        SELECT MAX(EmpID)
        FROM EmployeeInfo))
SELECT * FROM q1
UNION
SELECT * FROM q2



-- 28

SELECT COUNT(EmpID) EmployeeCount, department
FROM EmployeeInfo
GROUP BY department
HAVING COUNT(EmpID) <= 1








============================================

CREATE TABLE EmployeeInfo (
    EmpID       NUMBER(5),
    EmpFname    VARCHAR(12),
    EmpLname    VARCHAR(12),
    Department  VARCHAR(12),
    Project     VARCHAR(2),
    Address     VARCHAR(18),
    DOB         DATE,
    Gender      CHAR(1)
);

INSERT INTO EmployeeInfo VALUES (1, 'Sanjay', 'Mehra', 'HR', 'P1', 'Hyderabad(HYD)', TO_DATE('1-12-1976', 'MM-DD-YYYY'), 'M');
INSERT INTO EmployeeInfo VALUES (2, 'Ananya', 'Mishra', 'Admin', 'P2', 'Delhi(DEL)', TO_DATE('2-5-1968', 'MM-DD-YYYY'), 'F');
INSERT INTO EmployeeInfo VALUES (3, 'Rohan', 'Diwan', 'Account', 'P3', 'Mumbai(BOM)', TO_DATE('1-1-1980', 'MM-DD-YYYY'), 'M');
INSERT INTO EmployeeInfo VALUES (4, 'Sonia', 'Kulkarni', 'HR', 'P1', 'Hyderabad(HYD)', TO_DATE('2-5-1992', 'MM-DD-YYYY'), 'F');
INSERT INTO EmployeeInfo VALUES (5, 'Ankit', 'Kapoor', 'Admin', 'P2', 'Delhi(DEL)', TO_DATE('3-7-1994', 'MM-DD-YYYY'), 'M');


CREATE TABLE EmployeePosition (
    EmpID NUMBER(5),
    EmpPosition     VARCHAR(18),
    DateOfJoining   DATE,
    Salary          NUMBER(10)
);

INSERT INTO EmployeePosition VALUES (1, 'Manager', TO_DATE('1/5/2019', 'MM-DD-YYYY'), 500000);
INSERT INTO EmployeePosition VALUES (2, 'Executive', TO_DATE('2/5/2019', 'MM-DD-YYYY'), 75000);
INSERT INTO EmployeePosition VALUES (3, 'Manager', TO_DATE('1/5/2019', 'MM-DD-YYYY'), 90000);
INSERT INTO EmployeePosition VALUES (2, 'Lead', TO_DATE('2/5/2019', 'MM-DD-YYYY'), 85000);
INSERT INTO EmployeePosition VALUES (1, 'Executive', TO_DATE('1/5/2019', 'MM-DD-YYYY'), 300000);
























