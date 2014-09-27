#!/usr/bin/Rscript
 
## -- started with Rcpp 0.11.2.6 (current on GitHub as of 2014-Sep-21)
##    as well as current RcppArmadillo and RcppEigen)

#load("~/git/rcpp-logs/results/result-20140922-001031.RData")

#good <- as.character(subset(res, res==0)[,1])
#dput(good)

skippedPkgs <- c() #c("WideLM")		# need NVidia and older g++

goodPkg <- c("accelerometry", "AdaptiveSparsity", "ALKr", "Amelia", "apcluster", 
             "BalancedSampling", "BayesComm", "bayou", "bcp", "bcpa", "bfa", 
             "bfp", "bifactorial", "BIFIEsurvey", "BIPOD", "blockcluster", 
             "btf", "bvarsv", "CARBayesST", "ccaPP", "cda", "CDM", "cgAUC", 
             "CIDnetworks", "cladoRcpp", "classify", "clere", "climdex.pcic", 
             "clogitL1", "clusteval", "ClustVarLV", "CMF", "CompGLM", "ConConPiWiFun", 
             "coneproj", "copCAR", "CorReg", "Crossover", "dbmss", "Delaporte", 
             "dendextendRcpp", "DepthProc", "dils", "disclapmix", "diversitree", 
             "diveRsity", "DNAprofiles", "DNAtools", "dplyr", "dslice", "DStree", 
             "ecp", "eive", "EpiContactTrace", "ESGtoolkit", "EWGoF", "fastGHQuad", 
             "FastHCS", "fastM", "FastPCS", "FastRCS", "FBFsearch", "fdaMixed", 
             "FDRreg", "flip", "FLSSS", "forecast", "fugeR", "Funclustering", 
             "fwsim", "geiger", "GeneticTools", "geoCount", "glcm", "GMCM", 
             "gMWT", "GOsummaries", "GPvam", "gRbase", "gRim", "growcurves", 
             "growfunctions", "GSE", "GUILDS", "GUTS", "GxM", "hawkes", "HDPenReg", 
             "HLMdiag", "hsphase", "httpuv", "hypervolume", "iBATCGH", "IBHM", 
             "icensmis", "inarmix", "IsingSampler", "iterpc", "jaatha", "JAGUAR", 
             "kmc", "Kmisc", "LaF", "lbfgs", "lm.br", "lsgl", "marked", "maxent", 
             "mcIRT", "metafolio", "mets", "mice", "miceadds", "minqa", "mirt", 
             "miscF", "miscset", "mkde", "mmand", "Mposterior", "MPTinR", 
             "MTS", "mvabund", "MVB", "mvnfast", "mwaved", "ndl", "NetSim", 
             "ngspatial", "NPBayesImpute", "oem", "openair", "openxlsx", "orQA", 
             "PBC", "pcalg", "PedCNV", "PerMallows", "phom", "phylobase", 
             "planar", "plotSEMM", "plyr", "polywog", "powerr", "PP", "PReMiuM", 
             "propagate", "prospectr", "protViz", "pryr", "psgp", "QRM", "quadrupen", 
             "qVarSel", "Rankcluster", "rARPACK", "Rclusterpp", "RcppArmadillo", 
             "RcppBDT", "rcppbugs", "RcppClassic", "RcppClassicExamples", 
             "RcppCNPy", "RcppDE", "RcppEigen", "RcppExamples", "RcppGSL", 
             "RcppMLPACK", "RcppOctave", "RcppProgress", "RcppRedis", "RcppRoll", 
             "RcppSMC", "RcppXts", "RcppZiggurat", "recosystem", "remote", 
             "ReorderCluster", "resemble", "reshape2", "revealedPrefs", "rexpokit", 
             "rforensicbatwing", "rgam", "RInside", "ripa", "rkvo", "rlme", 
             "RLRsim", "Rmalschains", "rmgarch", "Rmixmod", "RmixmodCombi", 
             "robustgam", "robustHD", "rococo", "rotations", "roxygen2", "rpg", 
             "rplexos", "rPref", "RProtoBuf", "RQuantLib", "RSNNS", "RSNPset", 
             "RSofia", "Rsomoclu", "Rtsne", "Ruchardet", "rugarch", "Rvcg", 
             "RVowpalWabbit", "SBSA", "scrypt", "sdcMicro", "sdcTable", "SelvarMix", 
             "sequences", "sglOptim", "simFrame", "sirt", "slfm", "snplist", 
             "SocialNetworks", "SOD", "spacodiR", "spaMM", "sparseHessianFD", 
             "sparseLTSEigen", "SpatialEpi", "SpatialTools", "spBayesSurv", 
             "StereoMorph", "stochvol", "stosim", "survAccuracyMeasures", 
             "survSNP", "synlik", "TAM", "TAQMNGR", "TED", "termstrc", "TFMPvalue", 
             "treeclim", "trustOptim", "tvd", "unmarked", "VideoComparison", 
             "VIM", "waffect", "wordcloud", "XBRL", "zic")



