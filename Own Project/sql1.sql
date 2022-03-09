--sqlplus (code to create a user and tables)
connect sys/oracle as sysdba;
alter session set container=orclpdb;
create user result identified by result;
grant all privileges to result;
connect result/result@//localhost:1521/orclpdb


create table student (sid number(5) primary key, sname varchar(25));
create table subject(sid number(5) references student(sid), subname varchar(25), marks number(5) );

insert all
into student values (1, 'Sarath');
into student values (2, 'Lindsey');
into student values (3, 'Stephen');
into student values (4, 'Jonathon');
into student values (5, 'Clara');
into subject values(1, 'Maths', 90 );
into subject values(1, 'Electronics', 95 );
into subject values(1, 'Computer Science', 80 );
into subject values(2, 'Maths', 20 );
into subject values(2, 'Electronics', 50 );
into subject values(2, 'Computer Science', 70 );
into subject values(3, 'Maths', 50 );
into subject values(3, 'Electronics', 30 );
into subject values(3, 'Computer Science', 90 );
into subject values(4, 'Maths', 80 );
into subject values(4, 'Electronics', 50 );
into subject values(4, 'Computer Science', 90 );
into subject values(5, 'Maths', 60 );
into subject values(5, 'Electronics', 70 );
into subject values(5, 'Computer Science', 90 );
select *from dual;