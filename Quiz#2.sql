แสดง

สาขา
จำนวนอาจารย์ในสาขานั้น (แสดงเป็นคอลัมน์ชื่อ amount)
เงินเดือนที่สูงที่สุดในสาขานั้น (แสดงเป็นคอลัมน์ชื่อ max_salary)
เงินเดือนที่ต่ำที่สุดในสาขานั้น (แสดงเป็นคอลัมน์ชื่อ min_salary)

เรียงลำดับตามชื่อสาขา

โดยนับเฉพาะอาจารย์ที่มีข้อมูลสาขา และ เงินเดือน


select	major,
		count(*) 	as amount,
		max(salary)	as max_salary,
		min(salary) as min_salary
from 	lecturer
where	major is not null
	and salary is not null
group by major
order by major


แสดง
secid
จำนวนนิสิตที่ได้เกรด A ใน secid นั้น (แสดงเป็นคอลัมน์ชื่อ a_amount)

โดยแสดงเฉพาะ secid ที่มีนิสิตได้ A มากกว่า 2 คน

select 	secid,
		count(*) as a_amount
from	enroll
where	grade = 'A'
group by secid
having	a_amount > 2


ฝ่ายงานทะเบียนต้องการได้รายงานว่า แต่ละสาขา มีนิสิตเกิดปีต่าง ๆ จำนวนกี่คน

ดังนั้น เขียนคำสั่งเพื่อแสดง

สาขา
ปีเกิด (แสดงเป็นคอลัมน์ชื่อ birth_year)
จำนวน (แสดงเป็นคอลัมน์ชื่อ amount)

โดยไม่รวมนิสิตที่ไม่มีข้อมูล สาขา และ วันเกิด

เรียงลำดับการแสดงผลตามสาขา และ ปีเกิด



select	major,
		year(birthday) as birth_year,
		count(*) as amount
from 	student
where	major is not null
	and birthday is not null
group by major, birth_year
order by major, birth_year





select
		case
			when gpa >= 3.60	then 'honor#1'
			when gpa >= 3.00	then 'honor#2'
			when gpa >= 2.00	then 'normal'
			when gpa <  2.00	then 'probation'
			else					 'no data'
		end as gpa_group,
		count(*) as amount
from student
group by gpa_group
order by max(gpa) desc




แสดง
สาขา
ความแตกต่างระหว่างเงินเดือนสูงสุดและต่ำสุด ในสาขานั้น (เป็นคอลัมน์ชื่อ salary_diff)
ของอาจารย์ทุกคน
โดยไม่รวม อาจารย์ที่ไม่มีข้อมูลสาขา และ เงินเดือน
และแสดงเฉพาะ สาขาที่มีผลต่างเงินเดือนมากกว่า 20000 บาท
เรียงลำดับการแสดงผลตาม salary_diff จากน้อยไปมาก


select	major,
		max(salary) - min(salary) as salary_diff
from 	lecturer
where	salary is not null
group by major
having	salary_diff > 20000
order by salary_diff


แสดง
รหัสนิสิต
จำนวนครั้งที่ได้ A (แสดงเป็นคอลัมน์ชื่อ a_amount)
เรียงลำดับตามรหัสนิสิต


select	stdid,
		count(*) as a_amount
from 	enroll
where	grade = 'A'
group by stdid
order by stdid





แสดง รหัสอาจารย์ ชื่ออาจารย์ เงินเดือน และ note
โดย note คือเงินเดือนของอาจารย์

ถ้าเงินเดือน < 30000 low income
ถ้าเงินเดือน < 50000 normal
ถ้าเงินเดือนตั้งแต่ 50000 ขึ้นไป high income

โดยแสดงเฉพาะอาจารย์ที่มีข้อมูลเงินเดือน
เรียงลำดับการแสดงผลตามเงินเดือน

select	lecid,
		name,
		salary,
		case
			when salary < 30000					then 'low income'			
			when salary between 30000 and 50000	then 'normal'
			when salary > 50000					then 'high income'
		end as note
from 	lecturer
where	salary is not null
order by salary



แสดง

ชื่อสาขา,
จำนวนนิสิตในสาขานั้น (แสดงเป็นคอลัมน์ชื่อ amount)
gpa ที่สูงที่สุดในสาขานั้น (แสดงเป็นคอลัมน์ชื่อ max_gpa)
gpa ที่ต่ำที่สุดในสาขานั้น (แสดงเป็นคอลัมน์ชื่อ min_gpa)
gpa เฉลี่ยในสาขานั้น (แสดงเป็นคอลัมน์ชื่อ avg_gpa)

เรียงลำดับตามจำนวนนิสิต จากมากไปน้อย

และต้องไม่แสดง ชื่อสาขา ที่เป็น null


select	major,
		count(*) 	as amount,
		max(gpa)	as max_gpa,
		min(gpa)	as min_gpa,
		avg(gpa)	as avg_gpa
from	student
where	major is not null
group by major
order by amount desc


แสดงรหัสอาจารย์
จำนวนวิชาที่สอนในปี 2025 (ทุกเทอม - แสดงเป็นคอลัมน์ชื่อ amount)
โดยแสดงเฉพาะอาจารย์ที่สอนมากกว่า 1 วิชา
เรียงลำดับตาม จำนวนวิชาที่สอน จากน้อยไปมาก
(ถ้าอาจารย์สอนวิชาเดิมหลายครั้งในปี 2025 ให้นับเป็น 1 วิชา)


select	lecid,
		count(distinct subid) as amount
from	section
where	term like '2025%'
group by lecid
order by amount




