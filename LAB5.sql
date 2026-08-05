---------
-- 5.1 --
---------

-- 1 แสดงรหัสนิสิต และชื่อนิสิตที่เคยเรียนวิชา CS001
select	std.stdid
		, std.name
from 	student std
join 	enroll enr		on enr.stdid = std.stdid
join	section sec		on sec.secid = enr.secid
where	sec.subid = 'cs001'


-- 2 แสดงรหัสนิสิต และชื่อนิสิตที่เคยเรียนวิชา Programming
select	std.stdid
		, std.name
from 	student std
join 	enroll enr		on enr.stdid = std.stdid
join	section sec		on sec.secid = enr.secid
join	subject	sub 	on sub.subid = sec.subid 
where	sub.name = 'programming'


-- 3 แสดงรหัสนิสิต และชื่อนิสิตที่เคยเรียนกับอาจารย์ชื่อ Peter Parker
select	std.stdid
		, std.name
from 	student std
join 	enroll enr		on enr.stdid = std.stdid
join	section sec		on sec.secid = enr.secid
join	lecturer lec	on lec.lecid = sec.lecid
where	lec.name = 'peter parker'


-- 4 แสดง รหัสนิสิต ที่ได้เกรด A วิชา Programming
select	enr.stdid
from	enroll enr
join	section sec		on sec.secid = enr.secid
join	subject	sub 	on sub.subid = sec.subid 
where	sub.name = 'programming'
	and	enr.grade = 'A'

-- 5 แสดง รหัสนิสิต และชื่อนิสิต ที่ได้เกรด A วิชา Programming
select	std.stdid
		, std.name
from 	student std
join 	enroll enr		on enr.stdid = std.stdid
join	section sec		on sec.secid = enr.secid
join	subject	sub 	on sub.subid = sec.subid 
where	sub.name = 'programming'
	and	enr.grade = 'A'

-- 6 แสดงรหัสนิสิต ชื่อนิสิต และเกรดที่ได้ ของนิสิตที่เรียน section id 6 
select	std.stdid
		, std.name
		, enr.grade
from 	student std
join 	enroll enr		on enr.stdid = std.stdid
where	enr.secid  = '6'


-- 7 แสดงรหัสนิสิต ชื่อนิสิต และเกรดที่ได้ ของนิสิตที่เรียนวิชา Database ในเทอม 2025-1
select	std.stdid
		, std.name
		, enr.grade
from 	student std
join 	enroll enr		on enr.stdid = std.stdid
join 	section sec 	on sec.secid = enr.secid
join 	subject sub		on sub.subid = sec.subid
where	sec.term = '2025-1'
	and	sub.name = 'database'


-- 
select 	* 
from 	section sec
join 	subject sub		on sub.subid = sec.subid 
join	enroll enr		on enr.secid = sec.secid 
where	sub.name = 'database'
order by term

-- 8 แสดงรหัสนิสิต และชื่อนิสิตของนิสิตที่เคยเรียนวิชา cs001 หรือ cs002
select	std.stdid
		, std.name
from 	student std
join 	enroll enr		on enr.stdid = std.stdid
join 	section sec 	on sec.secid = enr.secid
where	sec.subid in ('cs001', 'cs002')


-- 9 แสดงชื่อวิชาและเทอมที่เปิดสอน เรียงลำดับตามเทอม
select	sub.name 
		, sec.term
from 	subject sub
join 	section sec		on sec.subid = sub.subid
order by term


-- 10 แสดงวิชา , เทอมที่เรียน , อาจารย์ผู้สอน และเกรดที่ได้ ของนิสิตชื่อ Rukawa
select	sub.subid
		, sub.name as sub_name
		, sec.term
		, lec.name as lec_name
		, enr.grade		
from 	subject	sub
join	section sec		on sec.subid = sub.subid
join	lecturer lec	on lec.lecid = sec.lecid 
join	enroll enr		on enr.secid = sec.secid 
join	student std		on std.stdid = enr.stdid 
where	std.name = 'rukawa'


-- 11 แสดงชื่อวิชา, เทอมที่สอน, ชื่อผู้สอน ของทุกวิชาที่สอนโดยอาจารย์ใน major CS
select 	sub.name
		, sec.term
		, lec.name
from	subject sub
join	section sec		on sec.subid = sub.subid 
join	lecturer lec	on lec.lecid = sec.lecid 
where	lec.major  = 'cs'


-- 12 แสดง รหัสนิสิต, ชื่อนิสิต, ชื่อวิชา, ชื่อผู้สอน, เทอมที่เรียน ของการเรียนที่ได้เกรด F
select	std.stdid
		, std.name as std_name
		, sub.name as sub_name
		, lec.name as lec_name
		, sec.term
