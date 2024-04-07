
/* Объединить пользователей с таблицей поездок
Вычислить возраст исходя из даты рождения и начала поездки (как целое число)
Сгруппировать данные о возрасту и дате поездки, чтобы найти количество поездок в день
Сгруппировать данные по возрасту, чтобы найти среднее количество поездок в день
Создать dbt-модель trips_stat_age и развернуть ее как таблицу
Закоммитить изменения и отправить в удаленный репозиторий
*/
with age_date_trips as (select  date_part('year', scooters_raw.trips.started_at )  -   date_part('year', scooters_raw.users.birth_date)   AS age ,
date(scooters_raw.trips.started_at)  as date ,
count(*) as cnt_trips
FROM scooters_raw.trips
join scooters_raw.users on scooters_raw.users.id=scooters_raw.trips.user_id group by 1,2 order by 2)

select age, avg(cnt_trips) as avg_trips from age_date_trips group by 1 order by 1

