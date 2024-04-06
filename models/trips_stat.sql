select count(*) trips,
count(DISTINCT user_id) users,
 AVG( extract(epoch from (finished_at - started_at))) / 60   avg_duration_m, 
SUM(price)/100 revenue_rub,
  sum( case when price>0 then 0 else 1 end)    /(count(*) :: real) *100  as  free_trips_pct
  from scooters_raw.trips
  
/* trips - суммарное количество поездок
users - количество уникальных пользователей
avg_duration_m - средняя длительность поездки в минутах
revenue_rub - суммарная выручка в рублях
free_trips_pct - процент бесплатных поездок (с нулевой стоимостью) от всех поездок*/