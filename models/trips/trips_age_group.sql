select
    ag.group as age_group,
    count(*) as trips,
    sum(price_rub) as revenue_rub
from
    {{ ref("trips_users") }} as tu
    cross join {{ ref("age_groups") }} as ag
where
    tu.age >= ag.age_start
    and tu.age <= ag.age_end
group by
    1

--trip_users и новый сид age_groups. При объединении нужно проверять, что возраст trips_users.age попадает в диапазон возрастной группы age_start - age_end. 
--После объединения у каждой поездки будет однозначно определена возрастная группа, которую нужно назвать age_group