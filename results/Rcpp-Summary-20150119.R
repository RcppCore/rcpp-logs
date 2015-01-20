#!/usr/bin/Rscript
 
## -- started with Rcpp 0.11.3.3 (current on GitHub as of 2014-11-30 -- and including speculative branch)
##    as well as current RcppArmadillo and RcppEigen)

#load("~/git/rcpp-logs/results/result-20150120-024124.RData")
#good <- as.character(subset(res, res==0)[,1])
#dput(good)

goodPkg <- c("accelerometry", "AdaptiveSparsity", "algstat", "ALKr", "Amelia", 
             "apcluster", "ASPBay", "BalancedSampling", "BayesComm", "BayesFactor", 
             "bayou", "bcp", "bcpa", "bfa", "bfp", "bifactorial", "BIFIEsurvey", 
             "BIPOD", "blockcluster", "btf", "bvarsv", "CARBayes", "CARBayesST", 
             "ccaPP", "cda", "CDM", "cgAUC", "CIDnetworks", "cladoRcpp", "classify", 
             "clere", "clogitL1", "clusteval", "ClustVarLV", "CMF", "CompGLM", 
             "ConConPiWiFun", "coneproj", "copCAR", "CorReg", "Crossover", 
             "dbmss", "ddalpha", "Delaporte", "dendextendRcpp", "DepthProc", 
             "DetMCD", "dfcomb", "dfmta", "dils", "disclapmix", "diversitree", 
             "diveRsity", "DNAprofiles", "DNAtools", "dplyr", "dslice", "DStree", 
             "ecp", "eive", "EpiContactTrace", "ESGtoolkit", "EWGoF", "fastGHQuad", 
             "FastHCS", "fastM", "FastPCS", "FastRCS", "FBFsearch", "fdaMixed", 
             "FDGcopulas", "FDRreg", "FeatureHashing", "fICA", "flip", "FLSSS", 
             "forecast", "fugeR", "Funclustering", "fwsim", "GCPM", "geiger", 
             "GeneticTools", "GENLIB", "geoCount", "glcm", "GMCM", "gMWT", 
             "GPareto", "GPvam", "gRbase", "gRim", "growcurves", "growfunctions", 
             "GSE", "GUILDS", "GUTS", "GxM", "hawkes", "HDPenReg", "HLMdiag", 
             "hsphase", "httpuv", "hypervolume", "iBATCGH", "IBHM", "icamix", 
             "iccbeta", "icensmis", "inarmix", "IsingSampler", "ISOpureR", 
             "iterpc", "jaatha", "JAGUAR", "jiebaR", "kmc", "Kmisc", "LaF", 
             "lbfgs", "lfl", "lm.br", "lpme", "lsgl", "marked", "MAT", "matchingMarkets", 
             "maxent", "mcIRT", "metafolio", "mets", "mice", "miceadds", "minqa", 
             "mirt", "miscF", "miscset", "mkde", "mlxR", "mmand", "Morpho", 
             "mp", "Mposterior", "MPTinR", "MTS", "mvabund", "MVB", "mvnfast", 
             "mwaved", "myTAI", "nabor", "NAM", "ndl", "NetSim", "ngspatial", 
             "NHMM", "NPBayesImpute", "oem", "onlinePCA", "openair", "openxlsx", 
             "orQA", "pander", "PBC", "pcalg", "PedCNV", "pedometrics", "penMSM", 
             "PerMallows", "phom", "phylobase", "planar", "plotSEMM", "plyr", 
             "polywog", "PoweR", "powerr", "PP", "PReMiuM", "pROC", "propagate", 
             "prospectr", "protViz", "pryr", "psgp", "pvar", "QRM", "quadrupen", 
             "quantspec", "qVarSel", "randomUniformForest", "Rankcluster", 
             "rARPACK", "Rclusterpp", "RcppAnnoy", "RcppArmadillo", "RcppBDT", 
             "rcppbugs", "RcppClassic", "RcppClassicExamples", "RcppCNPy", 
             "RcppDE", "RcppDL", "RcppEigen", "RcppExamples", "RcppGSL", "RcppMLPACK", 
             "RcppOctave", "RcppProgress", "RcppRedis", "RcppRoll", "RcppSMC", 
             "RcppXts", "RcppZiggurat", "RealVAMS", "reconstructr", "recosystem", 
             "remote", "ReorderCluster", "repra", "resemble", "reshape2", 
             "revealedPrefs", "rexpokit", "rforensicbatwing", "rgam", "RInside", 
             "ripa", "rkvo", "rlme", "RLRsim", "Rmalschains", "rmgarch", "Rmixmod", 
             "RmixmodCombi", "rncl", "robustgam", "robustHD", "robustreg", 
             "rococo", "rotations", "roxygen2", "rpf", "rpg", "rplexos", "rPref", 
             "RProtoBuf", "RQuantLib", "RSNNS", "RSNPset", "RSofia", "Rsomoclu", 
             "rtkpp", "Rtsne", "Ruchardet", "rugarch", "Rvcg", "RVowpalWabbit", 
             "SBSA", "scrm", "scrypt", "sdcMicro", "sdcTable", "segmag", "SelvarMix", 
             "sequences", "sglOptim", "simFrame", "simPop", "sirt", "slfm", 
             "snipEM", "snplist", "SocialNetworks", "SOD", "spacodiR", "spaMM", 
             "sparseHessianFD", "sparseLTSEigen", "SpatialEpi", "SpatialTools", 
             "spBayesSurv", "StereoMorph", "StMoSim", "stochvol", "stosim", 
             "survAccuracyMeasures", "surveillance", "survSNP", "synlik", 
             "tagcloud", "TAM", "tbart", "tcR", "TED", "termstrc", "TFMPvalue", 
             "timma", "treeclim", "trustOptim", "tvd", "unmarked", "urltools", 
             "V8", "VideoComparison", "VIM", "waffect", "wordcloud", "wsrf", 
             "XBRL", "zic")


