select  
date(started_at) as date ,
sum(price_rub) revenue_daily
from  {{ ref('trips_prep') }}

{% if is_incremental() %}
where date >= (select max(date)  - interval '2' days from  {{ this }})
 
{% else %}  

{% endif %}
group by 1
order by 1
