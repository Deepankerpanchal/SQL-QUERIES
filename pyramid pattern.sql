
create procedure pyramid @oddnumber int
as
begin

declare @start int , @last int 
set  @start = 1
set  @last = @oddnumber
while (@last >= @start)
begin 
print space(@last-@start/2) + replicate('*',@start)
set  @start= @start+2

end
end
 pyramid '8'