#bad <- as.character(subset(res, res==1)[,1])
#dput(bad)

prevprevvbadPkg <- c("bcpa", "CARBayes", "climdex.pcic", "cqrReg", "dplyr", "FisHiCal", 
                     "gRbase", "HUM", "icamix", "jaatha", "KernSmoothIRT", "lme4", 
                     "lpme", "mirt", "Morpho", "msgl", "nabor", "pROC", "randomUniformForest", 
                     "RcppCNPy", "repra", "revealedPrefs", "rplexos", "rPref", "sirt", 
                     "spBayesSurv", "strum", "TAM", "tbart", "wsrf")

previewbadPkg <- c("climdex.pcic", "cqrReg", "dplyr", "FisHiCal", "HUM", "KernSmoothIRT", 
                   "lme4", "lpme", "msgl", "randomUniformForest", "rARPACK", "RcppCNPy", 
                   "spBayesSurv", "strum", "tbart", "textreg", "wsrf")

badPkg <- c("climdex.pcic", "FisHiCal", "HUM", "KernSmoothIRT", "lme4", 
            "msgl", "strataG", "strum", "textreg")

skippedPkgs <- c("cqrReg", # package required by not avilable: ‘Rmosek’ (which needs Mosek)
                 "wideLM") # needs working cuda

goodAfterPatch <- c(   
    "climdex.pcic",    # -- already patched upstream, release pending
    "strum")           # needs const_cast patch

badNotRcpp <- c(
    "textreg")         # bombs on assert() --> package logic

badnotrcpp <- c(
    "FisHiCal",       # builds, bombs in examples on lack of rgl device
    "HUM",            # builds, bombs in examples on lack of rgl device
    "KernSmoothIRT",  # builds, bombs in examples on lack of rgl device
    "lme4",           # test fails, no object 'Orthodont'
    "msgl",	      # test tolerance too low; msgl fails on stop() in one of its tests
    "strataG",        # builds, bombs in loadNamespace:  there is no package called ‘pegas’
    "textreg")        # builds, bombs in examples:  there is no package called ‘GISTools’

   
