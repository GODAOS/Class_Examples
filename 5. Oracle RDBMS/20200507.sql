--모든 사원의 사번, 성, 부서 코드, 부서명, 위치 코드, 도시 조회
SELECT e.employee_id, e.last_name, d.department_id, d.department_name, l.location_id, l.city
FROM employees e, departments d, locations l
WHERE e.department_id = d.department_id(+)
AND d.location_id = l.location_id(+);

--모든 사원의 사번, 성, 부서 코드, 부서명, 업무 코드, 업무 제목 조회
SELECT e.employee_id, e.last_name, d.department_id, d.department_name, j.job_id, j.job_title
FROM employees e, departments d, jobs j
WHERE e.department_id = d.department_id(+)
AND e.job_id = j.job_id;

--관리자 사번이 149인 사원들의
--사번, 성, 부서 코드, 부서명 조회
SELECT e.employee_id, e.last_name, d.department_id, d.department_name
FROM employees e, departments d
WHERE e.department_id = d.department_id(+)
AND e.manager_id = 149;

--성에 대소문자 무관하게 a가 있는 성을 가진 사원들의
--사번, 성, 부서명 조회
SELECT e.employee_id, e.last_name, d.department_name
FROM employees e, departments d
WHERE e.department_id = d.department_id(+)
AND LOWER(e.last_name) LIKE '%a%'
ORDER BY 2;

--커미션을 받는 사원들의 사번, 성, 부서명, 도시명 조회
SELECT e.employee_id, e.last_name, d.department_name, l.city
FROM employees e, departments d, locations l
WHERE e.department_id = d.department_id(+)
AND d.location_id = l.location_id(+)
AND e.commission_pct IS NOT NULL;

--------------------------------------------------------------------------------------------------------------------
--SELECT 절에 사용한 ALIAS 명이나 SELECT 절에서의 위치는 ORDER BY 절에서만 사용할 수 있다.
--WHERE 절, GROUP BY 절, HAVING 절 (조건절)에서는 ALIAS나 칼럼의 위치를 사용할 수 없다.
--------------------------------------------------------------------------------------------------------------------
--부서별 사원들의 정보를 파악하고자 한다.
--부서 코드가 60번 이하인 부서에 대해 부서의 평균 급여가 5000 이상인 부서만
--부서 코드, 사원 수, 급여 합계, 급여 평균, 최대 급여, 최저 급여, 최근 입사일자, 최초 입사일자 조회
SELECT department_id, count(*) cnt, SUM(salary) sum_sal, ROUND(AVG(salary)) avg_sal,
       MAX(salary) max_sal, MIN(salary) min_sal, MAX(hire_date) max_hire, MIN(hire_date) min_hire
FROM employees
WHERE department_id <= 60
GROUP BY department_id
HAVING AVG(salary) >= 5000
--HAVING department_id <= 60 AND AVG(salary) >= 5000
ORDER BY 1;

--업무 형태별로 사원들의 정보를 파악하고자 한다.
--업무 형태별로 사원 수가 10명 이상인 업무 형태에 대해
--업무 코드, 업무별 사원 수, 업무별 평균 급여, 업무별 최대 급여, 업무별 최소 급여,
--업무별 최근 입사 일자, 업무별 최초 입사 일자 조회
SELECT job_id, COUNT(*) cnt, AVG(salary) avg_sal, MAX(salary) max_sal, MIN(salary) min_sal,
       MAX(hire_date) max_hire, MIN(hire_date) min_hire
FROM employees
GROUP BY job_id
HAVING COUNT(*) >= 10;
--------------------------------------------------------------------------------------------------------------------
--5. SELF JOIN
--하나의 테이블을 두 번 명시하여 동일한 테이블 두 개로부터 JOIN을 통해 데이터를 조회하여 결과를 반환
--모든 사원의 사번, 이름, 매니저 사번, 매니저 이름 정보를 조회
SELECT e.employee_id, e.first_name,
       NVL(TO_CHAR(e.manager_id), '없음') manager_id_1,
       NVL2(e.manager_id, TO_CHAR(e.manager_id), '없음') manager_id_2,
       NVL(m.first_name, '없음') manager_name_1,
       NVL2(m.first_name, m.first_name, '없음') manager_name_2
FROM employees e, employees m
WHERE e.manager_id = m.employee_id(+)
ORDER BY e.employee_id;

--------------------------------------------------------------------------------------------------
--1. 모든 사원의 사번, 성명, 업무코드, 매니저사번, 매니저성명, 매니저의 업무코드 조회하여
--사번 순으로 정렬 --SELF JOIN
SELECT e.employee_id, e.first_name ||' '|| e.last_name AS name, e.job_id,
       e.manager_id, m.first_name ||' '|| m.last_name manager_name, m.job_id manager_job_id
