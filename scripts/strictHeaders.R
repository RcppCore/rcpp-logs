#!/usr/bin/env r

suppressMessages({
    library(RSQLite)
    library(data.table)
})

getFails <- function() {
    run1 <- dbConnect(SQLite(), "~/git/rcpp-logs/queues/Rcpp_2018-09-07/queuefile.sqlite")
    run2 <- dbConnect(SQLite(), "~/git/rcpp-logs/queues/Rcpp_2018-09-08/queuefile.sqlite")

    res1 <- setDT(dbGetQuery(run1, "select * from results"))
    res2 <- setDT(dbGetQuery(run2, "select * from results"))

    ## correct res1 for the two which were later added to skip list
    res1[ package %in% c("bgsmtr", "EstMix") , result:=2]

    ## find the ones in run2 that failed
    cands <- res2[ result==1, 1:3 ]
    ## inner join with run1, extract the ones that worked there --> new failures
    fails <- res1[cands[,1:3], 1:3, on="package"][result==0]

    #print(fails)
    fails
}

getMaintainers <- function(fails) {
    db <- setDT(tools::CRAN_package_db())

    setkey(fails, package)
    setkey(db, Package)

    maints <- db[ fails[, .(package, version)], .(Package, Version, Maintainer)  ]
    maints
}

getMaintainerAndPackages <- function(maints) {
    options(width=100)

    ## need one special case: one package without accent in name, two with
    maints[Maintainer == "Miquel De Caceres <miquelcaceres@gmail.com>",
           Maintainer := "Miquel De Cáceres <miquelcaceres@gmail.com>" ]

    setkey(maints, Maintainer)

    mm <- maints[ , .(pkgs=paste(Package, collapse=", ")), by=Maintainer]
    mm
}

getCompilationsFailures <- function() {
    fails <- getFails()
    maints <- getMaintainers(fails)

    for (i in seq_len(nrow(maints))) {
        p <- maints[i, .(Package)][[1]]
        cat("\n**",  p, ":", "\n")
        cmd <- sprintf("grep \"was not declared\" tmp/prrd/%s.Rcheck/00install.out", p)
        ##print(cmd)
        system(cmd)
    }
    NULL
}

emailMaintainers <- function(maints) {
    for (i in seq_len(nrow(maints))) {
        pkgs <- maints[i, .(pkgs)][[1]]
        maint <- maints[i, .(Maintainer)][[1]]
        cmd <- sprintf(paste0("cat ~/git/rcpp/local/mail_strict_headers_2018-09.txt | ",
                              "mailx -s \"%s and STRICT_R_HEADERS via Rcpp\" ",
                              "-r \"Dirk Eddelbuettel <edd@debian.org>\" -- \"%s\""),
                       pkgs, maint)
        cat(cmd, "\n")
        system(cmd)
        Sys.sleep(2)
    }
}

#fails <- getFails()
#maints <- getMaintainers(fails)

## print(maints[])
## save(fails, maints, file="/tmp/maint.Rdata")
load("/tmp/maint.Rdata")
maints[ Maintainer=="ORPHANED", Maintainer:="Dirk Eddelbuettel <edd@debian.org>"]
mp <- getMaintainerAndPackages(maints)
emailMaintainers(mp)
