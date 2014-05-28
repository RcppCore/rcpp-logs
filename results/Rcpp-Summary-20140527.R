 
## -- started with Rcpp 0.11.1.2 (current on GitHub as of 2014-May-25)
##    as well as current RcppArmadillo and RcppEigen)

#load("~/git/rcpp-logs/results/result-20140525-170012.RData")

#good <- as.character(subset(res, res==0)[,1])
#dput(good)

skippedPkgs <- c("quadrupen",           # takes hours
                 "WideLM")		# need NVidia and older g++

goodPkg <- c("accelerometry", "acer", "AdaptiveSparsity", "algstat", "ALKr", 
             "Amelia", "apcluster", "BalancedSampling", "BayesComm", "bcp", 
             "bcpa", "bfa", "bfp", "bifactorial", "bilan", "BIPOD", "blockcluster", 
             "ccaPP", "cda", "CDS", "CIDnetworks", "cladoRcpp", "classify", 
             "clere", "climdex.pcic", "clogitL1", "clusteval", "ClustVarLV", 
             "CMF", "ConConPiWiFun", "coneproj", "CorReg", "dbmss", "Delaporte", 
             "dendextendRcpp", "dils", "disclapmix", "diversitree", "EpiContactTrace", 
             "EWGoF", "fastGHQuad", "FastHCS", "fastM", "FastPCS", "FastRCS", 
             "FBFsearch", "fdaMixed", "FDRreg", "flip", "forecast", "fugeR", 
             "Funclustering", "fwsim", "geiger", "GeneticTools", "geoCount", 
             "glcm", "GMCM", "gMWT", "GOsummaries", "GPvam", "gRbase", "gRim", 
             "growcurves", "GSE", "GUTS", "GxM", "hawkes", "HLMdiag", "hsphase", 
             "httpuv", "hypervolume", "IBHM", "inarmix", "IsingSampler", "iterpc", 
             "jaatha", "kmc", "Kmisc", "LaF", "lm.br", "lme4", "lsgl", "marked", 
             "maxent", "mcIRT", "mets", "mice", "minqa", "mirt", "miscF", 
             "miscset", "MPTinR", "MTS", "mvabund", "MVB", "ndl", "NetSim", 
             "ngspatial", "oem", "OmicKriging", "openair", "openxlsx", "orQA", 
             "PBC", "pcalg", "PedCNV", "phom", "phylobase", "planar", "plyr", 
             "polywog", "PReMiuM", "propagate", "prospectr", "protViz", "psgp", 
             "QRM", "Rankcluster", "rARPACK", "Rclusterpp", "RcppArmadillo", 
             "RcppBDT", "rcppbugs", "RcppClassic", "RcppClassicExamples", 
             "RcppCNPy", "RcppDE", "RcppEigen", "RcppExamples", "RcppGSL", 
             "RcppOctave", "RcppProgress", "RcppRedis", "RcppRoll", "RcppSMC", 
             "RcppXts", "RcppZiggurat", "resemble", "reshape2", "rexpokit", 
             "rforensicbatwing", "rgam", "RInside", "ripa", "Rmalschains", 
             "RMessenger", "rmgarch", "Rmixmod", "robustgam", "robustHD", 
             "rococo", "rotations", "roxygen2", "RProtoBuf", "RQuantLib", 
             "RSNNS", "RSofia", "Rsomoclu", "Ruchardet", "rugarch", "Rvcg", 
             "RVowpalWabbit", "SBSA", "scrypt", "sdcMicro", "sdcTable", "sequences", 
             "sglOptim", "simFrame", "slfm", "snplist", "SocialNetworks", 
             "spacodiR", "sparseHessianFD", "sparseLTSEigen", "SpatialTools", 
             "stochvol", "stosim", "strum", "survSNP", "synlik", "TAM", "TAQMNGR", 
             "TED", "termstrc", "TFMPvalue", "trustOptim", "unmarked", "VideoComparison", 
             "VIM", "waffect", "wordcloud", "XBRL", "zic")


## bad <- as.character(subset(res, res==1)[,1])
## dput(bad)
badPkg <- c("CARBayes", "CDM", "diveRsity", "DNAprofiles", "dplyr", "FisHiCal", 
            "HUM", "KernSmoothIRT", "miceadds", "Morpho", "msgl", "pROC", 
            "Reot", "rlme", "sirt", "surveillance", "tbart", "wsrf")

## missing BioC depends -- no longer applicable as we now explicitly set the BioC repo too
#bad4BioCdep <- c()

## Failing at compile time due to Rcpp issues
bad4RcppAPI <- c()

bad4unclear <- c("msgl",		# as CRAN had notified us, msgl fails on stop() in one of its tests
                 "rlme")		# numerical issue in test
            
