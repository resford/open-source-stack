select
    site_code
    , site_name
from {{source('main', 'lake_river_sites')}}