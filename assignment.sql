CREATE Table salesman_master(name VARCHAR(20) NOT NULL,salesman_id CHAR(2) PRIMARY KEY
 ,address VARCHAR(30), salary BIGINT, cost_price DOUBLE(8,2) NOT NULL, state VARCHAR(15),
 city VARCHAR(15), date_of_joining DATE);


CREATE Table client_master(name VARCHAR(20) NOT NULL,client_id CHAR(2) PRIMARY KEY,
    address VARCHAR(30) , city VARCHAR(15) , pincode INTEGER, state VARCHAR(15) );


CREATE Table product_master(description VARCHAR(20) NOT NULL,product_id CHAR(2) PRIMARY KEY,
     ,sell_price DOUBLE(8,2), quantity INTEGER, cost_price DOUBLE(8,2) NOT NULL);


alter table product_master add owner varchar(20) , add constraint FOREIGN KEY(owner) REFERENCES client_master(client_id);
alter table product_master add FOREIGN key (owner) REFERENCES client_master(client_id);



alter table product_master add constraint profit_margin check(sell_price > (1.5*cost_price));


insert into product_master(description,product_id,sell_price,cost_price)
values

('ok', 'aa' ,200 , 100 )
, ('not ok','ab',120,100);


create table sales_order (s_order_no VARCHAR(6) PRIMARY KEY);

create table challan_header (challan_no VARCHAR(6) PRIMARY KEY, s_order_no VARCHAR(6) REFERENCES sales_order(s_order_no) , challan_date DATE
NOT NULL, billed_yn CHAR(1) );

insert into challan_header (challan_no,s_order_no,challan_date,billed_yn) values

    ( 'CH9001', '019001' , '1995-12-12',  'Y')
    ,
    ('CH865', '04865' , '1995-11-12' , 'Y')
;

insert into client_master
(name,client_id, address, city, pincode, state) values 
('manu','10','fine','ok',123,'lol');


alter table client_master modify column client_id VARCHAR(5) NOT NULL;

alter table client_master drop FOREIGN KEY client_id;

select * from challan_header;

create table challan_details(challan_no VARCHAR(6) PRIMARY KEY REFERENCES product_master(product_id));

alter table challan_details ADD COLUMN quantity INT NOT NULL;

select * from product_master where ((((sell_price-cost_price)/cost_price)*100)>=20 && (((sell_price-cost_price)/cost_price)*100)<=30);


create table employee(emp_no VARCHAR(6) PRIMARY KEY, emp_name VARCHAR(20), dob DATE , address VARCHAR(30), doj DATE, mobile VARCHAR(10), dept_no varchar(6), salary NUMERIC(8,2));


create table department(dept_no VARCHAR(6) PRIMARY KEY, dept_name VARCHAR(20),location VARCHAR(30));

alter table employee modify column dept VARCHAR(6);
insert into employee (emp_no, emp_name , dob , address , doj , mobile , dept , salary) values
('1', 'virat', '1988-11-17', 'delhi', '2020-09-09', '123456', '1', 1000.25),
('2', 'burns', '1988-11-13' ,'hethero', '2021-03-08', '123456', '2', 10.2)
;

alter table employee rename column dept to dept_no;

insert into employee (emp_no, emp_name , dob , address , doj , mobile , dept_no , salary) values
('3', 'hameed', '1988-11-17', 'laksar', '2020-09-09', '123456', '2', 100.25),
('4', 'smith', '1988-11-13' ,'adelaide', '2021-03-08', '123456', '3', 50.2),
('5', 'abd', '1988-11-13' ,'capetown', '2021-03-08', '123456', '4', 5000.2)
;

insert into department (dept_no , dept_name , location) values 
('1', 'bcci' , 'india'),
('2', 'ecb' , 'england'),
('3', 'ca' , 'australia'),
('4', 'rsa' , 'south africa');

select * from employee where salary >= (select avg(salary) from employee);

select * from employee where salary = (select min(salary) from employee);

select emp_no,emp_name,max(salary) from employee where dept_no = 1;

select emp_name,emp_no from employee where salary = (select max(salary) from employee where dept_no = 1);

select * from employee group by dept_no;

SELECT StudentCourse.COURSE_ID, Student.NAME, Student.AGE FROM Student
INNER JOIN StudentCourse
ON Student.ROLL_NO = StudentCourse.ROLL_NO;

