update job_applied
set contact ='Erlich Bachman'
where job_id =1;

update job_applied
set contact ='Dinesh Chugtai'
where job_id =2;

update job_applied
set contact ='Bertram Gilfoyle'
where job_id =3;

update job_applied
set contact ='Jian Yang'
where job_id =4;

update job_applied
set contact ='Big Head'
where job_id =5;

select * FROM job_applied

alter table job_applied
rename column contact to contact_name

select * 
FROM job_applied

alter table job_applied
alter column contact_name type text;

alter table job_applied
drop column contact_name;

DROP TABLE job_applied