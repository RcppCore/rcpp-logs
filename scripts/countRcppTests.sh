#!/bin/bash

cd ~/git/rcpp/inst/unitTests/
echo -n "Functions: "
egrep "test.* function\(" runit.*R | wc -l
echo -n "Tests    : "
egrep "check(Equals|Exception|True)" runit.*R  | wc -l 
