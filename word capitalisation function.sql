select dbo.Capitalizeword(emp_final)

create function Capitalizeword(@word nvarchar(max))
returns nvarchar(max)
as 
begin
--declare @word nvarchar(max)
--set @word ='hi mohini nama'
declare @space char(1) =' '
select  @word = STUFF(lower(@word),1,1,upper(left(@word,1)))
declare @i int= charindex(@space,@word)
while @i>1
begin 
select @i=@i+1
select @word= STUFF(@word,@i,1, upper(substring(@word,@i,1)))
select @i = charindex(@space,@word,@i)
end
--select @word
return @word
end







