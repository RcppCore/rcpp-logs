#!/usr/bin/Rscript

## start with Rcpp 0.11.3.4 and RcppArmadillo 0.4.600.0

#load("~/git/rcpp-logs/results/rcpparmadillo/result-20141227-084553.RData")
#goodPkg <- as.character(subset(res, res==0)[,1]); dput(goodPkg)

goodPkg <- c("AdaptiveSparsity", "Amelia", "ASPBay", "BayesComm", "bayou", 
             "bfa", "BIFIEsurvey", "BIPOD", "bvarsv", "ccaPP", "cda", "CDM", 
             "cladoRcpp", "coneproj", "copCAR", "Crossover", "DepthProc", 
             "dfmta", "fastM", "FBFsearch", "fdaMixed", "FDRreg", "fICA", 
             "flip", "forecast", "GeneticTools", "geoCount", "glcm", "GMCM", 
             "gMWT", "GPvam", "gRbase", "gRim", "growcurves", "growfunctions", 
             "GSE", "hawkes", "HLMdiag", "hsphase", "iBATCGH", "icamix", "iccbeta", 
             "lpme", "lsgl", "MAT", "matchingMarkets", "mcIRT", "metafolio", 
             "mets", "miceadds", "miscF", "mmand", "Morpho", "mp", "Mposterior", 
             "MVB", "mvnfast", "ngspatial", "oem", "onlinePCA", "pcalg", "PedCNV", 
             "planar", "PoweR", "prospectr", "psgp", "quadrupen", "rcppbugs", 
             "RcppDE", "RcppMLPACK", "RcppRoll", "RealVAMS", "resemble", "revealedPrefs", 
             "rgam", "rmgarch", "robustgam", "robustHD", "robustreg", "rotations", 
             "rugarch", "SBSA", "SelvarMix", "sglOptim", "sirt", "slfm", "snipEM", 
             "SpatialEpi", "SpatialTools", "spBayesSurv", "survAccuracyMeasures", 
             "synlik", "TAM", "TED", "timma", "treeclim", "unmarked", "zic"
             )

# badPkg <- as.character(subset(res, res==1)[,1]); dput(badPkg)
badPkg <- c("cqrReg", "FisHiCal", "msgl", "strum")

bad4notrcpp <- c(
    "cqrReg",         # require cqrReg which requires Rmosek which requires Mosek -- cannot build
    "FisHiCal",       # builds, bombs in examples on lack of rgl device
    "msgl",	      # as CRAN had notified us, msgl fails on stop() in one of its tests
    "strum"           # needs const correctness patch we offered 
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

