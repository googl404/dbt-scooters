with conpany_trips_scooters   as (select 
m.company, count(*) as trips,  max(c.scooters) scooters_per_comp
from 
{{ ref("trips_prep") }} as t
join 
{{ ref("models") }}  as m
on t.scooter_hw_id = m.hardware_id
join 
{{ ref("companies") }}  as c
on c.company = m.company
group by    1)

select company, trips, trips/ cast( scooters_per_comp as float) from conpany_trips_scooters

 