select	sec.term
		, count(*) 		as amount
from	section	sec
join	enroll	enr		on enr.secid = sec.secid
group by sec.term
order by term



select 	lec.lecid
		, lec.name
		, lec.major 
from	lecturer lec
join	section	sec		on sec.lecid = lec.lecid
where	sec.term like '2025%'
group by lec.lecid
order by lecid


select 	std.stdid
		, std.name
		, std.major
		, enr.grade 
from	student std
join	enroll enr		on enr.stdid = std.stdid
where	enr.secid = 6
order by stdid



select	std.stdid
		, std.name 		as std_name
		, sec.secid
		, sec.term
		, sub.name 		as sub_name
		, lec.name 		as lec_name
		, enr.grade
from	student std
join	enroll 	enr		on enr.stdid = std.stdid 
join	section sec		on sec.secid = enr.secid 
join	lecturer lec	on lec.lecid = sec.lecid 
join	subject sub		on sub.subid = sec.subid
where	sec.term  = '2025-1'
	and enr.grade is not null
order by secid, stdid



select	sec.secid
		, lec.lecid
		, lec.name 		as lec_name
		, sub.subid
		, sub.name 		as sub_name
		, sec.term
from	lecturer lec
join	section	sec		on sec.lecid = lec.lecid 
join	subject sub		on sub.subid = sec.subid 
where	sec.term like '2025%'
order by secid 



select	enr.stdid
		, sum(sub.credit) as total_credit
from 	enroll enr
join 	section sec		on sec.secid = enr.secid 
join	subject sub 	on sub.subid = sec.subid 
where	enr.grade <> 'F' or enr.grade is null
group by enr.stdid 
order by stdid


select	lec.lecid
		, lec.name
		, count(*)		as count_subject
from	lecturer lec
join	section sec		on sec.lecid = lec.lecid
group by lec.lecid, lec.name
order by lecid



select 	left(sec.term, 4) 				as year
		, count(distinct sec.secid) 	as amount
from	section sec
join	enroll enr 			on enr.secid = sec.secid 
group by year



select	std.stdid
		, std.name
		, sec.secid
		, sec.term 
		, enr.grade
from	student std
join	enroll enr		on enr.stdid = std.stdid 
join	section sec		on sec.secid = enr.secid 
join	subject sub		on sub.subid = sec.subid 
where	sub.name = 'database'
	and enr.grade = 'a'
order by stdid



select 	left(sec.term, 4) 				as year
		, count(*) 						as amount
from	section sec
join	enroll enr 			on enr.secid = sec.secid 
group by year


select 	*
from	section sec
join	enroll enr 			on enr.secid = sec.secid 
order by term

