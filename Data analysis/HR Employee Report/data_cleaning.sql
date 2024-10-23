CREATE DATABASE project;
USE project ;
-- DATA CLEANING 
RENAME TABLE `human resources` TO hr;
select*from hr;
ALTER TABLE hr
RENAME COLUMN ï»¿id TO emp_id;
ALTER TABLE hr
MODIFY COLUMN emp_id varchar(20) NULL;
-- ALTER TABLE hr
-- change COLUMN ï»¿id  emp_id varchar(20) null ; ## another way 
select * from hr ;
desc hr;
select birthdate from hr ;
SET SQL_SAFE_UPDATES = 0;
UPDATE hr
SET birthdate = case 
when birthdate like "%/%" then date_format(str_to_date(birthdate,"%m/%d/%Y"), "%Y-%m-%d")
when birthdate like "%-%" then date_format(str_to_date(birthdate,"%m-%d-%Y"), "%Y-%m-%d") 
else null 
end ;
select birthdate from hr ;
alter table hr 
modify column birthdate date;
select*from hr ;
Update hr 
SET hire_date = case 
when hire_date like "%/%" then date_format(str_to_date(hire_date,"%m/%d/%Y"), "%Y-%m-%d")
when hire_date like "%-%" then date_format(str_to_date(hire_date,"%m-%d-%Y"), "%Y-%m-%d") 
else null 
end ;
select hire_date from hr;
alter table hr 
modify column hire_date date;

update hr 
set termdate = date(str_to_date(termdate,"%Y-%m-%d %H:%i:%s UTC"))
where termdate is not null and termdate !='';
 
UPDATE hr 
SET termdate = NULL 
WHERE termdate = '0000-00-00';
ALTER TABLE hr 
MODIFY COLUMN termdate DATE;
DESC hr;
alter table hr 
add column age int ;
update hr
set age = timestampdiff(YEAR,birthdate,curdate()) ;
select * from hr ;
select 
min(age) as youngest ,
max(age) as oldest 
from hr ;

select count(age) from hr where age <= 18 ;
select count(age) from hr where age >= 18 ;
DELETE FROM hr 
WHERE age < 18;
select count(*) from hr ;
