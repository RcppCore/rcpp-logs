 
## -- started with Rcpp 0.11.0.3 (current on GitHub as of 2014-Mar-08)
##    as well as current RcppArmadillo and RcppEigen)

#load("~/git/rcpp-logs/results/result-20140308-210152.RData")

## good <- as.character(subset(res, res==0)[,1])
## dput(good)

skippedPkgs <- c("quadrupen",           # takes hours
                 "roxygen2",		# had some off test failure last time
                 "dplyr",		# still confuses Suggests and Depends
                 "WideLM")		# need NVidia and older g++


goodPkg <- c("accelerometry", "acer", "AdaptiveSparsity", "ALKr", "Amelia", 
             "apcluster", "BayesComm", "bcp", "bcpa", "bfa", "bfp", "bifactorial", 
             "bilan", "blockcluster", "CARBayes", "ccaPP", "cda", "CDM", "CIDnetworks", 
             "cladoRcpp", "classify", "clere", "climdex.pcic", "clogitL1", 
             "clusteval", "ClustVarLV", "ConConPiWiFun", "coneproj", "CorReg", 
             "Delaporte", "dils", "disclapmix", "diversitree", "ecp", "EpiContactTrace", 
             "fastGHQuad", "FastHCS", "fastM", "FastPCS", "FastRCS", "FBFsearch", 
             "fdaMixed", "FDRreg", "forecast", "fugeR", "Funclustering", "geiger", 
             "GeneticTools", "geoCount", "glcm", "GMCM", "gMWT", "GOsummaries", 
             "GPvam", "gRbase", "gRim", "growcurves", "GSE", "GxM", "hawkes", 
             "HLMdiag", "hsphase", "httpuv", "HUM", "hypervolume", "IBHM", 
             "inarmix", "IsingSampler", "jaatha", "KernSmoothIRT", "kmc", 
             "Kmisc", "LaF", "lm.br", "marked", "maxent", "mets", "mice", 
             "miceadds", "minqa", "mirt", "miscF", "MPTinR", "MTS", "mvabund", 
             "MVB", "ndl", "NetSim", "ngspatial", "oem", "OmicKriging", "openair", 
             "orQA", "PBC", "pcalg", "PedCNV", "phom", "phylobase", "planar", 
             "plyr", "PReMiuM", "pROC", "propagate", "prospectr", "protViz", 
             "psgp", "Rankcluster", "rARPACK", "Rclusterpp", "RcppArmadillo", 
             "RcppBDT", "rcppbugs", "RcppClassic", "RcppClassicExamples", 
             "RcppCNPy", "RcppDE", "RcppEigen", "RcppExamples", "RcppGSL", 
             "RcppOctave", "RcppProgress", "RcppRoll", "RcppSMC", "RcppXts", 
             "RcppZiggurat", "rexpokit", "rforensicbatwing", "rgam", "RInside", 
             "Rmalschains", "RMessenger", "rmgarch", "Rmixmod", "robustgam", 
             "robustHD", "rococo", "rotations", "RProtoBuf", "RQuantLib", 
             "RSNNS", "RSofia", "Ruchardet", "rugarch", "Rvcg", "RVowpalWabbit", 
             "SBSA", "scrypt", "sdcMicro", "sdcTable", "sequences", "sglOptim", 
             "simFrame", "sirt", "snplist", "spacodiR", "sparseHessianFD", 
             "sparseLTSEigen", "SpatialTools", "stochvol", "strum", "surveillance", 
             "survSNP", "TAM", "TAQMNGR", "tbart", "termstrc", "trustOptim", 
             "tvm", "unmarked", "VideoComparison", "VIM", "waffect", "wordcloud", 
             "wsrf", "XBRL", "zic")
 

## bad <- as.character(subset(res, res==1)[,1])
## dput(bad)
badPkg <- c("lme4", "Morpho", "msgl")

## missing BioC depends -- no longer applicable as we now explicitly set the BioC repo too
#bad4BioCdep <- c()

## Failing at compile time due to Rcpp issues
bad4RcppAPI <- c()

bad4unclear <- c("lme4",                # this is reportedly an issue with testthat as on CRAN
                 "msgl")		# as CRAN had notified us, msgl fails on stop() in one of its tests

bad4notrcpp <-   c("Morpho")		# fails when _Suggest:_ package 'shapes' is not installed

