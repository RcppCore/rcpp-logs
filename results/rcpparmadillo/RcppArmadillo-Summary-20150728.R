#!/usr/bin/Rscript

## start with Rcpp 0.12.0 and RcppArmadillo 0.5.300.1

#load("~/git/rcpp-logs/results/rcpparmadillo/result-20150728-092421.RData")
#goodPkg <- as.character(subset(res, res==0)[,1]); dput(goodPkg)

goodPkg <- c("AdaptiveSparsity", "AHR", "Amelia", "ASPBay", "BayesComm", 
             "bayesm", "bayou", "bcp", "bfa", "BIFIEsurvey", "BIPOD", "blockmodels", 
             "bvarsv", "ccaPP", "cccp", "cda", "CDM", "cladoRcpp", "coala", 
             "coneproj", "copCAR", "Crossover", "DepthProc", "dfcomb", "dfmta", 
             "emIRT", "EstHer", "fastM", "FBFsearch", "fdaMixed", "FDRreg", 
             "fICA", "flip", "forecast", "FRESA.CAD", "gaselect", "GeneticTools", 
             "geoCount", "glcm", "glmgraph", "GMCM", "gMWT", "GPvam", "graphicalVAR", 
             "gRbase", "gRim", "growcurves", "growfunctions", "GSE", "hawkes", 
             "HLMdiag", "hsphase", "hypervolume", "iBATCGH", "iccbeta", "kdecopula", 
             "lpme", "lsgl", "markophylo", "markovchain", "MAT", "matchingMarkets", 
             "matchingR", "mcIRT", "metafolio", "mets", "mirtCAT", "miscF", 
             "mixedMem", "mmand", "mp", "Mposterior", "MVB", "mvnfast", "ngspatial", 
             "oem", "onlinePCA", "pcalg", "PedCNV", "planar", "PoweR", "PPtreeViz", 
             "prospectr", "psd", "psgp", "quadrupen", "quanteda", "Rborist", 
             "rcppbugs", "RcppDE", "RcppMLPACK", "RealVAMS", "redist", "resemble", 
             "revealedPrefs", "rgam", "rmgarch", "robustgam", "robustHD", 
             "robustreg", "rotations", "Rphylopars", "rstpm2", "rugarch", 
             "sbmSDP", "SBSA", "SelvarMix", "sgd", "sglOptim", "sirt", "slfm", 
             "snipEM", "SparseFactorAnalysis", "sparsereg", "SpatialEpi", 
             "SpatialTools", "SpatPCA", "spBayesSurv", "spduration", "stm", 
             "stochvol", "strum", "survAccuracyMeasures", "SVMMatch", "synlik", 
             "TAM", "TED", "treeclim", "unmarked", "VarSelLCM", "zic",
             ##
             "timma"
             )


#badPkg <- as.character(subset(res, res==1)[,1]); dput(badPkg)
badPkg <- c("BaBooN", "FisHiCal", "icamix", "miceadds", "Morpho", "MRIaggr", "msgl")

bad4notrcpp <- c(
    "BaBooN",         # builds, fails in examples: "there is no package called ‘norm’"
    "FisHiCal",       # builds, fails in examples: "RGL: GLX extension missing on server"
    "icamix",         # builds, fails in examples: "there is no package called ‘mixtools’"
    "miceadds",       # builds, fails in examples: "there is no package called ‘jomo’"
    "Morpho", 	      # builds, fails in examples: "there is no package called ‘shapes’"
    "MRIaggr",        # builds, fails in examples: "requires to have installed the oro.nifti package to work "
    "msgl")	      # as CRAN had notified us, msgl fails on stop() in one of its tests


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

