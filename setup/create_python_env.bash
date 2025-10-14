#!/bin/bash

# Sets up the sampled_reachability_maps virtual environment

# INSTALL Python 3.8
# sudo apt update
# sudo apt upgrade
# sudo add-apt-repository ppa:deadsnakes/ppa -y
# sudo apt update
# sudo apt install python3.8
# sudo apt install python3.8-venv

# User variables
VIRTUALENV_FOLDER=~/python-virtualenvs/sampled_reachability_maps

# Create a Python virtual environment
[ ! -d "$VIRTUALENV_FOLDER" ] && mkdir -p $VIRTUALENV_FOLDER
python3.8 -m venv $VIRTUALENV_FOLDER
echo "Created Python virtual environment in $VIRTUALENV_FOLDER"

# Install all the Python packages required
# Note that these overlay over whatever ROS 2 already contains
#source "${VIRTUALENV_FOLDER}/bin/activate"
#SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
#pushd "$SCRIPT_DIR/.." || exit
#python -m pip install --upgrade pip
# Install catkin-pkg because https://github.com/colcon/colcon-ros/issues/118
#pip install ./pyrobosim
#pip3 install -r test/python_test_requirements.txt
#popd || exit
#deactivate

# Print confirmation and instructions at the end
echo -e "


Created Python virtual environment and installed packages at the following location:

  ${VIRTUALENV_FOLDER}

Source the environment using the following command:

  source setup/source_srm.bash
"
