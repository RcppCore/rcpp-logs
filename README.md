
Rcpp 0.11.3.3 as of 2014-12-14
------------------------------

Running the script summarizing results straight out of its repo:

```{sh}
edd@max:~/git/rcpp-logs/results(master)$ ./Rcpp-Summary-20141214.R
Good          299 
  AsIs        293 
  w/Patches   6 
Bad           17 
  NotRcpp     10 
Skipped       0 
Total         310 
Bad Percent   0.0221519 
edd@max:~/git/rcpp-logs/results(master)$ 
edd@max:~/git/rcpp-logs/results(master)$ 
```

The "bad" cases are detailed in the corresponding file in the `results`
directory.


RcppArmadillo 0.4.600.0 as of 2014-12-27
----------------------------------------

The script `runRcppArmadilloDepends` was run over all 102 current `Depends:`
of RcppArmadillo.  All but four passed; see the `results/rcpparmadillo` directory for more.

```{sh}
edd@max:~/git/rcpp-logs/results/rcpparmadillo(master)$ ./RcppArmadillo-Summary-20141227.R
Good          98 
  AsIs        98 
Bad           4 
  NotRcpp     4 
Skipped       0 
Total         102 
Bad Percent   0 
edd@max:~/git/rcpp-logs/results/rcpparmadillo(master)$ 
```
