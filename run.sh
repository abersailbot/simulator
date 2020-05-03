#!/bin/sh
echo "Starting sailsd simulator"
sailsd/sailsd > /dev/null &
sleep 1
echo "Setting sail's position and wind"
./init_sails.sh
echo "Starting boatd"
python3 boatd/bin/boatd boatd.yml &
sleep 5
#boatdctl behaviour-start example 
echo "Starting sails-UI"
python3 sails-ui/sails-ui
