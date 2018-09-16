suppressMessages({
    library(RSQLite)
    library(data.table)
})

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
