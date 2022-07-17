Assignment 05

07/17/2022

I chose the xgboost library for lab3 and now for this assignment.

Steps to build xgboost:

(helpful link : https://xgboost.readthedocs.io/en/latest/build.html)

1) Download xgboost using git
   1. git clone --recursive https://github.com/dmlc/xgboost
1) cd xgboost
   mkdir build
   cd build
1) cmake -DCMAKE\_CXX\_FLAGS=-pg -DCMAKE\_EXE\_LINKER\_FLAGS=-pg -DCMAKE\_SHARED\_LINKER\_FLAGS=-pg ..
1) (later also tried):
   1. cmake -DCMAKE\_CXX\_FLAGS="-pg -O0" -DCMAKE\_EXE\_LINKER\_FLAGS="-pg -O0" -DCMAKE\_SHARED\_LINKER\_FLAGS="-pg -O0" ..
1) make -j$(nproc)
1) cd ../python-package
1) pip install -e .  # or equivalently python setup.py develop

Then run assignment\_05.py (which loads imports the xgboost library and runs some xgboost commands via python).

Confirmed that the xgboost.so file in [\\wsl.localhost\Ubuntu-20.04\home\jpaugh\git\xgboost\lib]() is new - it is being built.

Expected:

See \*.gmon in the lib or some other directory

Actual:

Don’t see the file anywhere under my home directory



