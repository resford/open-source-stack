select 
    siteCode
    ,dateTime::timestamp
    ,cfs::int
from {{ source('main', 'base_river_flow') }}