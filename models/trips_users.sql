select
    t_p.*, U.sex,   extract(year from t_p.started_at) - extract(year from u.birth_date) as age
from
    {{ ref('trips_prep') }} as t_p
left join
    {{ source("scooters_raw", "users") }} as  U
 on t_p.user_id = u.id
  