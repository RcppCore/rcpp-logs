
Rcpp Release status as of 2014-01-29
------------------------------------

Running the script summarizing results straight out of its repo:

    edd@max:~/git/rcpp-logs$ Rscript results/Rcpp-Summary-20140112.R 
    Good          158 
      AsIs        143
      w/Imports   12
      w/Other     2
      w/Question  1 
    Bad Rcpp      0 
      RcppApi     0 
      Unclear     0 
    Bad other     5 
      BioCDep     4 
      NotRcpp     0 
      Skipped     1 
    Total         163 
    Bad Rcpp Pct  0 

See the `status` directory for more details.
