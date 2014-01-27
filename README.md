
Rcpp Release status as of 2014-01-27
------------------------------------

Running the script summarizing results straight out of its repo:

    edd@max:~/git/rcpp-logs$ Rscript results/Rcpp-Summary-20140112.R 
    Good          157 
      AsIs        139
      w/Imports   15 
      w/Other     2
      w/Question  1 
    Bad Rcpp      0 
      RcppApi     0 
      Unclear     0 
    Bad other     6 
      BioCDep     4 
      NotRcpp     2 
      Skipped     1 
    Total         163 
    Bad Rcpp Pct  0 

See the `status` directory for more details.
