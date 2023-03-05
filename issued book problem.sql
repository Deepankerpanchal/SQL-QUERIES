create table librecord(id int,stname varchar(max),bookname varchar(max),cost int )
insert into librecord values (1,'deepanker','r.d sharma',170),(2,'deepu','vakatesh',88),(3,'mohini','p.vakatesh',88),(2,'deepu','r.d sharma',170)






select count(bookname) as bookissued,stname from  librecord
group by stname
having count(bookname)>1



