#!/usr/bin/Rscript

## start with Rcpp 0.12.1.1 and RcppArmadillo 0.6.100.0.0

#load("~/git/rcpp-logs/results/rcpparmadillo/result-20151003-122312.RData")
#goodPkg <- as.character(subset(res, res==0)[,1]); dput(goodPkg)

goodPkg <- c("AdaptiveSparsity", "AHR", "Amelia", "ASPBay", "BayesComm", 
             "bayesm", "bcp", "bfa", "BIFIEsurvey", "BIPOD", "blockmodels", 
             "BTLLasso", "bvarsv", "ccaPP", "cccp", "cda", "CDM", "ChannelAttribution", 
             "cladoRcpp", "coala", "coneproj", "copCAR", "cord", "CoxPlus", 
             "Crossover", "DepthProc", "dfmta", "emIRT", "EPGLM", "EstHer", 
             "FastBandChol", "fastM", "FBFsearch", "fdaMixed", "FDRreg", "FIACH", 
             "fICA", "FisHiCal", "flip", "forecast", "FRESA.CAD", "gaselect", 
             "GeneticTools", "geoCount", "GERGM", "glamlasso", "glcm", "glmgraph", 
             "GMCM", "gMWT", "GPvam", "gRain", "graphicalVAR", "gRbase", "gRim", 
             "growcurves", "growfunctions", "GSE", "hawkes", "HLMdiag", "hsphase", 
             "hypervolume", "iBATCGH", "iccbeta", "iLaplace", "JAGUAR", "kdecopula", 
             "Langevin", "lpme", "lsgl", "markophylo", "MAT", "matchingMarkets", 
             "matchingR", "mcemGLM", "mcIRT", "metafolio", "mev", "mirt", 
             "mirtCAT", "miscF", "mixedMem", "mmand", "mp", "Mposterior", 
             "MVB", "mvnfast", "ngspatial", "oem", "onlinePCA", "PanelCount", 
             "pcalg", "PedCNV", "planar", "polyfreqs", "PoweR", "PPtreeViz", 
             "prospectr", "psd", "psgp", "quadrupen", "quanteda", "Rborist", 
             "rcppbugs", "RcppDE", "RcppMLPACK", "RealVAMS", "redist", "resemble", 
             "rgam", "rmgarch", "robustgam", "robustHD", "robustreg", "rotations", 
             "Rphylopars", "rstpm2", "rugarch", "sbmSDP", "SBSA", "SelvarMix", 
             "sglOptim", "sirt", "slfm", "snipEM", "SparseFactorAnalysis", 
             "sparsereg", "SpatialEpi", "SpatialTools", "SpatPCA", "spBayesSurv", 
             "spduration", "stm", "stochvol", "strum", "survAccuracyMeasures", 
             "SVMMatch", "synlik", "TAM", "TED", "treeclim", "unmarked", "VarSelLCM", 
             "zic",
             ##
             "timma"   ## spurious xvfb issue
             )


#badPkg <- as.character(subset(res, res==1)[,1]); dput(badPkg)
badPkg <- c("BaBooN", "bayou", "dfcomb", "icamix", "immer", "markovchain", 
            "mcmcse", "mets", "miceadds", "Morpho", "MRIaggr", "msgl", "revealedPrefs", 
            "sgd") #, "timma")

bad4notrcpp <- c(
    "BaBooN",         # builds, fails in examples: "there is no package called ‘norm’"
    "dfcomb",         # in plateau.cpp has '#define ARMA_DONT_USE_LAPACK' which we need
    "icamix",         # builds, bombs in examples on "there is no package called ‘mixtools’"
    "immer",          # builds, fails in examples: "there is no package called ‘eRm’"
    "markovchain",    # builds, fails in examples: "there is no package called 'diagram'"
    "mcmcse",         # builds, fails in examples: "there is no package called 'mAr'"
    "mets",           # builds, fails in tests: "there is no package called 'prodlim'"
    "miceadds",       # builds, fails in examples: "there is no package called ‘jomo’"
    "Morpho",         # builds, fails in examples: "there is no package called ‘shapes’"
    "MRIaggr",        # builds, fails in examples: "requires to have installed the oro.nifti package to work "
    "msgl",	      # as CRAN had notified us, msgl fails on stop() in one of its tests
    "revealedPrefs",  # builds, fails in examples: "there is no package called ‘pso’"
    "sgd")	      # VignetteBuilder package required for checking but not installed: ‘R.rsp’

bad4unclear <- c(
    "bayou"           # possibly phytools etc related ?
)

good <- length(goodPkg)
badrcpp <- 0
badother <- length(bad4notrcpp) + length(bad4unclear) 
bad <- badrcpp + badother
skipped <- 1


cat("Good         ", good, "\n")
cat("  AsIs       ", length(goodPkg), "\n")
cat("Bad          ", bad, "\n")
cat("  NotRcpp    ", length(bad4notrcpp), "\n")
cat("  Unclear    ", length(bad4unclear), "\n")
cat("Skipped      ", skipped, "\n")
cat("Total        ", good + bad + skipped, "\n")
cat("Bad Percent  ", badrcpp / (good + bad), "\n")

