#!/usr/bin/Rscript

## start with Rcpp 0.12.0 and RcppArmadillo 0.5.300.1

#load("~/git/rcpp-logs/results/rcpparmadillo/result-20150813-133450.RData")
#goodPkg <- as.character(subset(res, res==0)[,1]); dput(goodPkg)

goodPkg <-c("AdaptiveSparsity", "AHR", "Amelia", "ASPBay", "BaBooN", "BayesComm", 
            "bayesm", "bayou", "bcp", "bfa", "BIFIEsurvey", "BIPOD", "blockmodels", 
            "bvarsv", "ccaPP", "cccp", "cda", "CDM", "cladoRcpp", "coala", 
            "coneproj", "copCAR", "Crossover", "DepthProc", "dfcomb", "dfmta", 
            "emIRT", "EPGLM", "EstHer", "fastM", "FBFsearch", "fdaMixed", 
            "FDRreg", "fICA", "FisHiCal", "flip", "forecast", "FRESA.CAD", 
            "gaselect", "GeneticTools", "geoCount", "GERGM", "glcm", "glmgraph", 
            "GMCM", "gMWT", "GPvam", "graphicalVAR", "gRbase", "gRim", "growcurves", 
            "growfunctions", "GSE", "hawkes", "HLMdiag", "hsphase", "hypervolume", 
            "iBATCGH", "icamix", "iccbeta", "kdecopula", "lpme", "lsgl", 
            "markophylo", "MAT", "matchingMarkets", "matchingR", "mcIRT", 
            "metafolio", "mets", "miscF", "mixedMem", "mmand", "Morpho", 
            "mp", "Mposterior", "MVB", "mvnfast", "ngspatial", "oem", "onlinePCA", 
            "pcalg", "PedCNV", "planar", "PoweR", "PPtreeViz", "prospectr", 
            "psd", "psgp", "quadrupen", "quanteda", "Rborist", "rcppbugs", 
            "RcppDE", "RcppMLPACK", "RealVAMS", "redist", "resemble", "revealedPrefs", 
            "rgam", "rmgarch", "robustgam", "robustHD", "robustreg", "rotations", 
            "Rphylopars", "rstpm2", "rugarch", "sbmSDP", "SBSA", "SelvarMix", 
            "sgd", "sglOptim", "sirt", "slfm", "snipEM", "SparseFactorAnalysis", 
            "sparsereg", "SpatialEpi", "SpatialTools", "SpatPCA", "spBayesSurv", 
            "spduration", "stm", "stochvol", "strum", "survAccuracyMeasures", 
            "SVMMatch", "synlik", "TAM", "TED", "treeclim", "unmarked", "VarSelLCM", 
            "zic",
            ##
            "mirtCAT", # needed newer httpuv than in lib/
            "timma"
            )


#badPkg <- as.character(subset(res, res==1)[,1]); dput(badPkg)
badPkg <- c("markovchain", "mcmcse", "miceadds", "MRIaggr", "msgl")

bad4notrcpp <- c(
    "markovchain",    # builds, 'diagram' missing
    "mcmcse",	      # builds, 'mAr' missing
    "miceadds",       # builds, fails in examples: "there is no package called ‘jomo’"
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

