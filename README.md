
Rcpp 0.11.4.5 as of 2015-02-07
------------------------------

Running the script summarizing results straight out of its repo:

```{sh}
edd@max:~/git/rcpp-logs/results(master)$ ./Rcpp-Summary-20150207.R
Good          324 
  AsIs        324 
  w/Patches   0 
Bad           5 
  Unclear     0 
  NotRcpp     5 
Skipped       2 
Total         329 
Bad Percent   0 
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
