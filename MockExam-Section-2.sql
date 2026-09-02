-- 1. ⭐แสดงข้อมูลพนักงานที่อยู่แผนก dev และมีเงินเดือนมากกว่า 30000
select	*
from 	employee
where	department = 'dev'
	and	salary > 30000 


-- 2. ⭐แสดงข้อมูลพนักงานที่ไม่มีหัวหน้า
select 	*
from 	employee
where 	supervisor_id is null
	

-- 3. ⭐แสดงข้อมูลการลา ประเภทพักร้อน (vacation) ที่ลาตั้งแต่ 3 วันขึ้นไป ในปี 2025 เรียงลาดับตาม leave_id
select	*
from	leaves
where	days >= 3
	and year(leave_date) = 2025
	and leave_type  = 'vacation'
order by leave_id 

-- 4. ⭐
-- แสดงข้อมูลโปรเจคที่งบประมาณมากกว่า 500000
-- และ มีระยะเวลาตามแผนมากกว่า 60 วัน
-- เรียงลาดับตามงบประมาณจากมากไปน้อย	
select	*
from 	project 
where	budget > 500000
	and duration  > 60
order by budget 


-- 5. ⭐
-- แสดง
-- เงินเดือนเฉลี่ย เป็นคอลัมน์ชื่อ avg_salary
-- เงินเดือนต่าสุด เป็นคอลัมน์ชื่อ min_salary
-- เงินเดือนสูงสุด เป็นคอลัมน์ชื่อ max_salary
-- ของพนักงานทั้งบริษัท
select	avg(salary) 	as aavg_salary
		, min(salary)	as min_salary
		, max(salary)	as max_salary
from	employee


-- 6. ⭐⭐
-- แสดง
-- รหัสลูกค้า
-- จานวนโปรเจคที่ลูกค้าจ้าง 		เป็นคอลัมน์ชื่อ	project_count
-- งบประมาณทั้งหมดที่ลูกค้าจ้าง 	เป็นคอลัมน์ชื่อ	budget_sum
-- เรียงลาดับตามรหัสลูกค้า
select	customer_id
		, count(*)		as project_count 
		, sum(budget)	as budget_sum
from	project
group by customer_id 
order by customer_id 


-- 7. ⭐⭐
-- แสดง
-- รหัสลูกค้า
-- ปี						เป็นคอลัมน์ชื่อ	year
-- จานวนโปรเจคที่ลูกค้าจ้าง		เป็นคอลัมน์ชื่อ	project_count
-- งบประมาณทั้งหมดที่ลูกค้าจ้าง 	เป็นคอลัมน์ชื่อ	budget_sum
-- โดยคิดเฉพาะโปรเจคที่มีวันเริ่มต้นในปี 2026
-- เรียงลาดับตามรหัสลูกค้า
select 	customer_id
		, year(start_date)	as year
		, count(*)			as project_count
		, sum(budget)		as budget_sum
from project
group by customer_id, `year`
having year = '2026'




-- 8. ⭐⭐
-- แสดง
-- รหัสพนักงาน
-- ปี							เป็นคอลัมน์ชื่อ	year
-- จานวนวันลาทั้งหมดในปีนั้น ๆ		เป็นคอลัมน์ชื่อ	total_leaves
-- เรียงลาดับตาม ปี และ รหัสพนักงาน
select	employee_id
		, year(leave_date) 	as year
		, sum(days)			as total_leaves
from	leaves
group by employee_id, year 
order by `year`, employee_id 


-- 9. ⭐⭐⭐
-- แสดง
-- รหัสพนักงาน
-- ประเภทการลา
-- จานวนครั้งที่ลาประเภทนั้น ๆ		เป็นคอลัมน์ชื่อ 	count_leaves
-- จานวนวันลารวมประเภทนั้น ๆ		เป็นคอลัมน์ชื่อ 	total_days
-- เรียงลาดับตามรหัสพนักงาน
select 	employee_id
		, leave_type
		, count(*)		as count_leaves
		, sum(days)		as total_days
from	leaves 
group by employee_id, leave_type 
order by employee_id 


-- 10. ⭐⭐
-- แสดง
-- รหัสพนักงาน
-- จานวนโปรเจคที่ทาทั้งหมด 					เป็นคอลัมน์ชื่อ	total_project
-- โดยแสดงเฉพาะพนักงานที่ทาโปรเจคมากกว่า 2 โปรเจค
-- เรียงลาดับตามรหัสพนักงาน
select	employee_id
		, count(*)	as total_project
from	workson
group by employee_id 
having total_project > 2


-- 11. ⭐⭐
-- นับจานวนพนักงานในแต่ละแผนก โดยแสดง
-- ชื่อแผนก
-- จานวนพนักงานในแผนกนั้น ๆ		เป็นคอลัมน์ชื่อ 	emp_count
-- โดยนับเฉพาะพนักงานที่มีข้อมูลแผนกอยู่
-- เรียงลาดับตาม จานวนพนักงานจากมากไปน้อย
select	department
		, count(*) 	as emp_count
from	employee 
where	department is not null
group by department 


-- 12. ⭐⭐⭐
-- แสดง
-- เดือน 						เป็นคอลัมน์ชื่อ 	month,
-- จานวนโปรเจคที่เริ่มทาในแต่ละเดือน	เป็นคอลัมน์ชื่อ 	count_project
-- เฉพาะโปรเจคที่มีวันเริ่มต้นในปี 2026
-- เรียงลาดับตามเดือน
select	month(start_date)	as month
		, count(*)			as count_project
from	project
where	year(start_date) = '2026'
group by month
order by month


-- 13. ⭐⭐⭐
-- แสดงโปรเจคที่ทาเสร็จช้ากว่ากาหนด (วันเสร็จจริงเกิน วันเริ่ม + duration วัน)
-- โดยแสดง รหัสโปรเจค ชื่อโปรเจค วันเริ่มต้น จานวนวันทางานตามแผน วันสิ้นสุดจริง และ
-- จานวนวันที่ช้ากว่ากาหนด โดยแสดงเป็นคอลัมน์ชื่อ day_late
select 	project_id
		, name
		, start_date
		, duration
		, finish_date
		, datediff(finish_date, adddate(start_date, duration)) as day_late
from 	project  
where	timestampdiff(day, start_date , finish_date) > duration 


-- 14. ⭐⭐⭐⭐
-- แสดง
-- รหัสโปรเจค ชื่อโปรเจค วันเริ่มต้น จานวนวันทางาน วันสิ้นสุดจริง
-- จานวนวันที่แตกต่างจากที่กาหนด 			เป็นคอลัมน์ชื่อ 	day_diff
-- และ คอลัมน์ remarks
-- โดย คอลัมน์ remarks ให้แสดงคาว่า เร็วกว่ากาหนด, ตรงตามกาหนด หรือช้ากว่ากาหนด ตามการทางานของโปรเจคนั้น
-- กรณีโปรเจคเสร็จเร็วกว่ากาหนด day_diff แสดงเป็นค่าลบ
-- โดยแสดงเฉพาะโปรเจคที่มีวันสิ้นสุดจริงแล้ว
-- เรียงลาดับตามรหัสโปรเจค
select 	project_id
		, name
		, start_date
		, duration
		, finish_date
		, datediff(finish_date, adddate(start_date, duration)) as day_diff
		, case 
			when datediff(finish_date, adddate(start_date, duration)) > 0	then 'ช้ากว่ากำหนด'  
			when datediff(finish_date, adddate(start_date, duration)) < 0	then 'เร็วกว่ากำหนด'
			else 'ตรงตามกำหนด'
		  end as remarks
from 	project  
order by project_id 











