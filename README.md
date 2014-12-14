
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

The "bad" cases are detailed in the corresponding file in the `status`
directory.


RcppArmadillo 0.4.549.2.0 as of 2014-11-20
------------------------------------------

The script `runRcppArmadilloDepends` was run over all 96 current `Depends:`
of RcppArmadillo.  All but five passed; see the `status` directory for more.

```{sh}
edd@max:~/git/rcpp-logs/results(master)$ ./RcppArmadillo-Summary-20141120.R 
Good          91 
  AsIs        91 
Bad           5 
  NotRcpp     5 
Skipped       0 
Total         96 
Bad Percent   0 
edd@max:~/git/rcpp-logs/results(master)$
```
