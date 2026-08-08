select 	sub.subid
		, sub.name
		, pre.subid			as pre_id
		, pre.name 			as pre_name
from	subject sub
left join	subject pre		on pre.subid = sub.pre



select 	lec.lecid
		, lec.name 
		, count(distinct sec.subid) as count_subject
from	lecturer lec
left join	section sec		on sec.lecid = lec.lecid 
group by lec.lecid 
order by lecid




select 	lec.lecid
		, lec.name  as lecturer_name
		, sub.name 	as subject_name
from	lecturer lec
left join section sec	on sec.lecid = lec.lecid 
left join subject sub	on sub.subid = sec.subid 
order by lecid


select	lecid
		, name
from 	lecturer
where	major = 'cs'
	and	lecid not in (
			select	distinct lec.lecid 
			from	lecturer lec
			join 	section sec		on sec.lecid = lec.lecid 
			where	lec.major = 'cs'
		)

-- 
-- select *
-- from	student std
-- join	enroll enr 		on enr.stdid = std.stdid

-- select 	std.stdid
-- 		, std.name
-- 		, count(*) as count_a
-- from	enroll enr
-- join	student std		on std.stdid = enr.stdid 
-- where	enr.grade = 'A'
-- group by std.stdid
-- having 	count_a >= (
-- 			select count(*) as a
-- 			from enroll
-- 			where grade = 'A'
-- 			group by stdid
-- 			order by a desc
-- 			limit 1
-- 		)
-- order by stdid
		

		
		
select 	std.stdid
		, std.name
		, count(*) as count_a
from	enroll enr
join	student std		on std.stdid = enr.stdid 
where	enr.grade = 'A'
group by std.stdid
having 	count_a >= (
			select count(*) as a
			from enroll
			where grade = 'A'
			group by stdid
			order by a desc
			limit 1
		)
order by stdid



		
		
update lecturer set salary = 88000 where lecid = 't17'
		

select 	lecid
		, name
		, major
		, salary
from 	lecturer
where 	major = 'cs'
	and salary = (select max(salary) from lecturer where major = 'cs')
order by lecid






select 	lecid 
		, name
from 	lecturer
where	major = 'cs'
	and	lecid not in (
			select 	distinct lec.lecid
			from	lecturer lec
			join	section sec		on	sec.lecid = lec.lecid 
			join	subject sub		on	sub.subid = sub.subid
			where	lec.major = 'cs' and sub.name = 'graphics'
		)
order by lecid



select	std.stdid
		, std.name
from 	student std
join	enroll enr		on enr.stdid = std.stdid 
join	section	sec		on sec.secid = enr.secid 
join	subject sub 	on sub.subid = sec.subid
where 	std.major = 'cs'
	and sub.name = 'database'

	intersect
	
select	std.stdid
		, std.name
from 	student std
join	enroll enr		on enr.stdid = std.stdid 
join	section	sec		on sec.secid = enr.secid 
join	subject sub 	on sub.subid = sec.subid
where 	std.major = 'cs'
	and sub.name = 'programming'

order by stdid


select	std.stdid
		, std.name
from 	student std
join	enroll enr		on enr.stdid = std.stdid 
join	section	sec		on sec.secid = enr.secid 
join	subject sub 	on sub.subid = sec.subid
where 	std.major = 'cs'
	and sub.name = 'database'

	except
	
select	std.stdid
		, std.name
from 	student std
join	enroll enr		on enr.stdid = std.stdid 
join	section	sec		on sec.secid = enr.secid 
join	subject sub 	on sub.subid = sec.subid
where 	std.major = 'cs'
	and sub.name = 'english'

order by stdid		