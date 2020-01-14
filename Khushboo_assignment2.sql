CREATE TABLE IF NOT EXISTS calls
(
callernumber BIGINT,
receivernumber BIGINT,
duration INT,
year INT,
month INT,
day INT,
hour INT,
minute INT
)
row format delimited
fields terminated by ','
stored as textfile;




CREATE TABLE IF NOT EXISTS messages
(
callernumber BIGINT,
receivernumber BIGINT,
length INT,
year INT,
month INT,
day INT,
hour INT,
minute INT
)
row format delimited
fields terminated by ','
stored as textfile;

LOAD DATA LOCAL INPATH '/home/cloudera/calls.csv' OVERWRITE INTO TABLE calls;

LOAD DATA LOCAL INPATH '/home/cloudera/meassages.csv' OVERWRITE INTO TABLE messages;

--1
select callernumber, count(callernumber) from calls group by callernumber;

--2
SELECT callernumber from calls group by callernumber having count(callernumber)>10;

--3
SELECT callernumber,sum(duration) as sum from calls group by callernumber order by sum desc  limit 1;
--4

SELECT receivernumber,count(receivernumber) as count from calls group by receivernumber order by count  desc  limit 1;
--5
SELECT callernumber,max(length) as length from messages group by callernumber  order by length  desc  limit 10;
--6
SELECT hour ,count(hour) as hourc from messages group by hour  order by hourc  desc  limit 1;
--7
select hour , count(hour) as hourc from calls group by  hour order by hour asc;
--8
create view v1 as select callernumber,count(callernumber) from calls group by callernumber having count(callernumber)>3;
create view v2 as select callernumber,count(callernumber) from messages group by callernumber having count(callernumber)>2;
select c.callernumber , m.callernumber from calls c join messages m on c.callernumber = m.callernumber;            




