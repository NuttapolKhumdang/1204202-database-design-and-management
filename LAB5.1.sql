-- 1 แสดงรหัสนิสิต และชื่อนิสิตที่เคยเรียนวิชา CS001
select	student.stdid,
		student.name
from	section
join	enroll
	on	enroll.secid = section.secid
join	student
	on 	student.stdid = enroll.stdid
where	section.subid = 'cs001'


-- 2 แสดงรหัสนิสิต และชื่อนิสิตที่เคยเรียนวิชา Programming
select 	student.stdid, 
		student.name
from 	student
join 	enroll
	on	enroll.stdid = student.stdid
join	section
	on	enroll.secid = section.secid
join	subject
	on	subject.subid = section.subid
where 	subject.name = 'programming'


-- 3 แสดงรหัสนิสิต และชื่อนิสิตที่เคยเรียนกับอาจารย์ชื่อ Peter Parker
select 	student.stdid, 
		student.name
from 	student
join 	enroll
	on	enroll.stdid = student.stdid
join	section
	on	enroll.secid = section.secid
join	subject
	on	subject.subid = section.subid
join	lecturer
	on 	lecturer.lecid = section.lecid
where 	lecturer.name = 'Peter Parker'



-- 4 แสดง รหัสนิสิต ที่ได้เกรด A วิชา Programming
select 	enroll.stdid
from	enroll
join	section
	on	section.secid = enroll.secid
join	subject
	on	subject.subid = section.subid
where	subject.name = 'programming'
	and	enroll.grade = 'A'


-- 5 แสดง รหัสนิสิต และชื่อนิสิต ที่ได้เกรด A วิชา Programming
select 	student.stdid,
		student.name
from 	student
join 	enroll
	on	enroll.stdid= student.stdid
join	section
	on	section.secid = enroll.secid
join	subject
	on	subject.subid = section.subid
where	subject.name = 'programming'
	and	enroll.grade = 'A'


-- 6 แสดงรหัสนิสิต ชื่อนิสิต และเกรดที่ได้ ของนิสิตที่เรียน section id 6 
select	student.stdid,
		student.name,
		enroll.grade
from	enroll
join	student
	on	student.stdid = enroll.stdid
where	enroll.secid = '6'
	
	
-- 7 แสดงรหัสนิสิต ชื่อนิสิต และเกรดที่ได้ ของนิสิตที่เรียนวิชา Database ในเทอม 2025-1
select	student.stdid,
		student.name,
		enroll.grade
from	enroll
join	student
	on	student.stdid = enroll.stdid
join	section
	on 	section.secid = enroll.secid
join	subject
	on	subject.subid = section.subid
where	subject.name = 'database'
	and	section.term = '2025-1'

-- 8 แสดงรหัสนิสิต และชื่อนิสิตของนิสิตที่เคยเรียนวิชา cs001 หรือ cs002
select	student.stdid,
		student.name
from	enroll
join	student
	on	student.stdid = enroll.stdid
join	section
	on 	section.secid = enroll.secid
where	section.subid in ('cs001', 'cs002')
	
-- 9 แสดงชื่อวิชาและเทอมที่เปิดสอน เรียงลำดับตามเทอม
-- 10 แสดงวิชา , เทอมที่เรียน , อาจารย์ผู้สอน และเกรดที่ได้ ของนิสิตชื่อ Rukawa

	




