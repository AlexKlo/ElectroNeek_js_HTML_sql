create database testDB;

use testDB;
create table department(
d_id int not null auto_increment,
d_name varchar(100),
primary key (d_id)
) ENGINE=InnoDB;

create table employee(
e_id int not null,
d_id int,
chief_id int,
e_name varchar(100),
salary numeric,
primary key (e_id, d_id)
) ENGINE=InnoDB;

 
 insert into department (d_id, d_name) values(1, "Implement");
 insert into department (d_id, d_name) values(2, "QA");
 insert into department (d_id, d_name) values(3, "Dev");
 select * from department;

insert into employee (e_id, d_id, chief_id, e_name, salary) values(1, 1, 1, "name1", 100);
insert into employee (e_id, d_id, chief_id, e_name, salary) values(2, 2, 2, "name2", 200);
insert into employee (e_id, d_id, chief_id, e_name, salary) values(3, 3, 1, "name3", 170);
insert into employee (e_id, d_id, chief_id, e_name, salary) values(4, 1, 2, "name4", 250);
insert into employee (e_id, d_id, chief_id, e_name, salary) values(5, 2, 1, "name5", 350);
insert into employee (e_id, d_id, chief_id, e_name, salary) values(6, 3, 2, "name6", 500);
insert into employee (e_id, d_id, chief_id, e_name, salary) values(7, 3, 2, "name7", 50);
select * from employee;

# task 1
select e1.e_id, e1.e_name 
from   employee e1
where  e1.salary = ( select max(salary) from employee e2
                    where  e2.d_id = e1.d_id );
                    
# task 2
select e.d_id, count(e.e_id) as cnt_id
from employee e
group by e.d_id
having count(e.e_id) < 3;

# task 3
with sum_sal as
  ( select d_id, sum(salary) salary
    from   employee
    group  by d_id )
select d_id, s.salary
from   sum_sal s       
where  s.salary = ( select max(salary) from sum_sal );

# task 4
insert into department (d_id, d_name) values(4, "Managment");

# task 5
insert into employee (e_id, d_id, chief_id, e_name, salary) values(8, 4, 3, "name8", 450);
insert into employee (e_id, d_id, chief_id, e_name, salary) values(9, 4, 3, "name9", 750);
insert into employee (e_id, d_id, chief_id, e_name, salary) values(10, 4, 3, "name10", 450);

# task 6
delete from department
where d_id = 4;
select * from department;

SET SQL_SAFE_UPDATES = 0;
delete from employee 
where d_id = 4;
select * from employee;

# task 7
update department
set d_id = 22
where d_id = 2;

update employee
set d_id = 22
where d_id = 2;