#bad <- as.character(subset(res, res==1)[,1])
#dput(bad)
prevbadPkg <- c("CARBayes", "dplyr", "FisHiCal", "glcm", "HDPenReg", "HUM", 
                "icamix", "KernSmoothIRT", "lme4", "Morpho", "msgl", "nabor", 
                "pROC", "rpf", "surveillance", "tbart", "wsrf")

badPkg <- c("CARBayes", "FisHiCal", "HUM", "icamix", "KernSmoothIRT", "lme4", 
            "Morpho", "msgl", "nabor", "pROC", "randomUniformForest", "rpf", 
            "strum", "surveillance", "tbart", "wsrf")

## missing BioC depends -- no longer applicable as we now explicitly set the BioC repo too
#bad4BioCdep <- c()

## Failing at compile time due to Rcpp issues
bad4RcppAPI <- c()

bad4unclear <- c("msgl")		# as CRAN had notified us, msgl fails on stop() in one of its tests
            
bad4notrcpp <- c(
    "CARBayes",       # builds, bombs in examples on "there is no package called ‘shapefiles’"
    "FisHiCal",       # builds, bombs in examples on lack of rgl device
    "HUM",            #	builds, bombs in examples on lack of rgl device
    "icamix",         # builds, bombs in examples:  there is no package called ‘mixtools’ 
    "KernSmoothIRT",  # builds, bombs in examples on lack of rgl device
    "lme4",           # test fails, no object 'Orthodont'
    "Morpho",         # builds, bombs in examples on "there is no package called ‘shapes’"
    "nabor",          # builds, bombs in tests on "there is no package called ‘RANN’"
    "pROC",           # builds, bombs in examples on "there is no package called ‘logcondens’"
    "randomUniformForest",  # bombs build: "Package suggested but not available for checking: ‘R.rsp’"
    "rpf",            # builds, bombs in tests on "there is no package called ‘tlink’"
    "strum",	      # bombs build: "Package required but not available: ‘pedigree'"
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


## Checking: packages as of June 21
##
## R> dput(as.character(res[,1]))
allPkg <- c("accelerometry", "AdaptiveSparsity", "ALKr", "Amelia", "apcluster", 
            "BalancedSampling", "BayesComm", "bayou", "bcp", "bcpa", "bfa", 
            "bfp", "bifactorial", "BIFIEsurvey", "BIPOD", "blockcluster", 
            "btf", "bvarsv", "CARBayes", "CARBayesST", "ccaPP", "cda", "CDM", 
            "cgAUC", "CIDnetworks", "cladoRcpp", "classify", "clere", "climdex.pcic", 
            "clogitL1", "clusteval", "ClustVarLV", "CMF", "CompGLM", "ConConPiWiFun", 
            "coneproj", "copCAR", "CorReg", "Crossover", "dbmss", "Delaporte", 
            "dendextendRcpp", "DepthProc", "dils", "disclapmix", "diversitree", 
            "diveRsity", "DNAprofiles", "DNAtools", "dplyr", "dslice", "DStree", 
            "ecp", "eive", "EpiContactTrace", "ESGtoolkit", "EWGoF", "fastGHQuad", 
            "FastHCS", "fastM", "FastPCS", "FastRCS", "FBFsearch", "fdaMixed", 
            "FDRreg", "FisHiCal", "flip", "FLSSS", "forecast", "fugeR", "Funclustering", 
            "fwsim", "geiger", "GeneticTools", "geoCount", "glcm", "GMCM", 
            "gMWT", "GOsummaries", "GPvam", "gRbase", "gRim", "growcurves", 
            "growfunctions", "GSE", "GUILDS", "GUTS", "GxM", "hawkes", "HDPenReg", 
            "HLMdiag", "hsphase", "httpuv", "HUM", "hypervolume", "iBATCGH", 
            "IBHM", "icamix", "icensmis", "inarmix", "IsingSampler", "iterpc", 
            "jaatha", "JAGUAR", "KernSmoothIRT", "kmc", "Kmisc", "LaF", "lbfgs", 
            "lm.br", "lme4", "lsgl", "marked", "maxent", "mcIRT", "metafolio", 
            "mets", "mice", "miceadds", "minqa", "mirt", "miscF", "miscset", 
            "mkde", "mmand", "Morpho", "Mposterior", "MPTinR", "msgl", "MTS", 
            "mvabund", "MVB", "mvnfast", "mwaved", "nabor", "ndl", "NetSim", 
            "ngspatial", "NPBayesImpute", "oem", "openair", "openxlsx", "orQA", 
            "PBC", "pcalg", "PedCNV", "PerMallows", "phom", "phylobase", 
            "planar", "plotSEMM", "plyr", "polywog", "powerr", "PP", "PReMiuM", 
            "pROC", "propagate", "prospectr", "protViz", "pryr", "psgp", 
            "QRM", "quadrupen", "qVarSel", "randomUniformForest", "Rankcluster", 
            "rARPACK", "Rclusterpp", "RcppArmadillo", "RcppBDT", "rcppbugs", 
            "RcppClassic", "RcppClassicExamples", "RcppCNPy", "RcppDE", "RcppEigen", 
            "RcppExamples", "RcppGSL", "RcppMLPACK", "RcppOctave", "RcppProgress", 
            "RcppRedis", "RcppRoll", "RcppSMC", "RcppXts", "RcppZiggurat", 
            "recosystem", "remote", "ReorderCluster", "resemble", "reshape2", 
            "revealedPrefs", "rexpokit", "rforensicbatwing", "rgam", "RInside", 
            "ripa", "rkvo", "rlme", "RLRsim", "Rmalschains", "rmgarch", "Rmixmod", 
            "RmixmodCombi", "robustgam", "robustHD", "rococo", "rotations", 
            "roxygen2", "rpf", "rpg", "rplexos", "rPref", "RProtoBuf", "RQuantLib", 
            "RSNNS", "RSNPset", "RSofia", "Rsomoclu", "Rtsne", "Ruchardet", 
            "rugarch", "Rvcg", "RVowpalWabbit", "SBSA", "scrypt", "sdcMicro", 
            "sdcTable", "SelvarMix", "sequences", "sglOptim", "simFrame", 
            "sirt", "slfm", "snplist", "SocialNetworks", "SOD", "spacodiR", 
            "spaMM", "sparseHessianFD", "sparseLTSEigen", "SpatialEpi", "SpatialTools", 
            "spBayesSurv", "StereoMorph", "stochvol", "stosim", "strum", 
            "survAccuracyMeasures", "surveillance", "survSNP", "synlik", 
            "TAM", "TAQMNGR", "tbart", "TED", "termstrc", "TFMPvalue", "treeclim", 
            "trustOptim", "tvd", "unmarked", "VideoComparison", "VIM", "waffect", 
            "wordcloud", "wsrf", "XBRL", "zic")

checkPkg <- c(goodPkg, badPkg, skippedPkgs)
stopifnot(length(setdiff(checkPkg, allPkg))==0)
stopifnot(length(setdiff(allPkg, checkPkg))==0)



