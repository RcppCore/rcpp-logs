
Rcpp Release status as of 2014-01-31
------------------------------------

Running the script summarizing results straight out of its repo:

    edd@max:~/git/rcpp-logs$ Rscript results/Rcpp-Summary-20140112.R 
    Good          166 
      AsIs        155
      w/Imports   8 
      w/Other     0 
      w/Question  1 
    Bad Rcpp      0 
      RcppApi     0 
      Unclear     0 
    Bad other     2 
      BioCDep     0 
      NotRcpp     0 
      Skipped     2 
    Total         166 
    Bad Rcpp Pct  0

See the `status` directory for more details.
