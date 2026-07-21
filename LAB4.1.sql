-- 1 แสดง ข้อมูลนิสิตทุกคน  ที่อยู่ สาขา CS
select 	*
from	student
where	major = 'cs'


-- 2 แสดง ข้อมูลนิสิตทุกคน  ที่อยู่ สาขา CS หรือ Math
select	*
from 	student
where	major in ('cs', 'math')


-- 3 แสดง ข้อมูลนิสิตทุกคน  ที่ไม่ได้อยู่ สาขา CS, English, Math
select 	*
from 	student
where 	major not in ('cs', 'english', 'math')


-- 4 แสดง ข้อมูลนิสิตทุกคน  ที่ชื่อขึ้นต้นด้วยตัว S
select	*
from	student
where 	name like 's%'


-- 5 แสดง ข้อมูลนิสิตทุกคน  ที่ชื่อขึ้นต้นด้วยตัว S และลงท้ายด้วย h
select 	*
from	student
where	name like 's%h'


-- 6 แสดง ข้อมูลนิสิตทุกคน ที่ gpa อยู่ระหว่าง  2.00 ถึง 3.00
select 	*
from 	student
where 	gpa between 2.00 and 3.00


-- 7 แสดง ข้อมูลนิสิตทุกคน  ที่ไม่มีข้อมูลวันเกิด
select 	*
from	student
where 	birthday is null


-- 8 แสดง ข้อมูลนิสิตทุกคน  ที่ทั้งชื่อ และสาขา ไม่เป็นค่าว่าง
select	*
from	student
where 	name is not null
	and major is not null


-- 9 แสดง ข้อมูลนิสิตทุกคน ที่ไม่ได้อยู่ CS หรือ Math เรียงลำดับตาม gpa จากมากไปน้อย
select 	*
from	student
where 	major in ('cs', 'math')
order by gpa desc

-- 10 แสดง ข้อมูลนิสิตทุกคน  เรียงลำดับตาม สาขา และ gpa จากน้อยไปมาก 
select	*
from	student
order by major, gpa


-- 11 แสดง ข้อมูลนิสิตทุกคน  เรียงลำดับตาม สาขา และ gpa จากน้อยไปมาก 
-- โดยไม่แสดงข้อมูลที่สาขา หรือ gpa เป็นค่าว่าง
select 	*
from 	student
where	major is not null 
	and gpa is not null
order by major, gpa


-- 12 แสดง gpa ที่สูงที่สุด และ ต่ำที่สุดของนิสิต โดยให้แสดงเป็น column ชื่อ max_gpa และ min_gpa
select	max(gpa)	as max_gpa,
		min(gpa)	as min_gpa
from	student


-- 13 แสดง gpa ที่สูงที่สุด และ gpa ต่ำสุด ของ สาขา CS เป็น column ชื่อ max_cs และ min_cs
select	max(gpa)	as max_cs,
		min(gpa)	as min_cs
from	student
where 	major = 'cs'


-- 14 แสดงรหัสวิชาที่เป็น prerequisite ของวิชา Graphics
select 	pre
from 	subject
where	name = 'graphics'


-- 15 แสดงรหัสและชื่อวิชา ของวิชาที่ไม่มีวิชา prerequisite
select	subid, name
from	subject
where 	pre is null


-- 16 วิชาใดบ้างที่มีหน่วยกิต 3 หน่วยกิตขึ้นไป
select 	*
from	subject
where 	credit >= 3


-- 17 วิชาใดบ้างที่มีวิชา CS001 เป็นวิชา prerequisite
select 	*
from	subject
where 	pre = 'cs001'


-- 18 มีกี่วิชาที่วิชารหัส CS001 เป็นวิชา prerequisite
select	count(*)
from 	subject
where	pre = 'cs001'

-- 19 แสดงข้อมูลวิชาที่เปิดสอนในสาขา CS
select 	*
from	subject
where 	major = 'cs'

-- 20 แสดงข้อมูลอาจารย์ที่ได้เงินเดือนระหว่าง 20000 – 40000
select 	*
from 	lecturer
where	salary between 20000 and 40000


-- 21 แสดง เงินเดือนที่สูงที่สุดของอาจารย์สาขา CS 
select 	max(salary)
from 	lecturer
where	major = 'cs'

-- 22 แสดง เงินเดือนเฉลี่ยของอาจารย์ในสาขา English 
select	avg(salary)
from 	lecturer
where major = 'english'


-- 23 แสดง อาจารย์ในสาขา English ที่ได้เงินเดือนต่ำกว่า 40000 บาท
select 	*
from 	lecturer
where 	major = 'english'
	and salary < 40000


-- 24 แสดงข้อมูลอาจารย์ที่อยู่ภาควิชาอื่น ๆ ที่ไม่ใช่ CS หรือ Math
select 	*
from	lecturer
where 	major not in ('cs', 'math')


