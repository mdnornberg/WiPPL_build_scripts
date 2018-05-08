#!/bin/bash
#
# Retreive and install MDSplus libraries
#
# Written by M.D. Nornberg
# UW Madison
# 28 Feb 2018
#

# If we don't already have the source, get and untar the source code
wget https://github.com/MDSplus/mdsplus/archive/stable.tar.gz
tar xzf stable.tar.gz

# Build the source
export MDSPLUS_DIR=$PWD/mdsplus-stable
cd mdsplus-stable
./configure --disable-java --prefix=$MDSPLUS_DIR
make

# Build a Miniconda environment
. build_miniconda.sh

# For now, we are just going to install the global python routines
PyPkgList='cython'
conda install --yes $PyPkgList

pip install --user $MDSPLUS_DIR/mdsobjects/python

# Test installation
python -c 'import MDSplus'

if [ $? -eq 0 ]
then
  echo "MDSplus installed!"
else
  echo "Could not install MDSplus" >&2
fi