select employee.emp_name , employee.emp_no , department.dept_name From employee 
inner join department
ON employee.dept_no = department.dept_no;


 select employee.emp_name , employee.address , department.dept_name from employee left join 
     department on
     employee.dept_no = department.dept_no;


 select employee.emp_name , employee.address , department.dept_name from employee right join 
     department on
     employee.dept_no = department.dept_no;

create table emp2(emp_no varchar(4), emp_name varchar(20), dept int , FOREIGN KEY (dept) REFERENCES departments(dept_id),salary NUMERIC(8,2), doj DATE, branch_id int, FOREIGN KEY (branch_id) REFERENCES  locations(loc_id) );


create table departments(dept_id int PRIMARY KEY , dept_name VARCHAR(20));

create Table locations(loc_id INT PRIMARY KEY, loc_name VARCHAR(20));

INSERT INTO departments (dept_id,dept_name) VALUES (1,'production'),(2,'HR'),(3,'Management'),(4,'IT'),(5,'civil');

INSERT INTO locations (loc_id,loc_name) VALUES (1, 'Bangalore'), (2,'Mysore'), (3, 'CHennai');

INSERT INTO emp2 (emp_no, emp_name , dept , salary, doj , branch_id) VALUES 
('E101', 'Amit', 1 , 45000, '2000/03/12', 1);


INSERT INTO emp2 (emp_no, emp_name , dept , salary, doj , branch_id) VALUES 
('E102', 'Amit' , 2 , 70000, '2002/07/03', 1),
('E103', 'Sunita' , 3 , 120000, '2001/01/01', 2),
('E104', 'Sunita' , 4 , 67000, '2001/08/01', 2),
('E105', 'mahesh' , 5 , 145000, '2003/09/20', 3);

SELECT SUM(salary) FROM emp2 WHERE salary>=120000;

SELECT emp_name from emp2 ORDER BY emp_name DESC;

SELECT * FROM emp2 WHERE salary>50000 and emp_name = 'Amit';

SELECT emp_name, SUM(salary) from emp2 GROUP BY emp_name;

CREATE VIEW manager AS SELECT emp_name , dob FROM employee WHERE dob >= '1988-01-01';

DROP VIEW manager;


-- assignemnt 9;

CREATE TABLE Department(dno VARCHAR(5) PRIMARY KEY , dname VARCHAR(20));

CREATE TABLE Branch(bcode VARCHAR(5) PRIMARY KEY , bname VARCHAR(20) , dno VARCHAR(5) ,

CONSTRAINT FOREIGN KEY (dno)
REFERENCES Department(dno)
ON DELETE CASCADE
ON UPDATE CASCADE
);

CREATE TABLE Student (roll_no VARCHAR(5) PRIMARY KEY , name VARCHAR(20) , dob DATE , gender CHAR(1) , doa DATE ,
bcode VARCHAR(5),
CONSTRAINT FOREIGN KEY (bcode)
REFERENCES Department(dno)
ON DELETE CASCADE
ON UPDATE CASCADE
)

CREATE TABLE Course ()



///====================mongoose=================================================================///
const mongoose = require('mongoose');
mongoose.connect('mongodb://localhost:27017/test')
.then(()=>{console.log("yay");})
.catch((err)=>{console.log(err);});

const movieSchema = new mongoose.Schema({
    title : String,
    year : Number,
    score : Number ,
    rating : String
});


// make a model using the schema

// mongoose will create a collection for us movies. Plural of Movie
const Movie = mongoose.model('Movie' , movieSchema); // this gives us a class

const first = new Movie({title : "first" , year : 2000 , score : 8 , rating : 'R'}); // new instance of movie

Movie.insertMany([
   {title : 'OH YEAG' , year : 1999 , score :1 , rating : 'A'},
   {title: 'Moon' , year : 2001 , score: 10 , rating : 'S'},
   {title : 'SKG' , year : 2001 , score : 10 , rating : 'H'},
   {title : 'KSH' , year : 2000 , score : 9 , rating : 'A'},
   {title : 'SHR' , year : 2002 , score : 8 ,rating : 'B'}
]);

Movie.findOneAndDelete({title : 'Moon'});


////////=====================================================================///////////////////////////////////////
