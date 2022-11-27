drop table dummy_films;
create table dummy_films(
film_id int,
title varchar(255),
genre varchar(30),
desc_ varchar(255),
run_time int,
rating float,
cover_img blob,	
start_date date,
end_date date
)