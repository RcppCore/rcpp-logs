#!/usr/bin/Rscript

## start with Rcpp 0.11.3 and RcppArmadillo 0.4.549.2.0

#load("~/git/rcpp-logs/results/result-20141120-103210.RData")
#good <- as.character(subset(res, res==0)[,1]); dput(good)

goodPkg <- c("AdaptiveSparsity", "Amelia", "BayesComm", "bayou", "bfa", 
             "BIFIEsurvey", "BIPOD", "bvarsv", "ccaPP", "cda", "CDM", "cladoRcpp", 
             "coneproj", "copCAR", "Crossover", "DepthProc", "dfmta", "fastM", 
             "FBFsearch", "fdaMixed", "FDRreg", "fICA", "flip", "forecast", 
             "GeneticTools", "geoCount", "glcm", "GMCM", "gMWT", "GPvam", 
             "gRbase", "gRim", "growcurves", "growfunctions", "GSE", "hawkes", 
             "HLMdiag", "hsphase", "iBATCGH", "lpme", "lsgl", "MAT", "mcIRT", 
             "metafolio", "mets", "miceadds", "miscF", "mmand", "Mposterior", 
             "MVB", "mvnfast", "ngspatial", "oem", "pcalg", "PedCNV", "planar", 
             "PoweR", "prospectr", "psgp", "quadrupen", "rcppbugs", "RcppDE", 
             "RcppMLPACK", "RcppRoll", "RealVAMS", "resemble", "revealedPrefs", 
             "rgam", "rmgarch", "robustgam", "robustHD", "robustreg", "rotations", 
             "rugarch", "SBSA", "SelvarMix", "sglOptim", "sirt", "slfm", "snipEM", 
             "SpatialEpi", "SpatialTools", "spBayesSurv", "strum", "survAccuracyMeasures", 
             "synlik", "TAM", "TED", "treeclim", "unmarked", "zic")

#bad <- as.character(subset(res, res==1)[,1]); dput(bad)
# R> badPkg <- as.character(subset(res, res==1)[,1]); dput(badPkg)

badPkg <- c("FisHiCal", "icamix", "Morpho", "mp", "msgl")

bad4notrcpp <- c(
    "FisHiCal",       # builds, bombs in examples on lack of rgl device
    "icamix",         # builds, bombs in examples on "there is no package called ‘mixtools’"
    "Morpho",         # builds, bombs in examples on "there is no package called ‘shapes’"
    "mp",             # does not build: Package required but not available: ‘svd’ -- works once installed
    "msgl"	      # as CRAN had notified us, msgl fails on stop() in one of its tests
    )

good <- length(goodPkg)
badrcpp <- 0
badother <- length(bad4notrcpp) 
bad <- badrcpp + badother
skipped <- 0


cat("Good         ", good, "\n")
cat("  AsIs       ", length(goodPkg), "\n")
cat("Bad          ", bad, "\n")
cat("  NotRcpp    ", length(bad4notrcpp), "\n")
cat("Skipped      ", skipped, "\n")
cat("Total        ", good + bad + skipped, "\n")
cat("Bad Percent  ", badrcpp / (good + bad), "\n")

