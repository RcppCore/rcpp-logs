
Rcpp 0.12.2 as of 2015-11-14
----------------------------

Running the script summarizing results straight out of its repo:

```{sh}
edd@max:~/git/rcpp-logs/results(master)$ ./Rcpp-Summary-20151114.R
Good          509 
  AsIs        509 
  w/Patches   0 
Bad           2 
  RcppApi     0 
  Unclear     0 
  Bad Deps    1 
  NotRcpp     1 
Skipped       5 
Total         511 
Bad Percent   0.00195695 
edd@max:~/git/rcpp-logs/results(master)$ 
```

The "bad" cases are detailed in the corresponding file in the `results`
directory.


RcppArmadillo and RcppEigen have similar summary scripts in the repo.
