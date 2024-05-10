  
--{{ config(materialized='table') }} 
select 
 date ,
count(*) trips, 
max(price_rub)  max_price_rub ,
avg(distance_m)/1000    avg_distance_km,
   avg(price_rub)/avg(duration_s)*60  avg_price_rub_per_min

from {{ ref("trips_prep") }}
group by DATE
order by  1 
/* Задача 2. Посчитать статистику поездок по дням. Результат записать в таблицу со столбцами:
date - дата начала поездки
trips - количество поездок за день
max_price_rub - максимальная стоимость поездки за день в рублях
avg_distance_km - средняя дальность поездки за день в километрах
Нужно написать SQL-запрос, который возвращает таблицу с указанными столбцами, агрегированную по дате начала поездки. В таблице должна быть 91 строка.
*/