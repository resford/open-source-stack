select distinct
    site_code
    ,date_time::timestamp as date_time
    ,cfs::int as cfs
from {{ source('main', 'lake_river_flow') }}