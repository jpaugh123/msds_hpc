#!/bin/bash

printf "Jon Paugh bash script for Lab 03\n"

cd ~/git/xgboost
mkdir build
cd build
cmake ..
make -j$(nproc)
