use sakila;
select * from actor;

create table test1 (
id_1 int
);

create table if not exists address  (

);


if not exists 

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
alter table actor add column(description BLOB);

/* 3b */
alter table actor drop column description;

/* 4a */
select last_name, count(1) 'no_of_actors' from actor
group by last_name
order by last_name;

/* 4b */
select last_name, count(1) 'no_of_actors' from actor
group by last_name
having count(1) > 1
order by last_name;

/*4c*/
update actor
set first_name = 'HARPO'
where first_name = 'GROUCHO'
and last_name='WILLIAMS';

/*4d*/
update actor
set first_name = 'GROUCHO'
where first_name = 'HARPO'
and last_name='WILLIAMS';

/*5a*/
create table if not exists address  (
`address_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,  
`address` varchar(50) NOT NULL,  
`address2` varchar(50) DEFAULT NULL,  
`district` varchar(20) NOT NULL,  
`city_id` smallint(5) unsigned NOT NULL,  
`postal_code` varchar(10) DEFAULT NULL,  
`phone` varchar(20) NOT NULL,  
`location` geometry NOT NULL,  
`last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,  
PRIMARY KEY (`address_id`),  KEY `idx_fk_city_id` (`city_id`),  
SPATIAL KEY `idx_location` (`location`),  
CONSTRAINT `fk_address_city` FOREIGN KEY (`city_id`) REFERENCES `city` (`city_id`) ON UPDATE CASCADE);

/*6a*/
select s.first_name, s.last_name, ad.address, ad.address2, ad.district, 
		ad.city_id, ad.postal_code
from staff s inner join address ad
on s.address_id = ad.address_id;

/*6b*/
select  s.first_name, s.last_name, p.staff_id, sum(p.amount) amount 
from  payment p
inner join staff s
on p.staff_id = s.staff_id
where  date_format(p.payment_date, '%Y-%m') = '2005-08'
group by p.staff_id;

/*6c*/
SELECT f.film_id, f.title, count(fa.actor_id) actors_count FROM sakila.film f
inner join film_actor fa
on f.film_id = fa.film_id
group by f.film_id;

/*6d*/
SELECT f.title, i.film_id, count(1) film_count FROM inventory i
inner join film f
on i.film_id = f.film_id
where f.title = 'Hunchback Impossible'
group by i.film_id

/*6e*/
SELECT c.customer_id, c.first_name, c.last_name, p.total_paid FROM customer c
left join 
(select p.customer_id, sum(p.amount) total_paid
from payment p
group by p.customer_id) p
on c.customer_id = p.customer_id
order by c.last_name;

/*7a */
SELECT title, language_id FROM film f
where (f.title like 'K%' or f.title like 'Q%')
and language_id in 
	( select language_id from language
       where name = 'English');

/*7b*/
SELECT a.actor_id, a.first_name, a.last_name FROM film_actor fa
inner join actor a
on fa.actor_id = a.actor_id
where film_id =
    (select f.film_id from film f
      where f.title='Alone Trip');
      
/*7c*/
select cus.first_name, cus.last_name, cus.email from customer cus
inner join address a
on cus.address_id = a.address_id
inner join city c
on a.city_id = c.city_id
inner join country cty
on c.country_id = cty.country_id
where cty.country='Canada';

/*7d*/
