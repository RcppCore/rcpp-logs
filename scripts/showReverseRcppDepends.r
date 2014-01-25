#!/usr/bin/r -i

IP <- installed.packages()
AP <- available.packages(contrib.url("http://cran.rstudio.com"),filter=list())[,"Package"]

rcppset <- unique(sort(unname(IP[unique(c(grep("Rcpp", as.character(IP[,"Depends"])),
                                          grep("Rcpp", as.character(IP[,"LinkingTo"])),
                                          grep("Rcpp", as.character(IP[,"Imports"])))),"Package"])))

cat("Rcpp depends which can be upgrades:\n")
print(intersect(rcppset, AP))

cat("\n\nPossibly local / archived / github / bioC ... packages:\n")
print(setdiff(rcppset, AP))


