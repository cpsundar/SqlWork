use sakila;
select * from actor;

/* 1a */
select first_name, last_name from actor;
/* 1b */
select concat(first_name, ' ', last_name) as 'Actor Name' from actor;

/* 2a */
select actor_id, first_name, last_name from actor
where first_name like 'Joe';

/* 2a */
select actor_id, first_name, last_name from actor
where last_name like '%GEN%';

/* 2c */
select last_name, first_name  from actor
where last_name like '%LI%'
order by last_name, first_name;

/*2d*/
select country_id, country from country
where country in ('Afghanistan', 'Bangladesh', 'China');

/* 3a*/

