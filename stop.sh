kill `ps a | grep "boatd.yml" | grep -v grep | awk '{print $1}'`
killall sailsd
kill `ps a | grep "python simulator-behaviour/looped-waypoint-behaviour" | grep -v grep | awk '{print $1}'`

