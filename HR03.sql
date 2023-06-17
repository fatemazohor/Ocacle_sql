SELECT *
    FROM employees;
    
SELECT first_name,last_name, SUBSTR(last_name,4,2)
    FROM employees;
    
SELECT SUBSTR ('HelloWorld',-5,1)
    FROM dual;

SELECT INSTR('HelloWorld','l',1,3)
    FROM dual;
    
SELECT first_name, INSTR(first_name, upper('e'))
    FROM employees;
    
SELECT first_name, SUBSTR(first_name,1,length(first_name)-2)
    FROM employees;
   

SELECT lpad(first_name,12,'*')
    FROM employees;

SELECT rpad(first_name,12,' @ *')
    FROM employees;

SELECT TRIM(LEADING 'E' FROM first_name) "NEW Name"
FROM employees;

SELECT TRIM(TRAILING '1' FROM 1234567896541) 
AS TRAILING_TRIM 
FROM dual;

SELECT *
    FROM jobs
        WHERE lower(job_id)='&job';
DESCRIBE jobs

SELECT CONCAT(CONCAT(last_name, '  ''s job catagory is '),job_id) "Job"
    FROM employees
        WHERE SUBSTR(job_id,4)= 'REP';

SELECT SUBSTR(job_id,4),last_name
    FROM employees;

SELECT employee_id,first_name, last_name NAME,
LENGTH (last_name), INSTR(last_name, 'a') "Contains 'a'?"
FROM employees
WHERE SUBSTR(last_name, -1, 1) = 'n';

SELECT last_name,
    UPPER(CONCAT(SUBSTR(last_name,1,8),'_US')) new
FROM employees;

SELECT ROUND(552.923,-3)
FROM dual;

SELECT CEIL(23.923)
FROM dual;

SELECT TRUNC(53.923,2)
FROM dual;

SELECT FLOOR(23.923)
FROM dual;

SELECT MOD(163,2)
FROM dual;

SELECT SESSIONTIMEZONE,Current_DATE FROM DUAL
















    
    