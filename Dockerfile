FROM ubuntu:bionic
MAINTAINER Colin Sauze <cos@aber.ac.uk>

RUN apt-get update; \
    apt-get install -y software-properties-common; \
    apt-get update; \
    apt-get install -y libjansson-dev python-gi-cairo python-gi gir1.2-gtk-3.0 build-essential python-pip git pkg-config build-essential libjansson-dev netcat psmisc python-yaml; \
    pip install python-sailsd python-boatdclient; \
    cd /opt; \
    git clone --recursive https://github.com/abersailbot/simulator.git; \
    cd /opt/simulator/boatd; \
    python setup.py install; \
    cd /opt/simulator/sailsd; \
    make; \
    make install; \
    cd ..; \
    ./set_port.sh

ENTRYPOINT ["/opt/simulator/run.sh"]

EXPOSE 2223