FROM employees e, employees m
WHERE e.manager_id = m.employee_id
ORDER BY 1;

--2. 성이 King인 사원들의 사번, 성명, 부서코드, 부서명 조회
SELECT e.employee_id, e.first_name ||' '|| e.last_name name, d.department_id, d.department_name
FROM employees e, departments d
WHERE e.last_name = 'King'
AND e.department_id = d.department_id(+);

--3. 위치코드가 1400 인 도시에는 어느 부서가 있나 파악하고자 한다.
--위치코드가 1400 인 도시명, 부서명 조회
SELECT l.city, d.department_name
FROM departments d, locations l
WHERE l.location_id = 1400
AND d.location_id = l.location_id;

--4. 위치코드 1800 인 곳에 근무하는 사원들의
--사번, 성명, 업무코드, 급여, 부서명, 위치코드 조회
SELECT e.employee_id, e.first_name ||' '|| e.last_name name, e.job_id, e.salary, d.department_name, l.location_id
FROM employees e, departments d, locations l
WHERE e.department_id = d.department_id
AND d.location_id = l.location_id
AND l.location_id = 1800;

--5. 자신의 매니저보다 먼저 입사한 사원들의 
--사번, 성명, 입사일자, 매니저성명, 매니저 입사일자 조회 --SELF JOIN
SELECT e.employee_id, e.first_name ||' '|| e.last_name name, e.hire_date,
       m.first_name ||' '|| m.last_name manager_name, m.hire_date manager_hire_date
FROM employees e, employees m
WHERE e.manager_id = m.employee_id
AND e.hire_date < m.hire_date;

--6. toronto 에 근무하는 사원들의
--사번, 성, 업무코드, 부서코드, 부서명, 도시 조회
SELECT e.employee_id, e.last_name, e.job_id, d.department_id, d.department_name, l.city
FROM employees e, departments d, locations l
WHERE e.department_id = d.department_id
AND d.location_id = l.location_id
AND LOWER(l.city) = 'toronto';

--7. 커미션을 받는 모든 사원들의 성, 부서명, 위치코드, 도시 조회
SELECT e.last_name, d.department_name, l.location_id, l.city
FROM employees e, departments d, locations l
WHERE e.commission_pct IS NOT NULL
AND e.department_id = d.department_id
AND d.location_id = l.location_id;

--8. 이름에 소문자 v가 포함된 모든 사원의 사번, 이름, 부서명을 조회하는 쿼리문을 작성한다.
SELECT e.employee_id, e.first_name, d.department_name
FROM employees e, departments d
WHERE LOWER(e.first_name) LIKE '%v%'
AND e.department_id = d.department_id;

--9. 커미션을 받는 사원의 사번, 이름, 급여, 커미션 금액, 부서명을 조회하는 쿼리문을 작성한다.
--   단, 커미션 금액은 월급여에 대한 커미션 금액을 나타낸다.
SELECT e.employee_id, e.first_name, e.salary, ROUND(e.salary * e.commission_pct) comm, d.department_name
FROM employees e, departments d
WHERE e.department_id = d.department_id
AND e.commission_pct IS NOT NULL;

--10. 각 부서의 부서코드, 부서명, 위치코드, 도시명, 국가코드, 국가명을 조회하는 쿼리문을 작성한다.
SELECT d.department_id, d.department_name, l.location_id, l.city, c.country_id, c.country_name
FROM departments d, locations l, countries c
WHERE d.location_id = l.location_id
AND l.country_id = c.country_id;

--11. 사원의 사번, 이름, 업무코드, 매니저의 사번, 매니저의 이름, 매니저의 업무코드를 조회하여 
--사원의 사번 순서로 정렬하는 쿼리문을 작성한다.
SELECT e.employee_id, e.first_name, e.job_id, e.manager_id, m.first_name manager_name, m.job_id manager_job_id
FROM employees e, employees m
WHERE e.manager_id = m.employee_id
ORDER BY 1;

--12. 모든 사원의 사번, 이름, 부서명, 도시, 주소 정보를 조회하여 사번 순으로 정렬하는 쿼리문을 작성한다.
SELECT e.employee_id, e.first_name, d.department_name, l.city, l.street_address
FROM employees e, departments d, locations l
WHERE e.department_id = d.department_id(+)
AND d.location_id = l.location_id(+)
ORDER BY 1;
-------------------------------------------------------------------------------------------------