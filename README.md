
Rcpp 0.11.2 release status as of 2014-05-25
-------------------------------------------

Running the script summarizing results straight out of its repo:

   edd@max:~/git/rcpp-logs/results$ Rscript Rcpp-Summary-20140525.R
   Good          191 
     AsIs        191 
   Bad           20 
     RcppApi     0 
     Unclear     2 
     NotRcpp     18 
   Skipped       2 
   Total         213 
   Bad Percent   0.00947867 
   edd@max:~/git/rcpp-logs/results$ 

The 18 'NotRcpp' cases are detailed in the corresponding file in the `status`
directory.
