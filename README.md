
Rcpp 0.11.2 release status as of 2014-05-27
-------------------------------------------

Running the script summarizing results straight out of its repo:


    edd@max:~/git/rcpp-logs/results$ Rscript Rcpp-Summary-20140527.R 
    Good          195 
      AsIs        195 
    Bad           18 
      RcppApi     0 
      Unclear     2 
      NotRcpp     16 
    Skipped       2 
    Total         215 
    Bad Percent   0.00938967 
    edd@max:~/git/rcpp-logs/results$ 

The 16 'NotRcpp' cases are detailed in the corresponding file in the `status`
directory.
