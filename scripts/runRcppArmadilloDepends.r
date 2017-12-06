#!/usr/bin/r

suppressMessages({
    library(docopt)        # no not see methods loads
    #library(crayon)
})

doc <- paste0("

Usage: runRcppArmadilloDepends.r [-n] [-h]

-n --dryrun        dryrun, downloads packages but does not test
-h --help          show this help text

")

opt <- docopt(doc)

cat("Started at ", format(Sys.time()), "\n")
pkg <- "Rcpp"
cat(pkg, " version is ", packageDescription(pkg)$Version, "\n")
pkg <- "RcppArmadillo"
cat(pkg, " version is ", packageDescription(pkg)$Version, "\n")

#rbinary <- "RD"
rbinary <- "R"
rversion <- system(paste(rbinary, "--version | head -1"), intern=TRUE)
cat(rversion, "\n")
gppversion <- system("g++ --version | head -1", intern=TRUE)
cat("g++ version", gppversion, "\n")

## use a test-local directory, install Rcpp, RcppArmadillo, ... there
## this will work for sub-shells such as the ones started by system() below
if (!file.exists("/tmp/RcppDepends")) dir.create("/tmp/RcppDepends")
if (!file.exists("/tmp/RcppDepends/lib")) dir.create("/tmp/RcppDepends/lib")
loclib <- "/tmp/RcppDepends/lib"
Sys.setenv("R_LIBS_USER"="/tmp/RcppDepends/lib")
#Sys.setenv("CC"="gcc")   ## needed for a bad interaction between autoconf and llvm on Ubuntu 13.10
#Sys.setenv("CXX"="g++")  ## idem
#Sys.setenv("MAKE"="make -j 2 -O")

r <- getOption("repos")
r["CRAN"] <- "http://cran.rstudio.com"
r["BioCsoft"] <- "http://www.bioconductor.org/packages/release/bioc"
options(repos = r)

Sys.setenv("BOOSTLIB"="/usr/include")   # for the borked src/Makevars of ExactNumCI
Sys.setenv("RGL_USE_NULL"="TRUE")       # Duncan Murdoch on r-package-devel on 12 Aug 2015

## clean old lib or repo files in /tmp
invisible(sapply(list.files("/tmp", "(repos|lib).*rds$", full.names=TRUE), unlink))

## update local lib/
update.packages(lib.loc="lib/", ask=FALSE)

IP <- installed.packages(lib.loc=loclib)
AP <- available.packages(contrib.url("http://cran.r-project.org"), filter=list())	# available package at CRAN
#rcpparmaset <- sort(unname(AP[unique(c(grep(pkg, as.character(AP[,"Depends"])),
#                                       grep(pkg, as.character(AP[,"LinkingTo"])),
#                                       grep(pkg, as.character(AP[,"Imports"])))),"Package"]))

rcpparmaset <- tools::dependsOnPkgs(pkg, recursive=FALSE, installed=AP)

## exclset <- c("cqrReg",          # requires Rmosek which require Mosek which is commercial
##              "miceadds",        # requires jomo which requires Rmosek
##              "RStoolbox",	# requires rgdal
##              "stplanr"		# requires rgdal
##              )


exclfile <- "data/blacklist.csv"
exclset <- if (file.exists(exclfile)) read.csv(exclfile, stringsAsFactors=FALSE, comment.char="#")[,1] else character(0)
cat("Excluded: \n")
print(exclset)

cat("Reverse Depends: \n")
print(rcpparmaset)

setwd("/tmp/RcppDepends")

res <- data.frame(pkg=rcpparmaset, res=NA)
good <- bad <- skipped <- 0
n <- nrow(res)
starttime <- Sys.time()

remtime <- function(ndone, ntotal, starttime, thisstart) {
    now <- Sys.time()
    running <- as.numeric(difftime(now, starttime, unit="secs"))
    avgtime <- running/ndone
    remaining <- (ntotal-ndone)*avgtime
    paste("Now", strftime(now, "%H:%M:%S"),
          "This", round(difftime(now, thisstart, unit="sec"), digits=1), "sec,",
	  "Avg", round(avgtime, digits=1), "sec,",
          "exp. finish in", round(remaining/60, digits=1),
          "min at", strftime(now+remaining, "%H:%M:%S on %d-%b-%Y"))
}

#for (pi in 1:nrow(res)) {
#lres <- mclapply(1:nrow(res), mc.cores = 4, FUN=function(pi) {
lres <- lapply(1:nrow(res), FUN=function(pi) {
    p <- rcpparmaset[pi]
    i <- which(AP[,"Package"]==p)
    pkg <- paste(AP[i,"Package"], "_", AP[i,"Version"], ".tar.gz", sep="")
    pathpkg <- paste(AP[i,"Repository"], "/", pkg, sep="")
    #print(pathpkg)

    thisstart <- Sys.time()

    if (p %in% exclset) {
        skipped <<- skipped + 1
        cat(sprintf("%s : %s (%d of %d, %d good, %d bad, %d skipped) -- %s\n",
                    pkg, "skipped", pi, n, good, bad, skipped,
                    remtime(good+bad, n, starttime, thisstart)))
        res[pi, "res"] <- 2
        return(res[pi, ])
    }

    ipidx <- which(IP[,"Package"] == p)
    if ((length(ipidx) == 0) || (IP[ipidx,"Version"] != AP[i,"Version"])) {
        ##install.packages(p, lib=loclib, quiet=TRUE, verbose=FALSE, dependencies=TRUE)
        cat("*** need to install ", p, "\n")
    }

    if (!file.exists(pkg)) {
        ## we got random download failures once in a while, so if running locally, use CRANberries-created mirror
        localPath <- paste("/home/edd/cranberries/sources/", pkg, sep="")
        if (file.exists(localPath)) {
            file.copy(localPath, ".")
        } else {
            download.file(pathpkg, pkg, quiet=TRUE)
        }
    }

    if (opt$dryrun) {
        rc <- 0
    } else {
        rc <- system(paste("xvfb-run-safe --server-args=\"-screen 0 1024x768x24\" ",
                           rbinary,         # R or RD
                           " CMD check --no-manual --no-vignettes ", pkg, " 2>&1 > ", pkg, ".log", sep=""))
    }
    res[pi, "res"] <- rc
    if (rc == 0) {
        good <<- good + 1
    } else {
        bad <<- bad + 1
    }
    cat(sprintf("%s : %s (%d of %d, %d good, %d bad, %d skipped) -- %s\n",
                pkg, if (rc==0) "success" else "failure", pi, n, good, bad, skipped,
                remtime(good+bad+skipped, n, starttime, thisstart)))
    res[pi, ]
})

res <- do.call(rbind, lres)
res[, "res"] <- factor(res[, "res"], levels=0:2, labels=c("ok", "failed", "skipped"))
write.table(res, file=paste("result-", strftime(Sys.time(), "%Y%m%d-%H%M%S"), ".txt", sep=""), sep=",")
save(res, file=paste("result-", strftime(Sys.time(), "%Y%m%d-%H%M%S"), ".RData", sep=""))
print(res)
print(table(res[,"res"]))
cat("FAILED:\n")
print(as.character(res[ res[,"res"] == "failed", "pkg"])) # factor makes it 1:3, not 0:2
cat("SKIPPED:\n")
print(as.character(res[ res[,"res"] == "skipped", "pkg"]))
cat("Ended at ", format(Sys.time()), "\n")
