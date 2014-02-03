#!/usr/bin/env r -i

IP <- installed.packages()
AP <- available.packages(contrib.url("http://cran.rstudio.com"),
                         filter=list())[,"Package"]

rcppset <- tools::dependsOnPkgs("Rcpp", recursive = FALSE)

cat("Rcpp depends which can be upgraded:\n")
print(onCRAN <- intersect(rcppset, AP))
dput(onCRAN)

cat("\n\nPossibly local / archived / github / bioC ... packages:\n")
print(other <- setdiff(rcppset, AP))
dput(other)

## edit these to match locaL preferences
lib <- "/usr/local/lib/R/site-library"
rep <- "http://cran.rstudio.com"

## after possibly adjusting 'onCRAN' run the next line
# install.packages(localOnCRAN, lib=lib, repos=rep)
