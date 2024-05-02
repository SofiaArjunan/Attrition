use attritiondb;
select *
from attrition1;

create table attrition2
like attrition1;

insert attrition2
select *
from attrition1;

select *
from attrition2;

update attrition2
set NumCompaniesWorked = null
where NumCompaniesWorked = 'NA';

alter table attrition2
modify NumCompaniesWorked int;

update attrition2
set TotalWorkingYears = null
where TotalWorkingYears= 'NA';

alter table attrition2
modify TotalWorkingYears int;

update attrition2
set JobSatisfaction = null
where JobSatisfaction= 'NA';

alter table attrition2
modify JobSatisfaction int;

update attrition2
set EnvironmentSatisfaction= null
where EnvironmentSatisfaction= 'NA';

alter table attrition2
modify EnvironmentSatisfaction int;

update attrition2
set WorkLifeBalance= null
where WorkLifeBalance= 'NA';

alter table attrition2
modify WorkLifeBalance int;

select *
from attrition2;

select count(*)
from attrition2;

select count(employeeid)
from attrition2;

#max and min working years of employees

select max(TotalWorkingYears), min(TotalWorkingYears)
from attrition2;

#Total number of churned employees in company

select count(*)
from attrition2
where attrition = 'yes';

#attrition rate

select concat(round((select count(attrition) from `attrition2` where attrition = "Yes")*100/count(employeeid),2),' ','%') as attritionrate1
from attrition2;

#Total number of current employees in company

select count(*)
from attrition2
where attrition = 'no';

#nonattrition rate

select concat(round((select count(attrition) from attrition2 where attrition = "no")*100/count(employeeid),2),' ','%') as nonattritionrate
from attrition2;

# Attrition by department

select  Attrition, Department, count(*) as department_attrition
from attrition2
where Attrition = 'yes'
group by Attrition, Department;

# Attrition by department and performance rating
 
select  Attrition, Department, count(*) as department_attrition , performancerating
from attrition2
where Attrition = 'yes'
group by Attrition, Department, performancerating;

# Attrition by age

select  Attrition, age, count(*) as attrition_by_age
from attrition2
where Attrition = 'yes'
group by Attrition, age
order by age desc;

#maximun age of attriton

select max(age)
from attrition2
where Attrition = 'yes';

# Attrition by business travel

select  Attrition, BusinessTravel, count(*) as attrition_by_businesstravel
from attrition2
where Attrition = 'yes'
group by Attrition, BusinessTravel;

# Attrition by distancefromhome

select  Attrition, distancefromhome, count(*) as attrition_by_distancefromhome
from attrition2
where Attrition = 'yes'
group by Attrition, distancefromhome;

# Attrition by educationfield

select  Attrition, educationfield, count(*) as attrition_by_education , education
from attrition2
where Attrition = 'yes'
group by Attrition, educationfield, education
order by educationfield;

# Attrition by gender

select  Attrition, gender, count(*) as attrition_by_gender
from attrition2
where Attrition = 'yes'
group by Attrition, gender;

# Attrition by gender and department

select  Attrition, gender, count(*) as attrition_by_gender, department
from attrition2
where Attrition = 'yes'
group by Attrition, gender, department;

# Attrition by joblevel, jobrole

select  Attrition, joblevel, jobrole, count(*) as attrition_by_jobrole
from attrition2
where Attrition = 'yes'
group by Attrition, joblevel, jobrole
order by joblevel;

# Attrition by maritalstatus

select  Attrition, maritalstatus, count(*) as attrition_by_maritalstatus
from attrition2
where Attrition = 'yes'
group by Attrition, maritalstatus;

select   maritalstatus, worklifebalance
,count(maritalstatus)
as maritalstatus1
from attrition2
group by worklifebalance,
maritalstatus
order by maritalstatus;

# Attrition by MonthlyIncome

select attrition, MonthlyIncome,
count(*) as attrition_by_MonthlyIncome
from attrition2
where Attrition = 'yes'
group by  attrition, MonthlyIncome
order by MonthlyIncome asc;

select min(MonthlyIncome) as minimum, max(MonthlyIncome) as maximum
from attrition2
where Attrition = 'yes';

