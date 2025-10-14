#!/bin/bash

# Sets up the sampled_reachability_maps environment for development.
#
# One recommendation is to make a bash function for this script in
# your ~/.bashrc file as follows:
#
# For non-ROS workflows:
#
#  srm() {
#    source ~/workspace/gripper_ws/src/sampled_reachability_maps/setup/source_srm.bash
#  }
#
#  So you can then run this from your Terminal:
#    srm
#

# User variables -- change this to meet your needs
export VIRTUALENV_FOLDER=~/python-virtualenvs/sampled_reachability_maps
export PYTHONPATH=~/workspace/gripper_ws/src/sampled_reachability_maps

if [ -n "$VIRTUAL_ENV" ]
then
    deactivate
fi

# Activate the Python virtual environment
source $VIRTUALENV_FOLDER/bin/activate

cd $PYTHONPATH
