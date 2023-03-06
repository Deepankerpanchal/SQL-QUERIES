SELECT T.SALARY FROM
(SELECT *,DENSE_RANK() OVER(ORDER BY SALARY DESC) A FROM EMPLOYEE) T
WHERE A = 3



-----with cte-----

with abc as
(
SELECT *,DENSE_RANK() OVER(ORDER BY SALARY DESC) A FROM EMPLOYEE
)
select * from abc where a = 1

