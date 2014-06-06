
Rcpp 0.11.2 release status as of 2014-06-06
-------------------------------------------

Running the script summarizing results straight out of its repo:

    edd@max:~/git/rcpp-logs/results$ Rscript Rcpp-Summary-20140606.txt
    Good          202 
      AsIs        202 
    Bad           16 
      RcppApi     0 
      Unclear     2 
      NotRcpp     14 
    Skipped       1 
    Total         219 
    Bad Percent   0.00917431 
    edd@max:~/git/rcpp-logs/results$ 

The 14 'NotRcpp' cases are detailed in the corresponding file in the `status`
directory.


RcppArmadillo 0.4.300.7.0 release status as of 2014-05-31
---------------------------------------------------------

The script `runRcppArmadilloDepends` was run over all 67 current `Depends:`
of RcppArmadillo.  All but three passed; see the `status` directory for more.
