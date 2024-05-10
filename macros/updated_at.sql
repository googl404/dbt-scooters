{% macro updated_at() %}
    now()  as updated_at --at time zone 'utc'
{% endmacro %}