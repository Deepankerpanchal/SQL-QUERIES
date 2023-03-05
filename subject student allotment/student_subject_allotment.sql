create table SubjectDetails (
SubjectId int Primary key,
SubjectName nvarchar(50),
MaxSeats int,
RemainingSeats int
);



create table StudentDetails1(
StudentId int ,
StudentName nvarchar(50),
GPA float(24),
Branch nvarchar(20),
Section nvarchar(10)
);


create table StudentPreference (
StudentId int,
SubjectId int,
Preference int,
Constraint forginstd foreign key (StudentId) references StudentDetails(StudentId),
Constraint forginsub foreign key (SubjectId) references SubjectDetails(SubjectId));



insert into SubjectDetails(SubjectId,SubjectName,MaxSeats,RemainingSeats) 
values 
(1, 'Basics of Political Science',60,2),
(2, 'Basics of Accounting',120,119),
(3, 'Basics of Financial Markets',90,90),
(4, 'Eco philosophy',60,50),
(5, 'Automotive Trends',60,60);




insert into StudentDetails1 (StudentId,StudentName,GPA,Branch,Section) values
(159103036,'Mohit Agarwal',8.9, 'CCE','A'),
(159103037,'Rohit Agarwal',7.2, 'CCE','A'),
(159103038,'Shohit Garg',6.1, 'CCE','B'),
(159103039,'Mrinal Malhotra',5.9, 'CCE','A'),
(159103040,'Mehreet Singh',4.6, 'CCE','A'),
(159103041,'Arjun Tehlan',3.2, 'CCE','B');

insert into StudentPreference(StudentId,SubjectId,Preference) values
(159103036,1, 1),(159103036,2, 2), (159103036,3, 3),
(159103036,4, 4),(159103036,5, 5),
(159103037,1, 1),(159103037,2, 2), (159103037,3, 3),
(159103037,4, 4),(159103037,5, 5),
(159103038,1, 1),(159103038,2, 2), (159103038,3, 3),
(159103038,4, 4),(159103038,5, 5),
(159103039,1, 1),(159103039,2, 2), (159103039,3, 3),
(159103039,4, 4),(159103039,5, 5),
(159103040,1, 1),(159103040,2, 2), (159103040,3, 3),
(159103040,4, 4),(159103040,5, 5),
(159103041,1, 1),(159103041,2, 2), (159103041,3, 3),
(159103041,4, 4),(159103041,5, 5);


create table Allotment(
StudentId int not null,
SubjectId int not null
);



create table UnallotedStudents(
StudentId int not null
);

select * from StudentPreference;
select * from StudentDetails1;
select * from SubjectDetails;
select * from Allotment;
select * from UnallotedStudents;







drop table StudentPreference

drop table SubjectDetails
drop table Allotment
drop table UnallotedStudents 

drop table StudentDetails

select * from StudentPreference;
select * from StudentDetails;
select * from SubjectDetails;
select * from Allotment
select * from UnallotedStudents;
 

drop table #temp;
drop table #tempp;
select * from #studentdetails

select ROW_NUMBER() over (order by gpa desc) as rownum into #temp from StudentPreference group by StudentId order by StudentId;	
select * from #studentdetails

select *, row_number() over (order by gpa desc) as rownum into #studentdetails from studentdetails
select ROW_NUMBER() over (order by Preference) as rowpre, Preference into #tempp from StudentPreference group by Preference
--order by Preference;
select * from #studentdetails
drop table #studentdetails
drop table #tempp

-----------------starting of procedure-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------



create or alter proc sp_stu_sub_allotment

as
begin

truncate table allotment
truncate table unallotedstudents
select *, row_number() over (order by gpa ) as rownum into #studentdetails from studentdetails


	declare @i int
	declare @j int
	declare @studentid int
	declare @maxpreference int
	DECLARE @remainingseat int
	declare @subjectid varchar(max)

		set @maxpreference=(select MAX(Preference) from StudentPreference)
		set @i = 1
	    set @j = 1
		while (@i<=(select count(rownum) from #studentdetails))
			
		
		 begin
		       	
		       set @studentid=(select studentid from #studentdetails where rownum =@i)
		       while  (@j<=(select max(preference) from studentpreference where studentid=@studentid)) 
			        
					begin
					
					 set @subjectid=(select subjectid from studentpreference where preference=@j and studentid=@studentid)
				     set @remainingseat=(select remainingseats from subjectdetails where subjectid =@subjectid)

								if @remainingseat>0
								begin
								insert into allotment values(@studentid,@subjectid)

								update subjectdetails set remainingseats =remainingseats-1 where subjectid=@subjectid
								break
								end
								

										else if @j = @maxpreference 
										begin
										   
									        insert into UnallotedStudents values(@studentid)
												break							
												end
								
								               set @j=@j+1
								end 
								set @i=@i+1
						
			  end
			  
			  
		
		end

		


				
				  

		

delete t from 
(select *,row_number() over (partition by  studentid order by studentid) as rownum  from studentdetails1 ) t
where t.rownum>1
		
		

