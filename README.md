
Rcpp 0.11.2.6 as of 2014-09-22
------------------------------

Running the script summarizing results straight out of its repo:

```{sh}
edd@max:~/git/rcpp-logs/results(master)$ ./Rcpp-Summary-20140922.R
Good          254 
  AsIs        254 
Bad           16 
  RcppApi     0 
  Unclear     1 
  NotRcpp     15 
Skipped       0 
Total         270 
Bad Percent   0.0037037 
edd@max:~/git/rcpp-logs/results(master)$ 
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
