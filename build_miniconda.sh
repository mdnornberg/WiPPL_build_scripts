#!/bin/bash
#
# Retrieve, build, and install miniconda
#
# Written by M.D. Nornberg
# UW Madison
# 28 Feb 2018
#

########################################
#                                      #
# Define URLs and repositories from    #
# which we will download source code   #
#                                      #
########################################

MiniCondaURL='https://repo.continuum.io/miniconda/Miniconda2-latest-Linux-x86_64.sh'
MiniConda='Miniconda2-latest-Linux-x86_64.sh'

########################################
#                                      #
# Build MiniConda libraries            #
#                                      #
########################################


localFolder=$PWD

# Miniconda directories
MinicondaDir=$HOME'/miniconda2'

wget $MiniCondaURL
chmod u+x $MiniConda

# Test if the MultiNest directory is already created
if [ -d $MinicondaDir ]
then
    echo "Miniconda already installed. Updating..."
    ./$MiniConda -bu
else
    echo "Retrieving Miniconda source code..."
    ./$MiniConda -b
fi

export PATH="$HOME/miniconda2/bin:$PATH"
export MiniCondaPkg=$HOME/miniconda2/lib/python2.7/site-packages

conda update --yes conda

