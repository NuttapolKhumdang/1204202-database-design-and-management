-- 62 แสดง ข้อมูลของนิสิต โดยสนใจนิสิตที่ตรงตามเงื่อนไขนี้
-- ถ้าอยู่สาขา cs 		ได้ gpa > 3.00
-- ถ้าอยู่สาขา Math 		ได้ gpa > 3.20
-- ถ้าอยู่สาขา art 		ได้ gpa > 3.50
select	*
from	student
where 	gpa > 
		case major
			when 'cs' 	then 3.00
			when 'math'	then 3.20
			when 'art'	then 3.50
		end

-- 63 แสดงข้อมูลการลงทะเบียน ชื่อ และอายุของนิสิต โดยสนใจนิสิตที่ตรงตามเงื่อนไขนี้
-- ถ้าอยู่สาขา cs  		อายุ > 18 ปี
-- ถ้าอยู่สาขา Art	  	อายุ > 19 ปี
-- ถ้าอยู่สาขา English  	อายุ > 17 ปี
-- ถ้าอยู่สาขาอื่น ๆ  		อายุ > 20 ปี
select 	name,
		timestampdiff(year, birthday, curdate()) as age
from	student
where 	timestampdiff(year, birthday, curdate()) >
		case major 
			when 'cs'		then 18
			when 'art'		then 19
			when 'english' 	then 17
			else				 20
		end


-- 64 เพิ่มเงินเดือนให้อาจารย์ โดยเพิ่มตามเงื่อนไขคือ
-- ถ้าอาจารย์ได้เงินเดือน <= 30000 บาท 		เพิ่มเงินเดือนให้ 	20 %
-- ถ้าอาจารย์ได้เงินเดือน 30001 - 40000 บาท 	เพิ่มเงินเดือนให้  	10 %
-- ถ้าอาจารย์ได้เงินเดือน 40001 - 50000 บาท 	เพิ่มเงินเดือนให้ 	 5 %
-- ถ้าอาจารย์ได้เงินเดือนสูงกว่า 50000 บาท 		ไม่ต้องเพิ่มเงินเดือน
update 	lecturer
set		salary = salary *
			case 
				when salary < 30000						then 1.2
				when salary between 30001 and 40000		then 1.1
				when salary between 40001 and 50000		then 1.05
				else 									     1
			end 