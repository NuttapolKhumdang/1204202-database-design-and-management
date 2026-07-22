select
		*
from	student
where	major not in ('cs', 'art', 'math')

select
		*
from	subject
where	pre is null


select
		*
from	lecturer
where	major = 'cs'
	and salary > 50000
	
select
		*
from	section
where	term = '2023-3'

select
		*
from	enroll
where	grade = 'f'