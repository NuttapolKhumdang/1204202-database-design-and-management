-- 48 แสดงรหัสอาจารย์ และจำนวนครั้งที่เคยสอน 
select	lecid,
		count(*) as count
from	section
group by lecid

-- 49 แสดงรหัสอาจารย์ และจำนวนครั้งที่เคยสอน โดยแสดงเฉพาะอาจารย์ที่สอนมากที่สุด 3 คน
select	lecid,
		count(*) as count
from	section
group by lecid
order by count desc
limit 3


-- 50 แสดงรหัสวิชา ชื่อวิชา และ รหัสวิชาเงื่อนไข ถ้าวิชาใดไม่มีวิชาเงื่อนไข ให้แสดงข้อความ  ไม่มีวิชาเงื่อนไข
select 	subid,
		name,
		ifnull(pre, 'ไม่มีวิชาเงื่อนไข') as pre
from subject


-- 51 แสดง ชื่อ major, gpa สูงสุดของ major นั้น ๆ และ gpa ต่ำสุดของ major นั้น ๆ 
-- โดยไม่แสดงข้อมูลที่ major เป็น null
select	major,
		max(gpa) as max_gpa,
		min(gpa) as min_gpa
from	student
where 	major is not null
group by major


-- 52 แสดง ชื่อ major , gpa สูงสุดของ major นั้น ๆ และ gpa ต่ำสุดของ major นั้น ๆ 
-- โดยแสดงเฉพาะ major ที่มีค่า gpa ต่ำสุด มากกว่า 2.00
select	major,
		max(gpa) as max_gpa,
		min(gpa) as min_gpa
from	student
where 	major is not null
group by major
having	min_gpa > 2.00


-- 53 แสดง ชื่อmajor , จำนวนนิสิตใน major นั้น, gpa สูงสุดของ major นั้น และ gpa ต่ำสุดของ major นั้น 
-- โดยแสดงเฉพาะ major ที่มีจำนวนนิสิตมากกว่า 1 คน และ gpa สูงสุดของ major นั้นมากกว่า 3.00
-- และ  major ไม่เป็น null
-- เรียงลำดับตาม จำนวนนิสิตจากมากไปน้อย 
select	major,
		count(*) as student_count,
		max(gpa) as max_gpa,
		min(gpa) as min_gpa
from 	student
where 	major is not null
group by major
having 	student_count > 1
	and max_gpa > 3.00
	

-- 54 แสดงปีเกิด และจำนวนนิสิตที่เกิดปีนั้น โดยแสดงเฉพาะที่ปีไม่เป็น null 
-- เรียงลำดับตามจำนวนนิสิตจากมากไปน้อย
select 	year(birthday) 	as year,
		count(*)		as amount
from 	student
where 	birthday is not null
group by year
order by amount desc


-- 55 แสดง รหัสนิสิต, และจำนวนครั้งที่เคยลงเรียน 
select	stdid,
		count(*) as count
from 	enroll
group by stdid


-- 56 แสดง รหัสวิชา, และจำนวนครั้งที่เคยเปิดสอน
select 	subid,
		count(*) as count
from 	section
group by subid


-- 57 แสดง เกรด, จำนวนครั้งที่ได้เกรดนั้น ๆ ของนิสิตรหัส 60001
select 	grade,
		count(*) as count
from	enroll
where 	stdid = '60001'
group by grade

-- 58 แสดง รหัสนิสิตและ จำนวนครั้งที่ได้เกรด F ของนิสิตรหัสนั้น ๆ  
select	stdid,
		count(*) as count
from 	enroll
where	grade = 'F'
group by stdid


-- 59 แสดง รหัสนิสิต และ จำนวนครั้งที่ได้เกรด F โดยแสดงเฉพาะนิสิตที่ได้เกรด F มากกว่า 1 ครั้ง
select	stdid,
		count(*) as count
from 	enroll
where	grade = 'F'
group by stdid
having 	count > 1


-- 60 แสดงรหัสอาจารย์ที่เคยสอนมากกว่า 3 ครั้ง
select 	lecid
from 	section
group by lecid
having count(*) > 3


-- 61 แสดงรหัสอาจารย์ที่เคยสอนวิชา CS001 มากกว่า 1 ครั้ง
select 	lecid
from 	section
where	subid = 'cs001'
group by lecid
having	count(*) > 1