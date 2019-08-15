#!/bin/sh

echo "{\"set\": {\"latitude\": 52.4185, \"longitude\": -4.086}}" | nc 127.0.0.1 3333
echo "{\"set\": {\"wind-angle\": 3.142}}" | nc 127.0.0.1 3333
echo "{\"set\": {\"rudder-angle\": 0}}" | nc 127.0.0.1 3333