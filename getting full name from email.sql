 create table email(email varchar(max))
		insert into email  values ('devansh.khatri@oracle.com'),('anshul.khatri@hdfcbank.com'),('mohini.nama@celebaltech.com'),('deepanker.panchal@google.com')	
		select * from email

		SELECT
SUBSTRING(email,0,charindex('.',email)) as firstname,
SUBSTRING(email,charindex('.',email)+1,charindex('@',email)-charindex('.',email)-1) as lastname, 
reverse(SUBSTRING(reverse(email),charindex('.',reverse(email))+1,charindex('@',reverse(email))-charindex('.',reverse(email))-1)) as company_name,
email
from email