## missing BioC depends -- no longer applicable as we now explicitly set the BioC repo too
#bad4BioCdep <- c()

## ## Failing at compile time due to Rcpp issues
## bad4RcppAPI <- c()

##bad4unclear <- c("msgl")		# as CRAN had notified us, msgl fails on stop() in one of its tests
            

good <- length(goodPkg) + length(goodAfterPatch)
#badrcpp <- length(bad4RcppAPI) + length(bad4unclear) + length
#badother <- length(bad4notrcpp) 
#bad <- badrcpp + badother
bad <- length(badPkg)
skipped <- length(skippedPkgs)

bad4notrcpp <- length(badnotrcpp)
badremain <- bad - bad4notrcpp

cat("Good         ", good, "\n")
cat("  AsIs       ", length(goodPkg), "\n")
#cat("  w/Other    ", length(goodWithOtherChange), "\n")
#cat("  w/Question ", length(goodWithQuestion), "\n")
cat("  w/Patches  ", length(goodAfterPatch), "\n")
cat("Bad          ", bad, "\n")
#cat("  RcppApi    ", length(bad4RcppAPI), "\n")
#cat("  Unclear    ", length(bad4unclear), "\n")
#cat("  Other      ", badother, "\n")
#cat("  BioCDep    ", length(bad4BioCdep), "\n")
cat("  NotRcpp    ", bad4notrcpp, "\n")
cat("Skipped      ", skipped, "\n")
cat("Total        ", good + bad - length(goodAfterPatch) + skipped, "\n")
cat("Bad Percent  ", badremain / (good + bad), "\n")


