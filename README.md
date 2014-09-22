
Rcpp 0.11.2.4 as of 2014-09-04
------------------------------

Running the script summarizing results straight out of its repo:

```{sh}
edd@don:~/git/rcpp-logs/results$ ./Rcpp-Summary-20140904.R 
Good          249 
  AsIs        249 
Bad           18 
  RcppApi     0 
  Unclear     3 
  NotRcpp     15 
Skipped       0 
Total         267 
Bad Percent   0.011236 
edd@don:~/git/rcpp-logs/results$ 
```

The "bad" cases are detailed in the corresponding file in the `status`
directory.


RcppArmadillo 0.4.419.3.0 as of 2014-09-16
------------------------------------------

The script `runRcppArmadilloDepends` was run over all 87 current `Depends:`
of RcppArmadillo.  All but four passed; see the `status` directory for more.

```{sh}
edd@don:~/git/rcpp-logs/results$ ./RcppArmadillo-Summary-20140916.R 
Good          83 
  AsIs        83 
Bad           4 
  NotRcpp     4 
Skipped       0 
Total         87 
Bad Percent   0 
edd@don:~/git/rcpp-logs/results$ 
```
