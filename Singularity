Bootstrap:docker
From:ubuntu:18.04

%help
    Container for Sails and Boatd

%labels
    MAINTAINER Colin Sauze

%environment
    #define environment variables here
    
%post  
    apt-get update
    apt-get -y install software-properties-common
    apt-get update
    apt-get install -y libjansson-dev python-gi-cairo build-essential python-pip git pkg-config build-essential libjansson-dev netcat psmisc
    pip install python-sailsd python-boatd

    cd /opt

    git clone --recursive https://github.com/abersailbot/simulator.git

    #we need boatd from git, but it needs to be in a system path so manually install it
    cd /opt/simulator/boatd
    python setup.py install

    #compile sailsd
    cd /opt/simulator/sailsd
    make
    make install
    cd ..

    #change boatdclient to port 2223
    ./set_port.sh

%runscript
    cd /opt/simulator/
    ./run.sh
