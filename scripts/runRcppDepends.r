#!/usr/bin/r

cat("Started at ", format(Sys.time()), "\n")
pkg <- "Rcpp"
cat(pkg, "version is", packageDescription(pkg)$Version, "on", Sys.info()[["nodename"]], "\n")

rbinary <- "RD"
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
##if (Sys.getenv("MAKE") == "")
#Sys.setenv("MAKE"="make -j 2 -O")

r <- getOption("repos")
r["CRAN"] <- "http://cran.rstudio.com"
r["BioCsoft"] <- "http://www.bioconductor.org/packages/release/bioc"
options(repos = r)

Sys.setenv("BOOSTLIB"="/usr/include")   # for the borked src/Makevars of ExactNumCI
Sys.setenv("RGL_USE_NULL"="TRUE")       # Duncan Murdoch on r-package-devel on 12 Aug 2015

setwd("/tmp/RcppDepends")

## clean old lib or repo files in /tmp
invisible(sapply(list.files("/tmp", "(repos|lib).*rds$", full.names=TRUE), unlink))

## update local lib/
update.packages(lib.loc="lib/", ask=FALSE)

IP <- installed.packages(lib.loc=loclib)
AP <- available.packages(contrib.url(r["CRAN"]),filter=list())	# available package at CRAN
rcppsetOrig <- sort(unname(AP[unique(c(grep("Rcpp", as.character(AP[,"Depends"])),
                                       grep("Rcpp", as.character(AP[,"LinkingTo"])),
                                       grep("Rcpp", as.character(AP[,"Imports"])))),"Package"]))
rcppset <- tools::dependsOnPkgs(pkg, recursive=FALSE, installed=AP)

## exclset <- c("cqrReg",          # requires Rmosek which require Mosek which is commercial
##              "LANDD",		# requires GOstats GOSemSim
##              "mapview",		# requires rgdal
##              "miceadds",        # requires jomo which requires Rmosek
##              "gpuR",            # CUDA
##              #"rags2ridges",     # sometimes takes very long
##              "RStoolbox",	# requires rgdal
##              "satellite", 	# requires rgdal
##              "stplanr",		# requires rgdal
##              "WideLM",          # CUDA (currently off CRAN anyway)
##              "icenReg",         # RcppEigen, not Rcpp
##              "sf",              # requires (more recent) gdal
##              "nanotime",	# RcppCCTZ
##              "BETS", 		# "Imports: Rcpp" but doesn't use it
##              "climwin", 	# RcppRoll
##              "flippant",	# RcppRoll
##               "configr"         # RcppTOML
##              )

exclfile <- "data/blacklist.csv"
exclset <- if (file.exists(exclfile)) read.csv(exclfile, stringsAsFactors=FALSE)[,1] else character(0)

#rcppset <- rcppset[ ! rcppset %in% exclset ]
#if (grep("transnet", rcppset)) {        ## not really an Rcpp user
#    rcppset <- rcppset[ ! grepl("transnet", rcppset) ]
#}
#if (grep("BioGeoBEARS", rcppset)) {     ## indirect match, no need to test
#    rcppset <- rcppset[ ! grepl("BioGeoBEARS", rcppset) ]
#}
#if (grep("quadrupen", rcppset)) {       ## takes hours, skipping
#    rcppset <- rcppset[ ! grepl("quadrupen", rcppset) ]
#}
#if (grep("roxygen2", rcppset)) {        ## seems to hang for reasons that are unclear on its tests
#    rcppset <- rcppset[ ! grepl("roxygen2", rcppset) ]
#}
#if (grep("dplyr", rcppset)) {           ## confuses Suggests: and Depends:
#    rcppset <- rcppset[ ! grepl("dplyr", rcppset) ]
#}
#if (grep("WideLM", rcppset)) {          ## needs working NVidia support
#    rcppset <- rcppset[ ! grepl("WideLM", rcppset) ]
#}

#rcppset <- c("apcluster", "autovarCore")
print(rcppset)

res <- data.frame(pkg=rcppset, res=NA, stringsAsFactors=FALSE)
good <- bad <- skipped <- 0
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
    p <- rcppset[pi]
    i <- which(AP[,"Package"]==p)
    pkg <- paste(AP[i,"Package"], "_", AP[i,"Version"], ".tar.gz", sep="")

    thisstart <- Sys.time()

    if (p %in% exclset) {
        skipped <<- skipped + 1
        cat(sprintf("RESULT for %s : %s (%d of %d, %d good, %d bad, %d skipped) -- %s\n",
                    pkg, "skipped", pi, n, good, bad, skipped,
                    remtime(good+bad, n, starttime, thisstart)))
        res[pi, "res"] <- 2
        return(res[pi, ])
    }

    #print(pkg)
    pathpkg <- paste(AP[i,"Repository"], "/", pkg, sep="")

    ipidx <- which(IP[,"Package"] == p)
    if ((length(ipidx) == 0) || (IP[ipidx,"Version"] != AP[i,"Version"])) {
        #cat("Installing Dependencies\n")
        install.packages(p, lib=loclib, quiet=TRUE, verbose=FALSE, dependencies=TRUE)
    #} else {
        #cat("NOT Installing Dependencies\n")
        #print(ipidx)
    }

    if (!file.exists(pkg)) {
        ## we got random download failures once in a while, so if running locally, use CRANberries-created mirror
        localPath <- paste("/home/edd/cranberries/sources/", pkg, sep="")
        if (file.exists(localPath)) {
            file.copy(localPath, ".")
        } else {
            ##download.file(pathpkg, pkg, quiet=TRUE)
            dl <- download.packages(AP[i,"Package"], ".")
            pkg <- basename(dl[,2])
            cat("Downloaded ", pkg, "\n")
        }
    }

    rc <- system(paste("xvfb-run-safe --server-args=\"-screen 0 1024x768x24\" ",
                       rbinary,         # R or RD
                       " CMD check --no-manual --no-vignettes ", pkg, " 2>&1 > ", pkg, ".log", sep=""))
    res[pi, "res"] <- rc
    if (rc == 0) {
        good <<- good + 1
    } else {
        bad <<- bad + 1
    }
    cat(sprintf("RESULT for %s : %s (%d of %d, %d good, %d bad, %d skipped) -- %s\n",
                pkg, if (rc==0) "success" else "failure", pi, n, good, bad, skipped,
                remtime(good+bad, n, starttime, thisstart)))
    res[pi, ]
})

res <- do.call(rbind, lres)
write.table(res, file=paste("result-", strftime(Sys.time(), "%Y%m%d-%H%M%S"), ".txt", sep=""), sep=",")
save(res, file=paste("result-", strftime(Sys.time(), "%Y%m%d-%H%M%S"), ".RData", sep=""))
print(res)
print(table(res[,"res"]))
cat("FAILED:\n")
print(as.character(res[ res[,"res"] == 1, "pkg"]))
cat("SKIPPED:\n")
print(as.character(res[ res[,"res"] == 2, "pkg"]))
cat("Ended at ", format(Sys.time()), "\n")
