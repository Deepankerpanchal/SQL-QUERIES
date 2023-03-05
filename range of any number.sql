--range of any nummber
create table range1 (number bigint)
insert into range1  values (14)
insert into range1  values (78)
insert into range1  values (7)
insert into range1  values (559)
insert into range1  values (8955)




select number, concat(floor((number/5)*5),  ' to ' , floor((number/5)*5)+5)
from range1
