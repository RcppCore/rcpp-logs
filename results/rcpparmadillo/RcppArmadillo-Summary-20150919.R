#!/usr/bin/Rscript

## start with Rcpp 0.12.1 and RcppArmadillo 0.5.600.2.0

#load("~/git/rcpp-logs/results/rcpparmadillo/result-20150919-151648.RData")
#goodPkg <- as.character(subset(res, res==0)[,1]); dput(goodPkg)

goodPkg <- c("AdaptiveSparsity", "AHR", "Amelia", "ASPBay", "BaBooN", "BayesComm", 
             "bayesm", "bayou", "bcp", "bfa", "BIFIEsurvey", "BIPOD", "blockmodels", 
             "BTLLasso", "bvarsv", "ccaPP", "cccp", "cda", "CDM", "ChannelAttribution", 
             "cladoRcpp", "coala", "coneproj", "copCAR", "CoxPlus", "Crossover", 
             "DepthProc", "dfcomb", "dfmta", "emIRT", "EPGLM", "EstHer", "FastBandChol", 
             "fastM", "FBFsearch", "fdaMixed", "FDRreg", "fICA", "FisHiCal", 
             "flip", "forecast", "FRESA.CAD", "gaselect", "GeneticTools", 
             "geoCount", "GERGM", "glamlasso", "glcm", "glmgraph", "GMCM", 
             "gMWT", "GPvam", "gRain", "graphicalVAR", "gRbase", "gRim", "growcurves", 
             "growfunctions", "GSE", "hawkes", "HLMdiag", "hsphase", "hypervolume", 
             "iBATCGH", "icamix", "iccbeta", "kdecopula", "Langevin", "lpme", 
             "lsgl", "markophylo", "markovchain", "MAT", "matchingMarkets", 
             "matchingR", "mcemGLM", "mcIRT", "mcmcse", "metafolio", "mets", 
             "mev", "mirt", "mirtCAT", "miscF", "mixedMem", "mmand", "Morpho", 
             "mp", "Mposterior", "MRIaggr", "MVB", "mvnfast", "ngspatial", 
             "oem", "onlinePCA", "PanelCount", "pcalg", "PedCNV", "planar", 
             "PoweR", "PPtreeViz", "prospectr", "psd", "psgp", "quadrupen", 
             "quanteda", "Rborist", "rcppbugs", "RcppDE", "RcppMLPACK", "RealVAMS", 
             "redist", "resemble", "revealedPrefs", "rgam", "rmgarch", "robustgam", 
             "robustHD", "robustreg", "rotations", "Rphylopars", "rstpm2", 
             "rugarch", "sbmSDP", "SBSA", "SelvarMix", "sgd", "sglOptim", 
             "sirt", "slfm", "snipEM", "SparseFactorAnalysis", "sparsereg", 
             "SpatialEpi", "SpatialTools", "SpatPCA", "spBayesSurv", "spduration", 
             "stm", "stochvol", "strum", "survAccuracyMeasures", "SVMMatch", 
             "synlik", "TAM", "TED", "treeclim", "unmarked", "VarSelLCM", 
             "zic",
             ##
             "timma"   ## spurious xvfb issue
             )


#badPkg <- as.character(subset(res, res==1)[,1]); dput(badPkg)
#badPkg <- c("immer", "miceadds", "msgl", "timma")
badPkg <- c("immer", "miceadds", "msgl")

bad4notrcpp <- c(
    "immer",          # builds, fails in examples: "there is no package called ‘eRm’"
    "miceadds",       # builds, fails in examples: "there is no package called ‘jomo’"
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