## Checking: packages as of June 21
##
## R>
#dput(as.character(res[,1]))
allPkg <- c("accelerometry", "AdaptiveSparsity", "algstat", "ALKr", "Amelia", 
            "apcluster", "ASPBay", "BalancedSampling", "BayesComm", "BayesFactor", 
            "bayou", "bcp", "bcpa", "bfa", "bfp", "bifactorial", "BIFIEsurvey", 
            "BIPOD", "blockcluster", "btf", "bvarsv", "CARBayes", "CARBayesST", 
            "ccaPP", "cda", "CDM", "cgAUC", "CIDnetworks", "cladoRcpp", "classify", 
            "clere", "climdex.pcic", "clogitL1", "clusteval", "ClustVarLV", 
            "CMF", "CompGLM", "ConConPiWiFun", "coneproj", "copCAR", "CorReg", 
            "Crossover", "dbmss", "ddalpha", "Delaporte", "dendextendRcpp", 
            "DepthProc", "DetMCD", "dfcomb", "dfmta", "dils", "disclapmix", 
            "diversitree", "diveRsity", "DNAprofiles", "DNAtools", "dplyr", 
            "dslice", "DStree", "ecp", "eive", "EpiContactTrace", "ESGtoolkit", 
            "EWGoF", "fastGHQuad", "FastHCS", "fastM", "FastPCS", "FastRCS", 
            "FBFsearch", "fdaMixed", "FDGcopulas", "FDRreg", "FeatureHashing", 
            "fICA", "FisHiCal", "flip", "FLSSS", "forecast", "fugeR", "Funclustering", 
            "fwsim", "GCPM", "geiger", "GeneticTools", "GENLIB", "geoCount", 
            "glcm", "GMCM", "gMWT", "GPareto", "GPvam", "gRbase", "gRim", 
            "growcurves", "growfunctions", "GSE", "GUILDS", "GUTS", "GxM", 
            "hawkes", "HDPenReg", "HLMdiag", "hsphase", "httpuv", "HUM", 
            "hypervolume", "iBATCGH", "IBHM", "icamix", "iccbeta", "icensmis", 
            "inarmix", "IsingSampler", "ISOpureR", "iterpc", "jaatha", "JAGUAR", 
            "jiebaR", "KernSmoothIRT", "kmc", "Kmisc", "LaF", "lbfgs", "lfl", 
            "lm.br", "lme4", "lpme", "lsgl", "marked", "MAT", "matchingMarkets", 
            "maxent", "mcIRT", "metafolio", "mets", "mice", "miceadds", "minqa", 
            "mirt", "miscF", "miscset", "mkde", "mlxR", "mmand", "Morpho", 
            "mp", "Mposterior", "MPTinR", "msgl", "MTS", "mvabund", "MVB", 
            "mvnfast", "mwaved", "myTAI", "nabor", "NAM", "ndl", "NetSim", 
            "ngspatial", "NHMM", "NPBayesImpute", "oem", "onlinePCA", "openair", 
            "openxlsx", "orQA", "pander", "PBC", "pcalg", "PedCNV", "pedometrics", 
            "penMSM", "PerMallows", "phom", "phylobase", "planar", "plotSEMM", 
            "plyr", "polywog", "PoweR", "powerr", "PP", "PReMiuM", "pROC", 
            "propagate", "prospectr", "protViz", "pryr", "psgp", "pvar", 
            "QRM", "quadrupen", "quantspec", "qVarSel", "randomUniformForest", 
            "Rankcluster", "rARPACK", "Rclusterpp", "RcppAnnoy", "RcppArmadillo", 
            "RcppBDT", "rcppbugs", "RcppClassic", "RcppClassicExamples", 
            "RcppCNPy", "RcppDE", "RcppDL", "RcppEigen", "RcppExamples", 
            "RcppGSL", "RcppMLPACK", "RcppOctave", "RcppProgress", "RcppRedis", 
            "RcppRoll", "RcppSMC", "RcppXts", "RcppZiggurat", "RealVAMS", 
            "reconstructr", "recosystem", "remote", "ReorderCluster", "repra", 
            "resemble", "reshape2", "revealedPrefs", "rexpokit", "rforensicbatwing", 
            "rgam", "RInside", "ripa", "rkvo", "rlme", "RLRsim", "Rmalschains", 
            "rmgarch", "Rmixmod", "RmixmodCombi", "rncl", "robustgam", "robustHD", 
            "robustreg", "rococo", "rotations", "roxygen2", "rpf", "rpg", 
            "rplexos", "rPref", "RProtoBuf", "RQuantLib", "RSNNS", "RSNPset", 
            "RSofia", "Rsomoclu", "rtkpp", "Rtsne", "Ruchardet", "rugarch", 
            "Rvcg", "RVowpalWabbit", "SBSA", "scrm", "scrypt", "sdcMicro", 
            "sdcTable", "segmag", "SelvarMix", "sequences", "sglOptim", "simFrame", 
            "simPop", "sirt", "slfm", "snipEM", "snplist", "SocialNetworks", 
            "SOD", "spacodiR", "spaMM", "sparseHessianFD", "sparseLTSEigen", 
            "SpatialEpi", "SpatialTools", "spBayesSurv", "StereoMorph", "StMoSim", 
            "stochvol", "stosim", "strataG", "strum", "survAccuracyMeasures", 
            "surveillance", "survSNP", "synlik", "tagcloud", "TAM", "tbart", 
            "tcR", "TED", "termstrc", "textreg", "TFMPvalue", "timma", "treeclim", 
            "trustOptim", "tvd", "unmarked", "urltools", "V8", "VideoComparison", 
            "VIM", "waffect", "wordcloud", "wsrf", "XBRL", "zic")

checkPkg <- c(goodPkg, badPkg)
stopifnot(length(setdiff(checkPkg, allPkg))==0)
stopifnot(length(setdiff(allPkg, checkPkg))==0)