bad4notrcpp <- c(
    "CARBayes",       # builds, bombs in examples on "Error in library(shapes) : there is no package called ‘shapefiles’"
    "CDM",	      # builds, bombs in examples on "Error in library(sirt) : there is no package called ‘sirt’"
    "diveRsity",      # Package required but not available: ‘qgraph’
    "DNAprofiles",    # builds, bombs in examples on "there is no package called ‘DNAtools’"
    "dplyr",          # builds, bombs in examples on "there is no package called 'RSQLite.extfuns'"
    "FisHiCal",       # builds, bombs in examples on lack of rgl device
    "HUM",            #	builds, bombs in examples on lack of rgl device
    "KernSmoothIRT",  # builds, bombs in examples on lack of rgl device
    "miceadds",       #	Package required but not available: ‘sirt’
    "Morpho",         # builds, bombs in examples on "Error in library(shapes) : there is no package called ‘shapes’"
    "pROC",           # builds, bombs in examples on "there is no package called ‘logcondens’"
    "Reot",           # builds, bombs in examples on "Error in library(gridExtra) : there is no package called ‘gridExtra’"
    "sirt",           # Package required but not available: ‘qgraph’
    "surveillance",   # builds, bombs in examples:  ‘there is no package called ‘spc’’
    "tbart",          # builds, bombs in examples:  there is no package called ‘GISTools’
    "wsrf")           # builds, bombs in examples:  there is no package called ‘rattle’ 
    

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


## Checking: packages as of May 27
allPkg <- c("accelerometry", "acer", "AdaptiveSparsity", "algstat", "ALKr", 
            "Amelia", "apcluster", "BalancedSampling", "BayesComm", "bcp", 
            "bcpa", "bfa", "bfp", "bifactorial", "bilan", "BIPOD", "blockcluster", 
            "CARBayes", "ccaPP", "cda", "CDM", "CDS", "CIDnetworks", "cladoRcpp", 
            "classify", "clere", "climdex.pcic", "clogitL1", "clusteval", 
            "ClustVarLV", "CMF", "ConConPiWiFun", "coneproj", "CorReg", "dbmss", 
            "Delaporte", "dendextendRcpp", "dils", "disclapmix", "diversitree", 
            "diveRsity", "DNAprofiles", "dplyr", "EpiContactTrace", "EWGoF", 
            "fastGHQuad", "FastHCS", "fastM", "FastPCS", "FastRCS", "FBFsearch", 
            "fdaMixed", "FDRreg", "FisHiCal", "flip", "forecast", "fugeR", 
            "Funclustering", "fwsim", "geiger", "GeneticTools", "geoCount", 
            "glcm", "GMCM", "gMWT", "GOsummaries", "GPvam", "gRbase", "gRim", 
            "growcurves", "GSE", "GUTS", "GxM", "hawkes", "HLMdiag", "hsphase", 
            "httpuv", "HUM", "hypervolume", "IBHM", "inarmix", "IsingSampler", 
            "iterpc", "jaatha", "KernSmoothIRT", "kmc", "Kmisc", "LaF", "lm.br", 
            "lme4", "lsgl", "marked", "maxent", "mcIRT", "mets", "mice", 
            "miceadds", "minqa", "mirt", "miscF", "miscset", "Morpho", "MPTinR", 
            "msgl", "MTS", "mvabund", "MVB", "ndl", "NetSim", "ngspatial", 
            "oem", "OmicKriging", "openair", "openxlsx", "orQA", "PBC", "pcalg", 
            "PedCNV", "phom", "phylobase", "planar", "plyr", "polywog", "PReMiuM", 
            "pROC", "propagate", "prospectr", "protViz", "psgp", "QRM", "quadrupen", 
            "Rankcluster", "rARPACK", "Rclusterpp", "RcppArmadillo", "RcppBDT", 
            "rcppbugs", "RcppClassic", "RcppClassicExamples", "RcppCNPy", 
            "RcppDE", "RcppEigen", "RcppExamples", "RcppGSL", "RcppOctave", 
            "RcppProgress", "RcppRedis", "RcppRoll", "RcppSMC", "RcppXts", 
            "RcppZiggurat", "Reot", "resemble", "reshape2", "rexpokit", "rforensicbatwing", 
            "rgam", "RInside", "ripa", "rlme", "Rmalschains", "RMessenger", 
            "rmgarch", "Rmixmod", "robustgam", "robustHD", "rococo", "rotations", 
            "roxygen2", "RProtoBuf", "RQuantLib", "RSNNS", "RSofia", "Rsomoclu", 
            "Ruchardet", "rugarch", "Rvcg", "RVowpalWabbit", "SBSA", "scrypt", 
            "sdcMicro", "sdcTable", "sequences", "sglOptim", "simFrame", 
            "sirt", "slfm", "snplist", "SocialNetworks", "spacodiR", "sparseHessianFD", 
            "sparseLTSEigen", "SpatialTools", "stochvol", "stosim", "strum", 
            "surveillance", "survSNP", "synlik", "TAM", "TAQMNGR", "tbart", 
            "TED", "termstrc", "TFMPvalue", "trustOptim", "unmarked", "VideoComparison", 
            "VIM", "waffect", "WideLM", "wordcloud", "wsrf", "XBRL", "zic")

checkPkg <- c(goodPkg, badPkg, skippedPkgs)
stopifnot(length(setdiff(checkPkg, allPkg))==0)
stopifnot(length(setdiff(allPkg, checkPkg))==0)



