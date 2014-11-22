
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
