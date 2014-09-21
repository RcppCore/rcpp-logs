#!/usr/bin/r

cat("Started at ", format(Sys.time()), "\n")
pkg <- "RcppArmadillo"

loclib <- "/tmp/RcppDepends/lib"
Sys.setenv("R_LIBS_USER"="/tmp/RcppDepends/lib")
#Sys.setenv("CC"="gcc")   ## needed for a bad interaction between autoconf and llvm on Ubuntu 13.10
#Sys.setenv("CXX"="g++")  ## idem

r <- getOption("repos")
r["CRAN"] <- "http://cran.rstudio.com"
r["BioCsoft"] <- "http://www.bioconductor.org/packages/release/bioc"
options(repos = r)

setwd("/tmp/RcppDepends")

## clean old lib or repo files in /tmp
invisible(sapply(list.files("/tmp", "(repos|lib).*rds$", full.names=TRUE), unlink))

IP <- installed.packages(lib.loc=loclib) 
AP <- available.packages(contrib.url("http://cran.r-project.org"), filter=list())	# available package at CRAN
rcpparmaset <- sort(unname(AP[unique(c(grep(pkg, as.character(AP[,"Depends"])),
                                       grep(pkg, as.character(AP[,"LinkingTo"])),
                                       grep(pkg, as.character(AP[,"Imports"])))),"Package"]))
print( rcpparmaset )

res <- data.frame(pkg=rcpparmaset, res=NA)

#for (pi in 1:nrow(res)) {
#lres <- mclapply(1:nrow(res), mc.cores = 4, FUN=function(pi) {
lres <- lapply(1:nrow(res), FUN=function(pi) {
    p <- rcpparmaset[pi]
    i <- which(AP[,"Package"]==p)
    pkg <- paste(AP[i,"Package"], "_", AP[i,"Version"], ".tar.gz", sep="")
    pathpkg <- paste(AP[i,"Repository"], "/", pkg, sep="")
    #print(pathpkg)

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
    rc <- system(paste("xvfb-run --server-args=\"-screen 0 1024x768x24\" ",
                       "R CMD check --no-manual --no-vignettes ", pkg, " > ", pkg, ".log", sep=""))
    res[pi, "res"] <- rc
    cat("\n\nRESULT for", pkg, ":", ifelse(rc==0, "success", "failure"), "\n\n\n")
    res[pi, ]
})

res <- do.call(rbind, lres)
print(res)
write.table(res, file=paste("result-", strftime(Sys.time(), "%Y%m%d-%H%M%S"), ".txt", sep=""), sep=",")
save(res, file=paste("result-", strftime(Sys.time(), "%Y%m%d-%H%M%S"), ".RData", sep=""))
cat("Ended at ", format(Sys.time()), "\n")
