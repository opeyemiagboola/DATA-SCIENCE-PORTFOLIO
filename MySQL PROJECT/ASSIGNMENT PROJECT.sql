create database if not exists employees;

use employees;
create table employees (
employeeNO int auto_increment primary key, 
firstname varchar (14) not null,
lastname varchar (16) not null,
birthdate date not null,
gender enum('M','F') not null,
hiredate date not null
);

create table departments (
departmentNo char (4) primary key,
departmentname varchar (40)  unique not null
);

create table dept_managers (
employeeNO int ,
departmentNO char(4) ,
fromdate date not null,
todate date not null,
foreign key (employeeNO) references employees(employeeNO),
foreign key (departmentNO) references departments (departmentNO)
);

create table dept_employee (
employeeNO int,
departmentNO char(4),
fromdate date not null,
todate date not null,
foreign key (employeeNO) references employees(employeeNO),
foreign key (departmentNO) references departments (departmentNO)
);

create table tittles (
employeeNO int,
tittle varchar (50) primary key,
fromdate date not null,
todate date,
foreign key (employeeNO) references employees (employeeNO)
);

create table salaries (
employeeNO int,
salary double not null,
fromdate date not null,
todate date not null,
foreign key (employeeNO) references employees (employeeNO)
);

insert into employees (employeeNO, firstname ,lastname ,birthdate,gender ,hiredate )
values (1001, "John", "Smith","15/03/1985",	"M","20/05/2010"),		
(1002,	"Sarah",	"Johnson",	"22/07/1990",	"F","10/02/2012"),		
(1003,	"Michael",	"Williams",	"05/12/1988",	"M",	"14/08/2011"),		
(1004,	"Emily","Brown","30/04/1992","F","02/03/2015"),		
(1005,	"Robert","Davis	18/09/1986",	"M",	"17/06/2014"),		
(1006,	"Jessica",	"Anderson",	"25/11/1991",	"F",	"05/04/2013"),		
(1007,	"William",	"Jones",	"10/01/1989","M","30/09/2016"),		
(1008,	"Olivia",	"Martinez","12/08/1993",	"F",	"20/11/2017"),		
(1009,	"David"	,"Miller",	"03/06/1987","M",	"28/02/2018"),		
(1010,	"Sophia","Wilson",	"14/02/1994",	"F",	"10/07/2019"),		
(1011,	"Joseph","Taylor",	"27/05/1990",	"M",	"15/10/2012"),		
(1012,	"Emma",	"Anderson",	"08/10/1988",	"F",	"12/03/2011"),	
(1013,	"Andrew",	"Hernandez",	"03/09/1995",	"M",	"19/12/2013"),		
(1014,	"Mia",	"Lopez",	"01/07/1991",	"F",	"25/05/2017"),		
(1015,	"James",	"Lee",	"14/04/1986",	"M",	"08/01/2016"),		
(1016,	"Charlotte",	"Harris",	"09/11/1992",	"F",	"23/08/2014"),		
(1017,	"Benjamin",	"Clark",	"20/02/1989	","M",	"30/04/2018"),		
(1018,	"Harper",	"Turner",	"04/03/1994",	"F",	"27/06/2015");

insert into departments (departmentNo ,departmentname)
values (






