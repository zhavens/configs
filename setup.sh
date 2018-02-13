#! /bin/bash

for f in $(ls -a | egrep "^\.\w+"); do
    cp $f ~/
done
