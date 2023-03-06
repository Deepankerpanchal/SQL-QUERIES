alter procedure sp_insertdata
as
begin


delete from emp_finals where id in(select id from emp_stg1)

insert into  emp_finals(id,name,salary,department)
SELECT  id,name,salary,department FROM emp_stg1

insert into emp_ids(id)
select id from emp_stg1
where id not in (select distinct id from emp_ids)

update emp_finals 
set 
is_active=0 
where id not in (select distinct id from emp_ids)



truncate table emp_stg1


end


update emp_finals
set
emp_stg1.id =emp_stg1.id,
emp_stg1.name=emp_stg1.name,
emp_stg1.department=emp_stg1.department,
emp_stg1.salary=emp_stg1.salary
from emp_finals
inner join
emp_stg1
on
emp_finals.id=emp_stg1.id
--MERGE emp_finals as target
USING emp_ids as source
	ON  source.id =target.id
	
	WHEN NOT MATCHED BY source THEN
    --DELETE;
	UPDATE  SET
		target.is_active = 0;