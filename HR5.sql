SELECT w.employee_id , w.last_name worker, w.salary,m.manager_id,m.last_name manager,m.salary "Manager Salary"
    FROM employees w JOIN employees m
     ON w.manager_id=m.employee_id
        ORDER BY w.employee_id;
--        SELF JOIN in a table

SELECT e.employee_id, e.last_name, e.department_id, d.department_name
    FROM employees e RIGHT OUTER JOIN departments d
        ON (e.department_id=d.department_id)
            ORDER BY e.employee_id;
--  Right Outer join (departments tables)            

SELECT e.employee_id, e.last_name, e.department_id, d.department_name
    FROM employees e LEFT OUTER JOIN departments d
        ON (e.department_id=d.department_id)
            ORDER BY e.employee_id;
--                        Left Outer Join (employees table)


SELECT e.employee_id, e.last_name, e.department_id, d.department_name
    FROM employees e FULL OUTER JOIN departments d
        ON (e.department_id=d.department_id)
            ORDER BY e.employee_id;
            --      Full Outer Join  


SELECT e.employee_id, e.last_name, e.department_id, d.department_name
    FROM employees e CROSS JOIN departments d
            ORDER BY e.employee_id;
            
SELECT last_name, employee_id, hire_date
    FROM employees
        WHERE hire_date> 
                        (SELECT hire_date
                                    FROM employees
                                            WHERE last_name= 'De Haan')
            FETCH FIRST 1 ROW ONLY;
--              Fetch 1st person who was hired after De Haan using subquries.

SELECT last_name, job_id, salary
    FROM employees
        WHERE job_id =
                        (SELECT job_id
                            FROM employees
                                WHERE last_name='Davies')
        AND salary> (SELECT salary
                        FROM employees
                            WHERE last_name='Davies'); 
--          Find people who work in same JOB OR POSITION  with Davies but get more salary                            
                            
        SELECT last_name, job_id, salary
            FROM employees
                WHERE last_name='Davies';
--                  Davies salary

SELECT first_name, department_id, salary
    FROM employees
        WHERE (salary, department_id) 
            IN (SELECT MIN(salary),department_id
                    FROM employees
                        GROUP BY department_id)
        ORDER BY department_id;
--  Find people with minimum salary from all department
SELECT employee_id, last_name,job_id,salary
    FROM employees
        WHERE salary < ANY
                            (SELECT salary
                                FROM employees
                                    WHERE job_id='IT_PROG')
            AND job_id <> 'IT_PROG'; 
--        Find people not It programmer and get less salary than IT Programmer.
--  ANY means match just one value so output salary has to be < 9000,6000,4800,4200.
--but salary < 9000 will works, as just satisfying one condition is enough.            
            
SELECT employee_id, last_name,job_id,salary
    FROM employees
        WHERE salary < ALL
                            (SELECT salary
                                FROM employees
                                    WHERE job_id='IT_PROG')
            AND job_id <> 'IT_PROG';              
--          Find people not It programmers and get less salary than IT Programmers.
--  All means match all value so output salary has to be < 9000,6000,4800,4200. so salary < 4200 will satisfy all conditions.
SELECT salary
     FROM employees
        WHERE job_id='IT_PROG';
--      IT Programmers salary        

--      QUERIES Questions solve
SELECT *
    FROM employees
        WHERE salary=3000
            OR employee_id=121;


SELECT *
    FROM employees
        WHERE salary=3000
            AND manager_id=121;
--Q07       
SELECT *
    FROM employees
        WHERE employee_id IN(134,159,183);
--Q08
SElECT *
    FROM employees
        WHERE salary BETWEEN 1000 AND 3000
                ORDER BY salary;
--Q09
SELECT *
    FROM employees
        WHERE salary <=2500
            ORDER BY salary;
-- Q10
SELECT *
    FROM employees
        WHERE manager_id Not BETWEEN 100 AND 200
            ORDER BY salary;
--Q11
SELECT *
    FROM employees
        ORDER BY salary desc
         OFFSET 1 ROW FETCH NEXT 2 ROW ONLY;
         
SELECT *
    FROM employees
        WHERE salary = (SELECT MAX(salary)
                            FROM employees
                                WHERE salary<(SELECT MAX(salary)
                            FROM employees
                                    WHERE salary<(SELECT MAX(salary)
                            FROM employees)))
            ORDER BY salary desc ;
--          THIRD HIghest salary  
SELECT *
    FROM employees
        WHERE salary = (SELECT MAX(salary)
                            FROM employees
                                WHERE salary<(SELECT MAX(salary)
                            FROM employees
                                WHERE salary<(SELECT MAX(salary)
                            FROM employees
                                    WHERE salary<(SELECT MAX(salary)
                            FROM employees))))
            ORDER BY salary desc ;
--              Fourth highest salary
SELECT *
    FROM employees
        WHERE salary = (SELECT MAX(salary)
                            FROM employees
                                WHERE salary<(SELECT MAX(salary)
                            FROM employees
                                ))
            ORDER BY salary desc ;
--          SECOND highest salary

--Q12

SELECT first_name, last_name, hire_date
    FROM employees
        WHERE department_id=(SELECT department_id
                                FROM employees
                                    WHERE first_name='Clara')
            AND first_name!='Clara' ;
--Q13 link: https://www.w3resource.com/sql-exercises/sql-subqueries-exercises.php
SELECT employee_id, first_name, last_name, department_id
    FROM employees
        WHERE first_name LIKE '%T%';
        
SELECT employee_id, first_name, last_name, department_id
    FROM employees
        WHERE department_id IN(SELECT department_id
                                FROM employees
                                    WHERE first_name LIKE '%T%');
--Q14
SELECT employee_id, first_name, last_name
    FROM employees
        WHERE salary>(SELECT AVG(salary)
                        FROM employees)
            AND department_id IN(SELECT department_id
                                    FROM employees
                                        WHERE first_name LIKE '%J%');           
--Q15
SELECT e.first_name, e.last_name, e.employee_id, e.job_id,l.city
    FROM employees e
        JOIN departments d
                ON(e.department_id=d.department_id)
                JOIN locations l
                ON (d.location_id=l.location_id)
        WHERE l.city='Toronto';        





            


































            
            