from	student std
join	enroll enr		on enr.stdid = std.stdid
join	section sec		on sec.secid = enr.secid 
join	subject sub		on sub.subid = sec.subid 
join  	lecturer lec 	on lec.lecid = sec.lecid 
where	enr.grade = 'f'


-- 13 แสดงรหัสวิชา และชื่อวิชาที่เป็น pre-requisite ของวิชารหัส cs002
select 	pre.subid
		, pre.name
from	subject sub
join	subject pre 	on pre.subid = sub.pre
where 	sub.subid = 'cs002'


-- 14 แสดงรหัสวิชา และชื่อวิชาที่เป็น pre-requisite ของวิชา AI
select 	pre.subid
		, pre.name
from	subject sub
join	subject pre 	on pre.subid = sub.pre
where 	sub.name = 'ai'


-- 15 แสดงรหัสวิชา และชื่อวิชาของทุกวิชาที่มีวิชา programming เป็น pre-requisite
select 	sub.subid
		, sub.name
from	subject sub
join	subject pre 	on pre.subid = sub.pre
where 	pre.name = 'programming'


---------
-- 5.2 --
---------

-- 16 แสดงชื่ออาจารย์และเทอมที่สอน ของอาจารย์ทุกคน รวมทั้งอาจารย์ที่ไม่เคยสอนเลย
select 	lec.name
		, sec.term
from	lecturer lec
left join	section sec		on sec.lecid = lec.lecid


-- 17 แสดงชื่ออาจารย์ ชื่อวิชาที่สอน และเทอมที่สอน ของอาจารย์ทุกคน รวมทั้งอาจารย์ที่ไม่เคยสอนเลย
select 		lec.name
			, sub.name
			, sec.term
from		lecturer lec
left join	section sec		on sec.lecid = lec.lecid
left join	subject sub		on sub.subid = sec.subid


-- 18 โดยถ้าอาจารย์คนใดไม่เคยสอนเลย ให้แสดงข้อความ ไม่เคยสอน ในคอลัมน์ วิชา และเทอมที่สอน
select 		lec.name
			, ifnull(sub.name, 'ไม่เคยสอน') as name
			, ifnull(sec.term, 'ไม่เคยสอน') as term
from		lecturer lec
left join	section sec		on sec.lecid = lec.lecid
left join	subject sub		on sub.subid = sec.subid


-- 19 แสดงรหัสนิสิต และรหัสวิชาที่ลงทะเบียนเรียน ของนิสิตทุกคน รวมทั้งคนที่ไม่เคยลงทะเบียนเรียนเลย
select 		std.stdid
			, sec.subid
from		student std
left join	enroll enr		on enr.stdid = std.stdid
left join	section sec		on sec.secid = enr.secid 


-- 20 แสดงรหัสนิสิต ชื่อวิชาเทอมที่เรียน เกรดที่ได้ ของนิสิตทุกคน รวมทั้งคนที่ไม่เคยลงทะเบียนเรียนเลย
select		*
from		student std
left join	enroll	enr 	on enr.stdid = std.stdid 
left join 	section	sec		on sec.secid = enr.secid 
left join	subject sub 	on sub.subid = sec.subid 

---------
-- 5.3 --
---------


-- 20 แสดงรหัสนิสิต และชื่อนิสิตของนิสิตที่เคยเรียนทั้งวิชา cs001 และ cs002  
select	std.stdid
		, std.name
from	student std
join	enroll enr		on enr.stdid = std.stdid
join	section	sec 	on sec.secid = enr.secid 
where 	sec.subid = 'cs001'

	intersect

select	std.stdid
		, std.name
from	student std
join	enroll enr		on enr.stdid = std.stdid
join	section	sec 	on sec.secid = enr.secid 
where 	sec.subid = 'cs002'


-- 21 แสดงรหัสนิสิต และชื่อนิสิตของนิสิตที่เคยเรียนวิชา cs001 แต่ไม่เคยเรียน cs002
select 	std.stdid
		, std.name
from	student std
join	enroll enr		on enr.stdid = std.stdid
join	section sec		on sec.secid = enr.secid 
where 	sec.subid = 'cs001'

	except

select 	std.stdid
		, std.name
from	student std
join	enroll enr		on enr.stdid = std.stdid
join	section sec		on sec.secid = enr.secid 
where 	sec.subid = 'cs002'



-- 22 แสดง ชื่อ, สาขา ของอาจารย์ที่สอนในเทอม 2025-1 แต่ไม่ได้สอนเทอม 2025-2
select	lec.name
		, lec.major
from	lecturer lec
join	section sec		on sec.lecid = lec.lecid
where 	sec.term = '2025-1'

	except
	
select	lec.name
		, lec.major
from	lecturer lec
join	section sec		on sec.lecid = lec.lecid
where 	sec.term = '2025-2'


-- 23 แสดงรหัสและชื่ออาจารย์ที่สอนวิชา Programming แต่ไม่เคยสอน Database
select	lec.lecid
		, lec.name
