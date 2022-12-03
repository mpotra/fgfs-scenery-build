#!/bin/sh
########################################################################
# Extract shapefiles for FlightGear layers from OSM shapefiles
########################################################################

SOURCE=../osm
DEST=./data/shapefiles

#
# Roads
#
echo Motorways...
ogr2ogr $DEST/motorway-highway.shp $SOURCE/highway.shp \
        -sql "select * from highway where highway in ('motorway', 'motorway-link') and (tunnel is null or tunnel != 'yes')"

echo Trunk roads...
ogr2ogr $DEST/trunk-highway.shp $SOURCE/highway.shp \
        -sql "select * from highway where highway in ('trunk', 'trunk-link') and (tunnel is null or tunnel != 'yes')"

echo Primary roads...
ogr2ogr $DEST/primary-highway.shp $SOURCE/highway.shp \
        -sql "select * from highway where highway in ('primary', 'primary-link') and (tunnel is null or tunnel != 'yes')"

echo Secondary roads...
ogr2ogr $DEST/secondary-highway.shp $SOURCE/highway.shp \
        -sql "select * from highway where highway in ('secondary', 'secondary-link') and (tunnel is null or tunnel != 'yes')"

#
# River lines
#
echo River lines...
ogr2ogr $DEST/river-waterway.shp $SOURCE/waterway.shp \
        -sql "select * from waterway where waterway in ('river') and (tunnel is null or tunnel != 'yes')"

echo Canal lines...
ogr2ogr $DEST/canal-waterway.shp $SOURCE/waterway.shp \
        -sql "select * from waterway where waterway in ('canal') and (tunnel is null or tunnel != 'yes')"

#
# Water areas
#
echo Wetlands...
ogr2ogr $DEST/wetland-natural.shp $SOURCE/natural.shp \
        -sql "select * from natural where natural = 'wetland' and OGR_GEOM_AREA > 0.00001"

echo Water areas - natural ...
ogr2ogr $DEST/water-natural.shp $SOURCE/natural.shp \
        -sql "select * from natural where natural = 'water' and OGR_GEOM_AREA > 0.00002"

# catches some small continuities for rivers and canals
echo Water areas - water...
ogr2ogr $DEST/water-water.shp $SOURCE/water.shp \
        -sql "select * from water where water in ('river', 'canal')"

#
# Natural landcover
#
echo Cliff...
ogr2ogr $DEST/cliff-natural.shp $SOURCE/natural.shp \
        -sql "select * from natural where natural = 'cliff'"

echo Forest...
ogr2ogr $DEST/forest-natural.shp $SOURCE/natural.shp \
        -sql "select * from natural where natural = 'wood' and OGR_GEOM_AREA > 0.00001"

echo Grassland...
ogr2ogr $DEST/grassland-natural.shp $SOURCE/natural.shp \
        -sql "select * from natural where natural = 'grassland' and OGR_GEOM_AREA > 0.00001"

echo Rock...
ogr2ogr $DEST/rock-natural.shp $SOURCE/natural.shp \
        -sql "select * from natural where natural in ('bare_rock', 'scree')"

echo Sand...
ogr2ogr $DEST/cliff-natural.shp $SOURCE/natural.shp \
        -sql "select * from natural where natural in ('dune', 'sand') and OGR_GEOM_AREA > 0.000005"

echo Scrub...
ogr2ogr $DEST/scrub-natural.shp $SOURCE/natural.shp \
        -sql "select * from natural where natural = 'scrub' and OGR_GEOM_AREA > 0.00001"

#
# Developed land
#
echo Brownfield...
ogr2ogr $DEST/brownfield-landuse.shp $SOURCE/landuse.shp \
        -sql "select * from landuse where landuse = 'brownfield' and OGR_GEOM_AREA > 0.00005"

echo Cemetery...
ogr2ogr $DEST/cemetery-landuse.shp $SOURCE/landuse.shp \
        -sql "select * from landuse where landuse = 'cemetery' and OGR_GEOM_AREA > 0.00005"

echo Commercial...
ogr2ogr $DEST/commercial-landuse.shp $SOURCE/landuse.shp \
        -sql "select * from landuse where landuse = 'commercial' and OGR_GEOM_AREA > 0.00005"

