/* 1757. Recyclable and Low Fat Products */
select product_id
from products 
where low_fats = 'Y' and recyclable  = 'Y'; 

/* 584. Find Customer Referee*/
select name
from customer
where referee_id <> 2 or referee_id is null;

/* 585. Investments in 2016 */
select round(sum(tiv_2016),2) as tiv_2016
from insurance
where tiv_2015 in (
    select tiv_2015
    from insurance
    group by tiv_2015
    having count(*)>1
)
and not exists (
    select *
    from insurance t2
    where insurance.lat = t2.lat
    and insurance.lon = t2.lon
    and insurance.pid != t2.pid
);

/* 595. Big Countries */
select 
    name,
    population,
    area
from world
where area >= 3000000
    or population >= 25000000;

/* 1148. Article Views I */
select distinct(author_id) as id
from views
where author_id = viewer_id
order by author_id asc;

/*1683. Invalid Tweets*/
select tweet_id 
from tweets
where length(content) > 15;

/* 1378. Replace Employee ID With The Unique Identifier*/
select t2.unique_id, t1.name
from Employees t1
left join EmployeeUNI t2
on t1.id = t2.id;

/* 1068. Product Sales Analysis I */
select
    product_name,
    year,
    price
from Sales t1
left join Product t2
on t1.product_id = t2. product_id;

/* 1581. Customer Who Visited but Did Not Make Any Transactions */
select 
	v.customer_id
	, count(v.visit_id) as "count_no_trans"
from visits v 
left join transactions t 
on v.visit_id = t.visit_id
where t.transaction_id is null
group by v.customer_id;

/* 197. Rising Temperature */
select t1.id
from weather t1
join weather t2
on t1.recordDate = DATEADD(DAY, 1, t2.recordDate)
where t1.temperature > t2. temperature;

/* 1661. Average Time of Process per Machine */
select 
	machine_id
	,round(avg(stop_timestamp - start_timestamp),3) as processing_time
from (
	select 
		machine_id 
		,process_id 
		,min (case 
			when activity_type = 'start' then timestamp
			else null
		end) as start_timestamp
		,max (case 
			when activity_type = 'end' then timestamp
			else null
		end) as stop_timestamp
	from activity
	group by 
		machine_id 
		,process_id
	) as subquery
group by machine_id;




