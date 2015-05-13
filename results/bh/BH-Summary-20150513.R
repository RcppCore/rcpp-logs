#!/usr/bin/Rscript

## BH 1.58.0-0

#load("~/git/rcpp-logs/results/bh/result-20150513-075645.RData")
#dput(goodPkg <- as.character(subset(res, res==0)[,1]))

goodPkg <- c("bigalgebra", "biganalytics", "bigmemory", "bigpca", "bigrf", 
             "bigtabulate", "Boom", "BoomSpikeSlab", "bsts", "dfcomb", "dfmta", 
             "dynsurv", "FeatureHashing", "fts", "GUTS", "haven", "lsgl", 
             "MBA", "mvnfast", "odeintr", "orsk", "RcppBDT", "RcppMLPACK", 
             "RcppStreams", "readr", "sgd", "sglOptim", "SSN", "synchronicity", 
             "xml2")

#dput(badPkg <- as.character(subset(res, res==1)[,1]))
badPkg <- c("ddalpha", "dplyr", "FunChisq", "mixedMem", "msgl", "nabor", 
            "pcalg", "PReMiuM", "rcppbugs",

            ## after change to BH fixing atomic
            "FunChisq", "mixedMem", "pcalg", "PReMiuM", "rcppbugs"
            )

bad4bh <- c()
##             "FunChisq",		# fatal error: boost/atomic/detail/caps_gcc_atomic.hpp: No such file or directory
##             "mixedMem",		# idem
##             "pcalg",		# idem
##             "PReMiuM",		# idem
##             "rcppbugs"		# idem
##            )

bad4notbh <- c("ddalph",	# missing boost::math header ?
               "dplyr",		# there is no package called 'Lahman'
               "msgl",		# "usual" test failure, known for months
               "nabor"          # there is no package called 'RANN'
               )

good <- length(goodPkg)
badother <- length(bad4notbh) 
badbh <- length(bad4bh) 
bad <- badbh + badother
skipped <- 0


cat("Good         ", good, "\n")
cat("  AsIs       ", length(goodPkg), "\n")
cat("Bad          ", bad, "\n")
cat("  NotBH      ", length(bad4notbh), "\n")
cat("Skipped      ", skipped, "\n")
cat("Total        ", good + bad + skipped, "\n")
cat("Bad Percent  ", badbh / (good + bad), "\n")

