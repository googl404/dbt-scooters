select count(*) trips,
count(DISTINCT user_id) users,
 AVG( duration_s) / 60   avg_duration_m, 
SUM(price_rub)/100 revenue_rub,
  sum( case when is_free is true or null then 0 else 1 end)    /(count(*) :: real) *100  as  free_trips_pct,
  sum(distance_m)/1000 as sum_distance_km
  from {{ ref("trips_prep") }}
  
/* trips - суммарное количество поездок
users - количество уникальных пользователей
avg_duration_m - средняя длительность поездки в минутах
revenue_rub - суммарная выручка в рублях
free_trips_pct - процент бесплатных поездок (с нулевой стоимостью) от всех поездок*/