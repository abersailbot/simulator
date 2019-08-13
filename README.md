# Simulator Instructions

This package uses the sails simulator and boatd to simulate a robot sailing. 

## Installation

### Pre-requisites

Python 2.7 or 3.x



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

`conda activate boatd-sim`

#### Using Virtualenv (optional)

*** Don't do this if you are using Anaconda. ***

Using a virtual env is a lighter weight method of isolating your Python configuration.

`python3 -m venv simulator-env`

or for python2

`python -m virtualenv simulator-env`

`source simulator-env/bin/activate`

#### Installing Packages

```pip install python-boatdclient python-sailsd```

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

The script run.sh will launch all three of these.