-- 25 แสดงเงินเดือนรวมทั้งหมด, เงินเดือนสูงสุด, เงินเดือนต่ำสุด , ค่าเฉลี่ยเงินเดือน ของอาจารย์ 
-- โดยให้แสดงเป็น column ชื่อ total_salary, max_salary, min_salary และ average_salary
select	sum(salary) as total_salary,
		max(salary) as max_salary,
		min(salary) as min_salary,
		avg(salary) as average_salary
from	lecturer

-- 26 แสดงเงินเดือนรวมทั้งหมด, เงินเดือนสูงสุด, เงินเดือนต่ำสุด , ค่าเฉลี่ยเงินเดือน ของอาจารย์สาขา English
-- โดยให้แสดงเป็น column ชื่อ total_sal, max_sal, min_sal และ average_sal
select	sum(salary) as total_sal,
		max(salary) as max_sal,
		min(salary) as min_sal,
		avg(salary) as average_sal
from	lecturer
where	major = 'english'

-- 27 แสดงรหัสอาจารย์ที่สอนวิชา CS001 เทอม 2025-1
select	lecid
from	section
where	term like '2025%'


-- 28 แสดง secid ที่เปิดสอนวิชารหัส CS001
select	secid
from	section
where	subid = 'cs001'


-- 29 แสดงจำนวนวิชาที่เปิดสอนในเทอม 2025-1 
select 	count(*)
from	section
where 	term = '2025-1'


-- 30 แสดงจำนวนวิชาที่เปิดสอนปี 2025
select 	count(*)
from	section
where	term like '2025%'


-- 31 แสดง section id, subject id, lecturer id และ เทอม ของการสอนที่เปิดสอนทุกเทอมในปี 2025
select	*
from	section
where	term like '2025%'


-- 32 แสดง รหัสวิชา ที่เปิดสอนในปี 2025 ( ทั้ง 3 เทอม ) โดยไม่แสดงรหัสซ้ำกัน
select	distinct subid
from 	section
where	term like '2025%'


-- 33 แสดงรหัสวิชาที่สอนโดยอาจารย์รหัส t01 โดยแสดงรหัสวิชาไม่ซ้ำกัน
select	distinct subid
from	section
where	lecid = 't01'


-- 34 แสดงจำนวนครั้ง ที่อาจารย์รหัส t02 เคยสอน
select	count(*)
from 	section
where 	lecid = 't02'


-- 35 แสดงจำนวนครั้งที่เปิดสอนวิชารหัส CS005 
select	count(*)
from 	section
where 	subid = 'cs005'


-- 36 แสดงข้อมูลการลงทะเบียนที่ได้เกรด A 
select	*
from	enroll
where	grade = 'a'


-- 37 แสดงข้อมูลการลงทะเบียน section id 5
select 	*
from	enroll
where 	secid = 5


-- 38 แสดงข้อมูลการลงทะเบียน section id 5 และเกรดไม่เป็น F
select 	*
from	enroll
where 	secid = 5
	and grade <> 'F'

	
-- 39 แสดงจำนวนนิสิตที่ลงทะเบียนเรียน section 5 และ เกรดไม่เป็น F
select 	count(*)
from	enroll
where 	secid = 5
	and grade <> 'F'
	
	
-- 40 แสดงจำนวนครั้งที่นิสิตรหัส 60001 ลงทะเบียนเรียน
select	*
from	enroll
where	stdid = '60001'
	
	
-- 41 แสดงจำนวนครั้งที่นิสิตรหัส 60006 ได้เกรด F
select	count(*)
from	enroll
where	stdid = '60006'
	and grade = 'F'


-- 42 แสดง ข้อมูลของนิสิตทุกคน ที่เกิดปี 2015
select 	*
from	student
where	year(birthday) = '2015'
	
	
-- 43 แสดง ข้อมูล ของนิสิตทุกคนที่มีอายุ 15 ปีขึ้นไป
select 	*
from	student
where	timestampdiff(year, birthday, curdate()) >= 15


-- 44 แสดง ข้อมูล ของนิสิตที่เกิดเดือน February 
select 	*
from	student
where	monthname(birthday) = 'february' 


-- 45 แสดง รหัสนิสิต ชื่อ และอายุ ของนิสิตทุกคนที่เกิดวันจันทร์
select 	stdid,
		name,
		timestampdiff(year, birthday, curdate()) as age
from	student
where	dayname(birthday) = 'monday' 



-- 46 แสดง รหัสนิสิต ชื่อ ปีเกิด และ อายุ ของนิสิตทุกคน
select 	stdid,
		name,
		year(birthday) as birthyear,
		timestampdiff(year, birthday, curdate()) as age
from	student


-- 47 แสดง รหัสนิสิต ชื่อ สาขา ปีเกิด, อายุ ของนิสิตที่อายุน้อยกว่า 15 ปี และไม่ได้อยู่ สาขา CS
select 	stdid,
		name,
		major,
		year(birthday) as birthyear,
		timestampdiff(year, birthday, curdate()) as age
from	student
where 	timestampdiff(year, birthday, curdate()) < 15
	and major <> 'cs'
	

