#which School level has the best performance rating
select `SCHOOL LEVEL*`,
sum(`PERFORMANCE CATEGORY SCORE`) as Summation
from schoolreport
group by `SCHOOL LEVEL*`
order by  Summation desc;

#which District has the best score
select `DISTRICT`,
sum(`OVERALL SCORE`) as Summation
from schoolreport
group by `DISTRICT`
order by Summation desc;

#which principal and school has the best rating when compared to all the districts. 
create view T1 as(
select max(`OVERALL SCORE`) as myMax
from schoolreport);

select * from T1, schoolreport as T2
where T2.`OVERALL SCORE` = T1.myMax;