from	lecturer lec
join	section sec		on sec.lecid = lec.lecid
join	subject sub 	on sub.subid = sec.subid 
where 	sub.name = 'programming'

	except
	
select	lec.lecid
		, lec.name
from	lecturer lec
join	section sec		on sec.lecid = lec.lecid
join	subject sub 	on sub.subid = sec.subid 
where 	sub.name = 'database'


-- 24 แสดงรหัสและชื่อนิสิตที่เคยเรียน Programming แต่ไม่เคยเรียน Graphics
select	std.stdid
		, std.name
from 	student std
join	enroll enr		on enr.stdid = std.stdid
join	section sec 	on sec.secid = enr.secid 
join 	subject sub 	on sub.subid = sec.subid 
where	sub.name = 'programming'

except 

select	std.stdid
		, std.name
from 	student std
join	enroll enr		on enr.stdid = std.stdid
join	section sec 	on sec.secid = enr.secid 
join 	subject sub 	on sub.subid = sec.subid 
where	sub.name = 'graphics'


-- 25 แสดง ชื่อ, ปีเกิด, อายุ ของนิสิตที่อายุน้อยที่สุด และอายุมากที่สุด
select	name
		, year(birthday)
		, timestampdiff(year, birthday, curdate()) as age
		, 'อายุน้อยสุด' as comment
from 	student
where	timestampdiff(year, birthday, curdate()) = (
			select min(timestampdiff(year, birthday, curdate()))
			from student
		)

union

select	name
		, year(birthday)
		, timestampdiff(year, birthday, curdate()) as age
		, 'อายุมากสุด' as comment
from 	student
where	timestampdiff(year, birthday, curdate()) = (
			select max(timestampdiff(year, birthday, curdate()))
			from student
		)

-- 26 แสดง ชื่อ, ปีเกิด, อายุ ของนิสิตที่อายุน้อยที่สุด และอายุมากที่สุดใน major CS
select	name
		, year(birthday)
		, timestampdiff(year, birthday, curdate()) as age
from 	student
where	major = 'cs'
	and	timestampdiff(year, birthday, curdate()) = (
			select min(timestampdiff(year, birthday, curdate()))
			from student
			where major = 'cs'
		)

union

select	name
		, year(birthday)
		, timestampdiff(year, birthday, curdate()) as age
from 	student
where	major = 'cs'
	and	timestampdiff(year, birthday, curdate()) = (
			select max(timestampdiff(year, birthday, curdate()))
			from student
			where major = 'cs'
		)
	

-- 27 แสดงข้อมูลของนิสิตสาขา CS ที่ไม่เคยเรียนวิชา Programming เลย
select 	* 
from 	student
where	major = 'cs'
	and stdid not in (
			select	std.stdid
			from	student std
			join	enroll enr		on enr.stdid = std.stdid
			join	section sec 	on sec.secid= enr.secid 
			join	subject sub 	on sub.subid = sec.subid
			where	sub.name = 'programming'
				and std.major = 'cs'
		)

		
---------
-- 5.4 --
---------


-- แสดงชื่อของอาจารย์ภาควิชา CS ที่ไม่เคยสอนวิชา Programming
select	name
from	lecturer
where	lecid not in (
			select	lec.lecid 
			from	lecturer lec
			join	section sec 	on sec.lecid = lec.lecid 
			join	subject sub 	on sub.subid = sec.subid
			where	sub.name = 'programming'
)


-- แสดงจำนวนนิสิตที่ลงทะเบียนเรียนในเทอม 2025-2 
select 	count(*)
from 	enroll enr
join	section sec		on sec.secid = enr.secid 
where	sec.term  = '2025-2'


-- แสดง รหัสอาจารย์และชื่อ ของอาจารย์ที่ไม่ได้สอนในภาคเรียน 2026-1
select 	*
from	lecturer
where 	lecid not in (
			select 	lec.lecid 
			from 	lecturer lec
			join	section sec 	on sec.lecid = lec.lecid 
			where	sec.term = '2026-1'
)


-- แสดง name, ปีเกิด, อายุ ของนิสิตที่อายุน้อยที่สุด
-- แสดง name, ปีเกิด, อายุ ของนิสิตที่อายุมากที่สุด ใน major CS
-- แสดง ข้อมูล ของนิสิตที่ได้ GPA สูงที่สุดในมหาวิทยาลัย
-- แสดง ข้อมูล ของนิสิตที่ได้ GPA สูงที่สุดใน major CS
-- แสดง ข้อมูล ของนิสิตที่ได้ GPA สูงที่สุดใน major Thai
-- แสดง ข้อมูล ของ นิสิตที่เคยลงทะเบียนเรียน และไม่เคยติด F เลย
-- แสดงรหัสวิชาและ ชื่อวิชา ที่ไม่เคยเปิดสอนเลย




