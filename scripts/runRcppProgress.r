#!/usr/bin/r

cat("Started at ", format(Sys.time()), "\n")
pkg <- "RcppProgress"
cat(pkg, " version is ", packageDescription(pkg)$Version, "\n")
cat("Rcpp version is ", packageDescription("Rcpp")$Version, "\n")

rbinary <- "R"
rversion <- system(paste(rbinary, "--version | head -1"), intern=TRUE)
cat(rversion, "\n")



## use a test-local directory, install Rcpp, RcppArmadillo, ... there
## this will work for sub-shells such as the ones started by system() below
if (!file.exists("/tmp/RcppDepends")) dir.create("/tmp/RcppDepends")
if (!file.exists("/tmp/RcppDepends/lib")) dir.create("/tmp/RcppDepends/lib")
loclib <- "/tmp/RcppDepends/lib"
Sys.setenv("R_LIBS_USER"="/tmp/RcppDepends/lib")
#Sys.setenv("CC"="gcc")   ## needed for a bad interaction between autoconf and llvm on Ubuntu 13.10
#Sys.setenv("CXX"="g++")  ## idem
if (Sys.getenv("MAKE") == "") Sys.setenv("MAKE"="make -j 4 -O")

r <- getOption("repos")
r["CRAN"] <- "http://cran.rstudio.com"
r["BioCsoft"] <- "http://www.bioconductor.org/packages/release/bioc"
options(repos = r)

setwd("/tmp/RcppDepends")

## clean old lib or repo files in /tmp
invisible(sapply(list.files("/tmp", "(repos|lib).*rds$", full.names=TRUE), unlink))

## update local lib/
update.packages(lib.loc="lib/", ask=FALSE)

IP <- installed.packages(lib.loc=loclib)
AP <- available.packages(contrib.url("http://cran.r-project.org"), filter=list())	# available package at CRAN
pkgset <- sort(unname(AP[unique(c(grep(pkg, as.character(AP[,"Depends"])),
                                  grep(pkg, as.character(AP[,"LinkingTo"])),
                                  grep(pkg, as.character(AP[,"Imports"])))),"Package"]))

exclset <- c(""			# nothing right now
             )

pkgset <- pkgset[ ! pkgset %in% exclset ]

print( pkgset )

res <- data.frame(pkg=pkgset, res=NA, stringsAsFactors=FALSE)
good <- bad <- 0
n <- nrow(res)

starttime <- Sys.time()

remtime <- function(ndone, ntotal, starttime, thisstart) {
    now <- Sys.time()
    running <- as.numeric(difftime(now, starttime, unit="secs"))
    #print(running)
    avgtime <- running/ndone
    #print(avgtime)
    remaining <- (ntotal-ndone)*avgtime
    #print(remaining)
    #cat(format(now),"--",format(starttime), "--", running, "--", avgtime, "--", remaining,"\n")
    paste("Now", strftime(now, "%H:%M:%S"),
          "This", round(difftime(now, thisstart, unit="sec"), digits=1), "sec,",
	  "Avg", round(avgtime, digits=1), "sec,",
          "exp. finish in", round(remaining/60, digits=1),
          "min at", strftime(now+remaining, "%H:%M:%S on %d-%b-%Y"))
}

#for (pi in 1:nrow(res)) {
#lres <- mclapply(1:nrow(res), mc.cores = 4, FUN=function(pi) {
lres <- lapply(1:nrow(res), FUN=function(pi) {
    p <- pkgset[pi]
    i <- which(AP[,"Package"]==p)
    pkg <- paste(AP[i,"Package"], "_", AP[i,"Version"], ".tar.gz", sep="")
    pathpkg <- paste(AP[i,"Repository"], "/", pkg, sep="")
    #print(pathpkg)

    thisstart <- Sys.time()
    ipidx <- which(IP[,"Package"] == p)
    if ((length(ipidx) == 0) || (IP[ipidx,"Version"] != AP[i,"Version"])) {
        install.packages(p, lib=loclib)
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

    #if (!file.exists(pkg)) download.file(pathpkg, pkg, quiet=TRUE)
    rc <- system(paste("xvfb-run-safe --server-args=\"-screen 0 1024x768x24\" ",
                       rbinary,         # R or RD
                       " CMD check --no-manual --no-vignettes ", pkg, " 2>&1 > ", pkg, ".log", sep=""))
    res[pi, "res"] <- rc
    if (rc == 0) {
        good <<- good + 1
    } else {
        bad <<- bad + 1
    }
    cat(sprintf("\nRESULT for %s : %s (%d of %d, %d good, %d bad) -- %s\n",
                pkg, if (rc==0) "success" else "failure", pi, n, good, bad,
                remtime(good+bad, n, starttime, thisstart)))
    res[pi, ]

})

res <- do.call(rbind, lres)
write.table(res, file=paste("result-", strftime(Sys.time(), "%Y%m%d-%H%M%S"), ".txt", sep=""), sep=",")
save(res, file=paste("result-", strftime(Sys.time(), "%Y%m%d-%H%M%S"), ".RData", sep=""))
print(res)
print(table(res[,"res"]))
print(as.character(res[ res[,"res"] == 1, "pkg"]))
cat("Ended at ", format(Sys.time()), "\n")