select min(MonthlyIncome) as minimum, max(MonthlyIncome) as maximum
from attrition2
where Attrition = 'no';

# attrition with respect to PercentSalaryHike

select  Attrition, PercentSalaryHike, count(*) as attrition_by_PercentSalaryHike
from attrition2
where Attrition = 'yes'
group by Attrition, PercentSalaryHike;

# attrition with respect to totalworkingyears

select  Attrition,  count(TotalWorkingYears) as attrition_by_TotalWorkingYears, TotalWorkingYears
from attrition2
where Attrition = 'yes'
group by Attrition, TotalWorkingYears;

select  Attrition,  count(*) as attrition_by_TotalWorkingYears, TotalWorkingYears
from attrition2
where Attrition = 'yes'
group by Attrition, TotalWorkingYears;

# attrition with respect to totalworkingyears and years at company

select  Attrition, TotalWorkingYears, YearsAtCompany, count(*) as attrition_by_YearsAtCompany
from attrition2
where Attrition = 'yes'
group by Attrition, TotalWorkingYears, YearsAtCompany;

#attrition with respect to training times last year

select  Attrition, trainingtimeslastyear, count(*) as attrition_by_trainingtimeslastyear
from attrition2
where Attrition = 'yes'
group by Attrition, trainingtimeslastyear
order by trainingtimeslastyear;

#attrition with respect to training times last year with yearsatcompany

select  Attrition, trainingtimeslastyear, count(*) as attrition_by_trainingtimeslastyear, YearsAtCompany
from attrition2
where Attrition = 'yes'
group by Attrition, trainingtimeslastyear, YearsAtCompany
order by trainingtimeslastyear;

# count of attrition with zero total working years and zero years at company

select count(employeeid), Attrition, TotalWorkingYears, YearsAtCompany
from attrition2
where attrition = 'yes'
and TotalWorkingYears = 'NA'
and YearsAtCompany = 'NA';

# attrition with zero NumCompaniesWorked and TotalWorkingYears

select  employeeid, Attrition, TotalWorkingYears, NumCompaniesWorked, YearsAtCompany
from attrition2
where attrition = 'yes';

select employeeid, Attrition,YearsAtCompany 
from attrition2
where attrition = 'yes'
and YearsAtCompany='0';

# attrition of employees with zero total working years and zero years at company

select  employeeid, Attrition, TotalWorkingYears, YearsAtCompany
from attrition2
where attrition = 'no'
and TotalWorkingYears = 'NA'
and YearsAtCompany = 'NA';

# attrition with JobInvolvement, PerformanceRating

select  employeeid, Attrition, JobInvolvement, PerformanceRating
from attrition2
where attrition = 'yes'
and JobInvolvement > 3
and PerformanceRating > 3;

select employeeid, performancerating, monthlyincome , attrition
from attrition2
where performancerating>2
and attrition = 'yes';

select employeeid, performancerating
from attrition2
where performancerating=3;

select employeeid, performancerating
from attrition2
where performancerating=4;

# attrition of people with low performance rating

select employeeid, performancerating, monthlyincome , attrition
from attrition2
where performancerating=3
and attrition = 'no';

select employeeid, performancerating, monthlyincome , attrition
from attrition2
where performancerating=4
and attrition = 'no';

# attrition with EnvironmentSatisfaction, JobSatisfaction, WorkLifeBalance

select  Attrition, EnvironmentSatisfaction, JobSatisfaction, WorkLifeBalance
from attrition2
where attrition = 'yes';

select employeeid,
 Attrition, EnvironmentSatisfaction, JobSatisfaction, WorkLifeBalance
from attrition2
where attrition = 'yes'
and EnvironmentSatisfaction >3
and JobSatisfaction >3
and WorkLifeBalance >3;

select employeeid,
 Attrition, EnvironmentSatisfaction, JobSatisfaction, WorkLifeBalance
from attrition2
where attrition = 'yes'
and EnvironmentSatisfaction <3
and JobSatisfaction <3
and WorkLifeBalance <3;

select department, jobsatisfaction,count(*), gender
from attrition2
group by department, jobsatisfaction, gender;

select *
from attrition2
where YearsAtCompany is null or YearsAtCompany='NA' ;