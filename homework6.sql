-- Семинар 6
/*
1. Создайте функцию, которая принимает кол-во сек и формат их в кол-во дней часов.
Пример: 123456 ->'1 days 10 hours 17 minutes 36 seconds '
*/

drop function day_hour_minutes_seconds;

delimiter $$
create function day_hour_minutes_seconds (sec INT)
returns varchar(50)
deterministic 
begin
	declare days float(10,2) default 0;
	declare hours float(10,2) default 0;
	declare minutes float(10,2) default 0;
	declare seconds float(10,2) default 0;
    declare res varchar(1000) default '';
    
    set days = sec div (24 * 3600);
    
    set sec = sec % (24 * 3600);
    set hours = sec div 3600;
    
    set sec = sec % 3600;
    set minutes = sec div 60;
    
    set sec = sec % 60;
    set seconds = sec;
	
    set res = concat(res, ' ', cast(days as unsigned), ' days ', cast(hours as unsigned), ' hours ', cast(minutes as unsigned), ' minutes ', cast(seconds as unsigned), ' seconds');
    return res;
end $$
delimiter ;

select day_hour_minutes_seconds(123456);

/*
2. Выведите только чётные числа от 1 до 10.
Пример: 2,4,6,8,10
*/

drop procedure even_numbers;

delimiter $$
create procedure even_numbers()
begin
	declare num int default 1;
    declare res varchar(50) default '';
    while num <= 10 do
		if num % 2 = 0 then
			set res = concat(res, ' ', num);
		end if;
        set num = num + 1;
    end while;
    select res;
end $$
delimiter ;

call even_numbers();
