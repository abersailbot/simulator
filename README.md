# Simulator Instructions

This package uses the sails simulator and boatd to simulate a robot sailing. 

## Installation

### Pre-requisites

libjansson-dev

Python 2.7 or 3.x

For sails-ui 

libgirepository1.0-dev


### Checkout Code

Checkout this repository and its submodules

`git clone --recursive https://github.com/abersailbot/simulator`

### Compile sails

`cd sailsd`

`make`

### Install python dependencies

#### Using Anaconda (optional)

Install Anaconda from www.anaconda.org

Anaconda has its own copy of Python (and many other packages), its huge but probably has more up to date packages than your OS.

`conda create -n boatd python=3.7 anaconda`

`conda activate boatd`

`conda install -c conda-forge jansson`

`conda install -c conda-forge pygobject`

#### Using Virtualenv (optional)

*** Don't do this if you are using Anaconda. ***

Using a virtual env is a lighter weight method of isolating your Python configuration.

`python3 -m venv simulator-env`

`source simulator-env/bin/activate`

or for python2

`python -m virtualenv simulator-env`

`source simulator-env/bin/activate`

#### Installing Packages

```pip install python-boatdclient python-sailsd gobject PyGObject```

### Install boatd as a python package

`cd boatd`

`python setup.py install`

### Configure boatd port

Boatd's default port is 2222, but this config uses 2223 (because i've got an SSH tunnel using 2222).
Change this by editing boatd.yml and boatd_client.py in the boatdclient Python package.
The script set_port.sh will read the config file and automatically set 

## Running

Three components must be launched:

1. The sails simulator
2. Boatd 
3. The behaviour to control the simulated boat via boatd

Optionally you can launch the sails-ui graphical interface.

The script run.sh will launch all four of these.


### Running with Singularity

Install Singularity, see https://sylabs.io/guides/3.0/user-guide/installation.html for instructions.

Download the container:

`singularity pull shub://abersailbot/simulator:latest`

Running the container:

`singularity run abersailbot-simulator-master-latest.simg`

You can either run the behaviour inside another container:

singularity exec abersailbot-simulator-master-latest.simg /opt/simulator/simulator-behaviour/waypoint-behaviour

Or execute your own behaviour outside the container. Note you'll have to change boatd-client to use port 2223 by editing 

Edit boatd_client.py in your Python library directory and change:

class Boatd(object):                                                                                                                                                                                                                          
    def __init__(self, host='localhost', port= 2222):  

to

class Boatd(object):                                                                                                                                                                                                                          
    def __init__(self, host='localhost', port= 2223):

Or run the fix_port.sh script in the root directory of this repository.


### Running with Docker

TODO

## Stopping everything

Run the script stop.sh 

