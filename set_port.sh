#!/bin/bash

port=`grep "port: [0-9]\{1,5\}" boatd.yml | awk -F: '{print $2}'`

echo "changing port to $port"


boatdclient=`echo -e "import boatdclient\nprint(boatdclient.__path__)" | python3 | sed -e "s/\['//" | sed -e "s/']//"`

sed -i "s/2222/$port/" $boatdclient/boatd_client.py