good <- length(goodPkg)
badrcpp <- length(bad4RcppAPI) + length(bad4unclear)
badother <- length(bad4notrcpp) 
bad <- badrcpp + badother
skipped <- length(skippedPkgs)


cat("Good         ", good, "\n")
cat("  AsIs       ", length(goodPkg), "\n")
#cat("  w/Other    ", length(goodWithOtherChange), "\n")
#cat("  w/Question ", length(goodWithQuestion), "\n")
cat("Bad          ", bad, "\n")
cat("  RcppApi    ", length(bad4RcppAPI), "\n")
cat("  Unclear    ", length(bad4unclear), "\n")
#cat("  Other      ", badother, "\n")
#cat("  BioCDep    ", length(bad4BioCdep), "\n")
cat("  NotRcpp    ", length(bad4notrcpp), "\n")
cat("Skipped      ", skipped, "\n")
cat("Total        ", good + bad + skipped, "\n")
cat("Bad Percent  ", badrcpp / (good + bad), "\n")


## Checking: packages as of Mar 8
allPkg <- c("accelerometry", "acer", "AdaptiveSparsity", "ALKr", "Amelia", 
            "apcluster", "BayesComm", "bcp", "bcpa", "bfa", "bfp", "bifactorial", 
            "bilan", "blockcluster", "CARBayes", "ccaPP", "cda", "CDM", "CIDnetworks", 
            "cladoRcpp", "classify", "clere", "climdex.pcic", "clogitL1", 
            "clusteval", "ClustVarLV", "ConConPiWiFun", "coneproj", "CorReg", 
            "Delaporte", "dils", "disclapmix", "diversitree", "ecp", "EpiContactTrace", 
            "fastGHQuad", "FastHCS", "fastM", "FastPCS", "FastRCS", "FBFsearch", 
            "fdaMixed", "FDRreg", "forecast", "fugeR", "Funclustering", "geiger", 
            "GeneticTools", "geoCount", "glcm", "GMCM", "gMWT", "GOsummaries", 
            "GPvam", "gRbase", "gRim", "growcurves", "GSE", "GxM", "hawkes", 
            "HLMdiag", "hsphase", "httpuv", "HUM", "hypervolume", "IBHM", 
            "inarmix", "IsingSampler", "jaatha", "KernSmoothIRT", "kmc", 
            "Kmisc", "LaF", "lm.br", "lme4", "marked", "maxent", "mets", 
            "mice", "miceadds", "minqa", "mirt", "miscF", "Morpho", "MPTinR", 
            "msgl", "MTS", "mvabund", "MVB", "ndl", "NetSim", "ngspatial", 
            "oem", "OmicKriging", "openair", "orQA", "PBC", "pcalg", "PedCNV", 
            "phom", "phylobase", "planar", "plyr", "PReMiuM", "pROC", "propagate", 
            "prospectr", "protViz", "psgp", "Rankcluster", "rARPACK", "Rclusterpp", 
            "RcppArmadillo", "RcppBDT", "rcppbugs", "RcppClassic", "RcppClassicExamples", 
            "RcppCNPy", "RcppDE", "RcppEigen", "RcppExamples", "RcppGSL", 
            "RcppOctave", "RcppProgress", "RcppRoll", "RcppSMC", "RcppXts", 
            "RcppZiggurat", "rexpokit", "rforensicbatwing", "rgam", "RInside", 
            "Rmalschains", "RMessenger", "rmgarch", "Rmixmod", "robustgam", 
            "robustHD", "rococo", "rotations", "RProtoBuf", "RQuantLib", 
            "RSNNS", "RSofia", "Ruchardet", "rugarch", "Rvcg", "RVowpalWabbit", 
            "SBSA", "scrypt", "sdcMicro", "sdcTable", "sequences", "sglOptim", 
            "simFrame", "sirt", "snplist", "spacodiR", "sparseHessianFD", 
            "sparseLTSEigen", "SpatialTools", "stochvol", "strum", "surveillance", 
            "survSNP", "TAM", "TAQMNGR", "tbart", "termstrc", "trustOptim", 
            "tvm", "unmarked", "VideoComparison", "VIM", "waffect", "wordcloud", 
            "wsrf", "XBRL", "zic")

checkPkg <- c(goodPkg, badPkg)
stopifnot(length(setdiff(checkPkg, allPkg))==0)
stopifnot(length(setdiff(allPkg, checkPkg))==0)



