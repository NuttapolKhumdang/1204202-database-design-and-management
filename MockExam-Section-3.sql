-- 15. ⭐
-- แสดง
-- รหัสโปรเจค
-- ชื่อโปรเจค		เป็นคอลัมน์ชื่อ 	project_name
-- ชื่อลูกค้า		เป็นคอลัมน์ชื่อ 	customer_name
-- วันเริ่มต้นโปรเจค
-- โดยแสดงเฉพาะโปรเจคที่มีวันเริ่มต้นในปี 2026
-- เรียงตามรหัสโปรเจค

select 	pro.project_id
		, pro.name 		as project_name
		, cus.name 		as customer_name
		, pro.start_date
from	project  pro
join	customer cus 	on	cus.customer_id = pro.customer_id 
where	year(pro.start_date) = '2026'
order by project_id 


-- 16. ⭐
-- แสดงรหัสพนักงาน ชื่อพนักงาน รหัสโปรเจค และ หน้าที่ในโปรเจค (role)
-- เรียงลาดับตามรหัสพนักงาน

select	emp.employee_id
		, emp.name
		, work.project_id
		, work.role
from	workson work
join	employee emp	on emp.employee_id = work.employee_id 

-- 17. ⭐
-- แสดง
-- รหัสโปรเจค
-- ชื่อโปรเจค
-- ชื่อลูกค้า
-- งบประมาณ
-- เฉพาะโปรเจคที่มีงบประมาณมากกว่า 500,000
-- เรียงลาดับตามงบประมาณจากมากไปน้อย

select 	pro.project_id
		, pro.name
		, cus.name 
		, pro.budget
from	project pro
join	customer cus	on cus.customer_id = pro.customer_id 
where 	pro.budget > 500000
order by budget desc



-- 18. ⭐
-- แสดง
-- รหัสพนักงาน
-- ชื่อพนักงาน 			เป็นคอลัมน์ชื่อ employee_name
-- รหัสโปรเจค
-- ชื่อโปรเจค			เป็นคอลัมน์ชื่อ project_name
-- เฉพาะโปรเจคที่มีวันเริ่มทางานในปี 2026
-- เรียงลาดับตามรหัสพนักงาน และรหัสโปรเจค

select	emp.employee_id 
		, emp.name		as employee_name
		, pro.project_id 
		, pro.name 		as project_name
from	employee emp
join	workson work	on work.employee_id = emp.employee_id
join	project pro		on pro.project_id = work.project_id
where 	year(pro.start_date) = 2026
order by employee_id, project_id 



-- 19. ⭐
-- แสดง
-- รหัสพนักงาน
-- ชื่อพนักงาน 			เป็นคอลัมน์ชื่อ 	employee_name
-- รหัสลูกค้า
-- ชื่อลูกค้า			เป็นคอลัมน์ชื่อ 	customer_name
-- วันที่ meeting
-- เฉพาะการ meeting ที่เกิดขึ้นในปี 2025
-- เรียงลาดับตามวันที่ meeting

select 	emp.employee_id
		, emp.name 		as employee_name
		, cus.customer_id 
		, cus.name 		as customer_name
		, meet.meeting_date
from	meeting meet
join	employee emp	on emp.employee_id = meet.employee_id
join	customer cus	on cus.customer_id = meet.customer_id
where	year(meet.meeting_date) = '2025'
order by meeting_date


-- 20. ⭐⭐
-- แสดง
-- รหัสลูกค้า
-- ชื่อลูกค้า
-- จานวนโปรเจคที่ลูกค้าจ้าง		เป็นคอลัมน์ชื่อ 	project_count
-- งบประมาณรวมที่ลูกค้าจ้าง		เป็นคอลัมน์ชื่อ 	total_budget
-- เรียงลาดับตามรหัสลูกค้า
-- ตัวอย่ำงกำรแสดงผล

select 	cus.customer_id
		, cus.name 
		, count(*)		as project_count
		, sum(pro.budget ) as total_budget
from	project pro
join	customer cus	on cus.customer_id = pro.customer_id
group by cus.customer_id 
order by customer_id 


21. ⭐⭐⭐
แสดง
ปี					เป็นคอลัมน์ชื่อ 	start_year
รหัสลูกค้า
ชื่อลูกค้า
จานวนโปรเจคที่ลูกค้าจ้าง	เป็นคอลัมน์ชื่อ 	project_count
งบประมาณรวมที่ลูกค้าจ้าง	เป็นคอลัมน์ชื่อ 	total_budget
เรียงลาดับตามปี และ รหัสลูกค้า

select 	year(pro.start_date) 	as start_year
		, cus.customer_id
		, cus.name
		, count(*)				as project_count
		, sum(pro.budget)		as total_budget
from	project pro
join	customer cus	on cus.customer_id = pro.customer_id 
group by start_year, customer_id
order by start_year, customer_id




-- 22. ⭐⭐⭐
-- แสดง
-- รหัสโปรเจค
-- ชื่อโปรเจค
-- จานวนพนักงานที่ทางานในโปรเจค เป็นคอลัมน์ชื่อ employee_count
-- โดยแสดงทุกโปรเจค แม้ว่าจะยังไม่มีพนักงาน ถ้ายังไม่มีพนักงาน ให้แสดงจานวนเป็น 0
-- เรียงลาดับตามรหัสโปรเจค

select	pro.project_id
		, pro.name 
		, count(work.employee_id) as employee_count
