select 
    site_code
    ,date_time::timestamp
    ,cfs::int
from {{ source('main', 'lake_river_flow') }}