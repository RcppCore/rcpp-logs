
Rcpp 0.11.5.4 as of 2015-04-25
------------------------------

Running the script summarizing results straight out of its repo:

```{sh}
edd@max:~/git/rcpp-logs/results$ ./Rcpp-Summary-20150722.txt
Good          398 
  AsIs        398 
  w/Patches   0 
Bad           21 
  RcppApi     0 
  Unclear     0 
  NotRcpp     21 
Skipped       2 
Total         419 
Bad Percent   0 
edd@max:~/git/rcpp-logs/results$ 
```

The "bad" cases are detailed in the corresponding file in the `results`
directory.


RcppArmadillo and RcppEigen have similar summary scripts in the repo.
