with base as (
    select
        site_code,
        date_time,
        cfs
    from {{ ref('base_river_data') }}
),

remove_negative_cfs_values as (
    select 
        * 
    from base
    where cfs >= 0
),

daily_average as (
    select
        site_code,
        date_trunc('day', date_time) as date,
        extract(year from date_time) as year,
        -- Format date to MM-DD
        strftime('%m-%d', date_time) as month_day,
        avg(cfs) as avg_cfs
    from remove_negative_cfs_values
    group by 1, 2, 3, 4
)

select 
    site_code,
    year,
    month_day,
    avg_cfs 
from daily_average