from	project pro 	
left join workson work 	on work.project_id = pro.project_id 
group by project_id
order by project_id


-- 23. ⭐⭐⭐
-- แสดง
-- รหัสพนักงาน
-- ชื่อพนักงาน
-- จานวนวันลาทั้งหมด เป็นคอลัมน์ชื่อ total_days
-- โดยแสดงพนักงานทุกคน แม้ว่าจะไม่เคยลา โดยให้แสดงจานวนเป็น 0
-- เรียงลาดับตามรหัสพนักงาน

select 	emp.employee_id 
		, emp.name 
		, ifnull(sum(lev.days), 0) as total_days
from 	employee emp
left join leaves lev 	on lev.employee_id = emp.employee_id 
group by employee_id



-- 24. ⭐⭐⭐
-- แสดง
-- รหัสพนักงาน
-- ชื่อพนักงาน
-- จานวนครั้งที่ลาในปี 2026 		 	เป็นคอลัมน์ชื่อ leave_count
-- จานวนวันลาทั้งหมดในปี 2026 		เป็นคอลัมน์ชื่อ total_days
-- โดยแสดงพนักงานทุกคน แม้ว่าปี 2026 จะไม่เคยลา โดยให้แสดงจานวนเป็น 0
-- เรียงลาดับตามรหัสพนักงาน

select 	emp.employee_id
		, emp.name  
		, count(lev.leave_id)		as leave_count
		, ifnull(sum(lev.days), 0)	as total_days
from	employee emp
left join leaves lev		on lev.employee_id = emp.employee_id
where 	year(lev.leave_date) = '2026'
	or	lev.leave_id is null 
group by emp.employee_id


-- 25. ⭐⭐⭐
-- แสดง
-- รหัสพนักงาน
-- ชื่อพนักงาน
-- ชื่อหัวหน้า 			เป็นคอลัมน์ชื่อ supervisor_name
-- โดยแสดงพนักงานทุกคน แม้ว่าจะไม่มีหัวหน้า
-- เรียงลาดับตามรหัสพนักงาน

select 	emp.employee_id 
		, emp.name
		, sup.name 			as supervisor_name
from	employee emp
left join employee sup		on sup.employee_id  = emp.supervisor_id
order by employee_id 


-- 26. ⭐⭐⭐
-- แสดง
-- รหัสหัวหน้า
-- ชื่อหัวหน้า
-- จานวนลูกน้อง 			เป็นคอลัมน์ชื่อ subordinate_count
-- โดยแสดงพนักงานทุกคน แม้ว่าจะไม่มีลูกน้อง
-- เรียงลาดับตามรหัสพนักงาน

select 	sup.employee_id
		, sup.name 
		, count(emp.employee_id)		as subordinate_count
from	employee emp
join	employee sup	on sup.employee_id = emp.supervisor_id 
group by sup.employee_id, sup.name 
order by employee_id 


-- 27. ⭐⭐
-- แสดงรหัสพนักงาน ชื่อพนักงาน แผนก เงินเดือน
-- ของพนักงานที่มีเงินเดือนมากกว่าเงินเดือนเฉลี่ยของทั้งบริษัท

select 	employee_id
		, name
		, department
		, salary
from	employee
where 	salary > (
			select avg(salary) 
			from employee
		)

		
-- 28. ⭐⭐
-- แสดงรหัสโปรเจค ชื่อโปรเจค และงบประมาณ ของโปรเจคที่มีงบประมาณสูงที่สุด

select	project_id
		, name
		, budget 
from	project
where	budget = (
			select max(budget)
			from project
		)


-- 29. ⭐⭐⭐
-- แสดงรหัสพนักงาน ชื่อพนักงาน แผนก เงินเดือน
-- ของพนักงานที่มีเงินเดือนสูงที่สุดในแต่ละแผนก

select 	employee_id
		, name
		, department
		, salary
from	employee
where 	salary in (
			select max(salary)
			from employee
			group by employee.department 
		) 


-- 30. ⭐⭐⭐
-- แสดง รหัสพนักงาน ชื่อพนักงาน ที่ในปี 2026 ยังไม่ได้ทาโปรเจคใด ๆ เลย

select 	employee_id 
		, name
from employee
where	employee_id not in (
			select 	distinct employee_id 
			from 	workson
		)

		
-- 31. ⭐⭐⭐
-- แสดง รหัสลูกค้า ชื่อลูกค้า
-- ที่มีการทาจ้างโปรเจคทั้งในปี 2025 และ 2026

select 	cus.customer_id
		, cus.name 
from	project pro
join	customer cus	on cus.customer_id = pro.customer_id 
where 	year(pro.start_date) = '2025'

	intersect

select 	cus.customer_id
		, cus.name 
from	project pro
join	customer cus	on cus.customer_id = pro.customer_id  
where 	year(pro.start_date) = '2026'


32. ⭐⭐⭐
แสดง
ชื่อลูกค้า
จานวนครั้งการประชุมของลูกค้าแต่ละคน		เป็นคอลัมน์ชื่อ meeting_count
และวันประชุมล่าสุด					เป็นคอลัมน์ชื่อ last_meeting

select	cus.name
		, count(*)					as meeting_count
		, max(meet.meeting_date) 	as last_meeting
from	meeting meet
join	customer cus 	on cus.customer_id  = meet.customer_id 
group by cus.customer_id 




