use project ;
select * from hr ;
select count(*) from hr ;
-- 1
select gender,count(*) from hr
where termdate IS  NULL group by gender ;
-- 2
select distinct race from hr;
select race , count(*) from hr 
where termdate is null 
group by race  order by count(*) desc;
-- 3
select 
case 
when age <=  24 then "22-24"
when age >= 25 and age <= 34 then "25-34" 
when age >= 35 and age <= 44 then "35-44" 
when age >= 45 and age <= 54 then "45-54" 
when age >= 55 then "55-59"
end as age_group,gender,count(*) as count
from hr where termdate is null 
group by age_group , gender 
order by age_group , gender ;
-- 4
select location , count(*) As count 
from hr 
where termdate is null 
group by location 
order by count desc ;
-- 5
select 
round(avg (datediff(termdate,hire_date)) /360,0) 
as avg_length_employment 
from hr
where termdate is not null and termdate <= curdate(); 
-- 6
select 
department , gender , count(*)
from hr 
where termdate is  null 
group by department , gender 
order by department ; 
-- 7
select jobtitle,count(*) as count
from hr
where termdate is null
group by jobtitle 
order by jobtitle desc ;
-- 8
select department,total_count , terminated_count , terminated_count/total_count as termination_rate 
from (select department , count(*) as total_count 
,sum(case when termdate is not null and termdate <= curdate() 
then 1 
else 0 end ) as terminated_count
from hr  
group by department )
as subquery  
order by termination_rate desc ;
-- 9 
select location_city , count(*) as count 
from hr 
where termdate is null 
group by location_city 
order by count desc ;
-- 10
select 
year , hires , terminations , hires-terminations as net_change 
,round ((hires-terminations)/hires*100,2) as net_change_percent 
from (select year(hire_date) as year , count(*) as hires , sum(case when termdate is not null and  termdate <= curdate() 
then 1 
else 0 
end ) as terminations 
from hr 
group by year( hire_date)) as subquery
order by year  ;
-- 11
select department , round(avg(datediff(termdate,hire_date)/365),0) as avg_tenure 
from hr 
where termdate is not null and termdate <= curdate()
group by department ;

select 
case 
when age <=  24 then "22-24"
when age >= 25 and age <= 34 then "25-34" 
when age >= 35 and age <= 44 then "35-44" 
when age >= 45 and age <= 54 then "45-54" 
when age >= 55 then "55-59"
end as age_group,count(*) as count
from hr where termdate is null 
GROUP BY age_group
order by age_group; 