echo Construction...
ogr2ogr $DEST/construction-landuse.shp $SOURCE/landuse.shp \
        -sql "select * from landuse where landuse = 'construction' and OGR_GEOM_AREA > 0.00005"

echo Education...
ogr2ogr $DEST/education-landuse.shp $SOURCE/landuse.shp \
        -sql "select * from landuse where landuse = 'education' and OGR_GEOM_AREA > 0.00005"

echo Golf...
ogr2ogr $DEST/golf-sport.shp $SOURCE/sport.shp \
        -sql "select * from sport where sport = 'golf' and OGR_GEOM_AREA > 0.00005"

echo Grass...
ogr2ogr $DEST/grass-landuse.shp $SOURCE/landuse.shp \
        -sql "select * from landuse where landuse = 'grass' and OGR_GEOM_AREA > 0.00005"

echo Greenfield...
ogr2ogr $DEST/greenfield-landuse.shp $SOURCE/landuse.shp \
        -sql "select * from landuse where landuse = 'greenfield' and OGR_GEOM_AREA > 0.00005"

echo Industrial...
ogr2ogr $DEST/industrial-landuse.shp $SOURCE/landuse.shp \
        -sql "select * from landuse where landuse = 'industrial' and OGR_GEOM_AREA > 0.00005"

echo Institutional...
ogr2ogr $DEST/education-landuse.shp $SOURCE/landuse.shp \
        -sql "select * from landuse where landuse = 'institutional' and OGR_GEOM_AREA > 0.00005"

echo Landfill...
ogr2ogr $DEST/landfill-landuse.shp $SOURCE/landuse.shp \
        -sql "select * from landuse where landuse = 'landfill' and OGR_GEOM_AREA > 0.00005"

echo Park...
ogr2ogr $DEST/park-leisure.shp $SOURCE/landuse.shp \
        -sql "select * from landuse where leisure = 'park' and OGR_GEOM_AREA > 0.00005"

echo Quarry...
ogr2ogr $DEST/quarry-landuse.shp $SOURCE/landuse.shp \
        -sql "select * from landuse where landuse = 'quarry' and OGR_GEOM_AREA > 0.00005"

echo Recreation ground...
ogr2ogr $DEST/recreation-ground-landuse.shp $SOURCE/landuse.shp \
        -sql "select * from landuse where landuse = 'recreation_ground' and OGR_GEOM_AREA > 0.00005"

echo Residential...
ogr2ogr $DEST/residential-landuse.shp $SOURCE/landuse.shp \
        -sql "select * from landuse where landuse = 'residential' and OGR_GEOM_AREA > 0.00005"

echo Retail...
ogr2ogr $DEST/retail-landuse.shp $SOURCE/landuse.shp \
        -sql "select * from landuse where landuse = 'retail' and OGR_GEOM_AREA > 0.00005"


#
# Agriculture
#
echo Farmland...
ogr2ogr $DEST/farmland-landuse.shp $SOURCE/landuse.shp \
        -sql "select * from landuse where landuse in ('farmland', 'farmyard') and OGR_GEOM_AREA > 0.00005"

echo Forest...
ogr2ogr $DEST/forest-landuse.shp $SOURCE/landuse.shp \
        -sql "select * from landuse where landuse = 'forest' and OGR_GEOM_AREA > 0.00005"

echo Meadow...
ogr2ogr $DEST/meadow-landuse.shp $SOURCE/landuse.shp \
        -sql "select * from landuse where landuse = 'meadow' and OGR_GEOM_AREA > 0.00005"

echo Orchard...
ogr2ogr $DEST/orchard-landuse.shp $SOURCE/landuse.shp \
        -sql "select * from landuse where landuse = 'orchard' and OGR_GEOM_AREA > 0.00005"

echo Vineyard...
ogr2ogr $DEST/vineyard-landuse.shp $SOURCE/landuse.shp \
        -sql "select * from landuse where landuse = 'vineyard' and OGR_GEOM_AREA > 0.00005"

#
# Aviation
#

echo Military airfield...
ogr2ogr $DEST/airfield-military.shp $SOURCE/military.shp \
        -sql "select * from military where military = 'airfield'"

echo General airfield...
ogr2ogr $DEST/airfield-aeroway.shp $SOURCE/aeroway.shp \
        -sql "select * from aeroway where aeroway = 'aerodrome'"

