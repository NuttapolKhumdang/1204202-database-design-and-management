
/*

show tables
drop table enroll;
drop table lecturer;
drop table section;
drop table student;
drop table subject;

drop table if exists leaves;
drop table if exists workson;
drop table if exists project;
drop table if exists meeting;
drop table if exists customer;
drop table if exists employee;

**/

create table employee (
	employee_id		varchar(6) not null,
	name			varchar(100) not null,
	salary 			decimal(7, 2) not null,
	department		varchar(50),
	supervisor_id	varchar(6) null,
	
	constraint pk_emp 		primary key (employee_id),
	constraint fk_emp_supervisor 	foreign key (supervisor_id) references employee (employee_id),
	constraint chk_emp_salary 	check (salary > 0)
);


create table customer (
	customer_id		varchar(6) not null,
	name			varchar(100) not null,
	phone			varchar(10) not null,
	
	constraint pk_cus 		primary key (customer_id)
);


create table meeting (
	meeting_id		varchar(6) not null,
	employee_id		varchar(6) not null,
	customer_id		varchar(6) not null,
	meeting_date	date not null,
	location		varchar(100),
	
	constraint pk_meeting		primary key (meeting_id),
	constraint fk_meeting_employee 	foreign key (employee_id) references employee (employee_id),
	constraint fk_meeting_customer 	foreign key (customer_id) references customer (customer_id)
); 


create table project (
	project_id		varchar(8) 		not null,
	customer_id		varchar(6) 		not null,
	name			varchar(100) 	not null,
	budget			decimal (12, 2) not null,
	start_date		date 			not null,
	duration		int 			not null,
	finish_date		date 			null,
	
	constraint pk_project		primary key	(project_id),
	constraint fk_customer		foreign key (customer_id) references customer (customer_id),
	constraint chk_project_budget 	check (budget > 0),
	constraint chk_project_duration check (duration between 1 and 100),
	constraint chk_project_finish	check (finish_date > start_date)
); 


create table workson (
	work_id			int				not null,
	project_id		varchar(8)		not null,
	employee_id		varchar(6)		not null,
	role			varchar(100)	not null,
	
	constraint pk_workson		primary key (work_id),
	constraint fk_workson_project	foreign key (project_id) references project (project_id),	
	constraint fk_workson_employee	foreign key (employee_id) references employee (employee_id)
);


create table leaves (
	leave_id		int				not null,
	employee_id		varchar(6)		not null,
	leave_type		varchar(20)		not null,
	leave_date		date			not null,
	days			int				not null,
	
	constraint pk_leaves		primary key (leave_id),
	constraint fk_leaves_employee	foreign key (employee_id) references employee (employee_id),
	constraint chk_leaves_days	check (days between 1 and 5)
);






