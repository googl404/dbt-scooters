  
--{{ config(materialized='table') }} 
select 
DATE(started_at)   date ,
count(*) trips, 
max(price)/100  max_price_rub ,
avg(distance)/1000    avg_distance_km

from scooters_raw.trips
group by DATE(started_at)
order by
    1 
/* Задача 2. Посчитать статистику поездок по дням. Результат записать в таблицу со столбцами:
date - дата начала поездки
trips - количество поездок за день
max_price_rub - максимальная стоимость поездки за день в рублях
avg_distance_km - средняя дальность поездки за день в километрах
Нужно написать SQL-запрос, который возвращает таблицу с указанными столбцами, агрегированную по дате начала поездки. В таблице должна быть 91 строка.
*/