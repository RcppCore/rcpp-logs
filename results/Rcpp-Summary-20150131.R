#!/usr/bin/Rscript
 
## -- started with Rcpp 0.11.4.1 (current on GitHub as of 2015-01-31 -- and JJ's new branch

#load("~/git/rcpp-logs/results/result-20150131-143334.RData")
#goodPkgs <- as.character(subset(res, res==0)[,1])
#dput(goodPkgs)

goodPkgs <- c("accelerometry", "AdaptiveSparsity", "algstat", "ALKr", "Amelia", 
              "apcluster", "ASPBay", "BalancedSampling", "BayesComm", "BayesFactor", 
              "bayou", "bcp", "bcpa", "bfa", "bfp", "bifactorial", "BIFIEsurvey", 
              "BIPOD", "blockcluster", "btf", "bvarsv", "CARBayes", "CARBayesST", 
              "ccaPP", "cda", "CDM", "cgAUC", "CIDnetworks", "cladoRcpp", "classify", 
              "clere", "climdex.pcic", "clogitL1", "clusteval", "ClustVarLV", 
              "CMF", "CompGLM", "ConConPiWiFun", "coneproj", "copCAR", "CorReg", 
              "Crossover", "dbmss", "ddalpha", "Delaporte", "dendextendRcpp", 
              "DepthProc", "DetMCD", "dfcomb", "dfmta", "dils", "disclapmix", 
              "diversitree", "diveRsity", "divo", "DNAprofiles", "DNAtools", 
              "dslice", "DStree", "ecp", "eive", "EpiContactTrace", "ESGtoolkit", 
              "EWGoF", "fastGHQuad", "FastHCS", "fastM", "FastPCS", "FastRCS", 
              "FBFsearch", "fdaMixed", "FDGcopulas", "FDRreg", "FeatureHashing", 
              "fICA", "flip", "FLSSS", "forecast", "fugeR", "Funclustering", 
              "fwsim", "GCPM", "geiger", "GeneticTools", "GENLIB", "geoCount", 
              "glcm", "GMCM", "gMWT", "GPareto", "GPvam", "gRbase", "gRim", 
              "growcurves", "growfunctions", "GSE", "GUILDS", "GUTS", "GxM", 
              "hawkes", "HDPenReg", "HLMdiag", "hsphase", "httpuv", "hypervolume", 
              "iBATCGH", "IBHM", "icamix", "iccbeta", "icd9", "icensmis", "inarmix", 
              "IsingSampler", "ISOpureR", "iterpc", "jaatha", "JAGUAR", "jiebaR", 
              "kmc", "Kmisc", "LaF", "lbfgs", "lfl", "lm.br", "lpme", "lsgl", 
              "marked", "MAT", "matchingMarkets", "maxent", "mcIRT", "metafolio", 
              "mets", "mice", "miceadds", "minqa", "mirt", "mirtCAT", "miscF", 
              "miscset", "mkde", "mlxR", "mmand", "Morpho", "mp", "Mposterior", 
              "MPTinR", "MTS", "mvabund", "MVB", "mvnfast", "mwaved", "myTAI", 
              "nabor", "NAM", "ndl", "NetSim", "ngspatial", "NHMM", "NPBayesImpute", 
              "oem", "onlinePCA", "openair", "openxlsx", "orQA", "pander", 
              "partialAR", "PBC", "pcalg", "PedCNV", "pedometrics", "penMSM", 
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
              "SBSA", "scrypt", "sdcMicro", "sdcTable", "segmag", "SelvarMix", 
              "sequences", "sglOptim", "simFrame", "simPop", "sirt", "slfm", 
              "snipEM", "snplist", "SocialNetworks", "SOD", "spacodiR", "spaMM", 
              "sparseHessianFD", "sparseLTSEigen", "SpatialEpi", "SpatialTools", 
              "SpatPCA", "spBayesSurv", "StereoMorph", "StMoSim", "StochKit2R", 
              "stochvol", "stosim", "strataG", "survAccuracyMeasures", "surveillance", 
              "survSNP", "synlik", "tagcloud", "TAM", "tbart", "tcR", "TED", 
              "termstrc", "textreg", "TFMPvalue", "timma", "treeclim", "trustOptim", 
              "tvd", "unmarked", "urltools", "V8", "VideoComparison", "VIM", 
              "waffect", "wordcloud", "wsrf", "XBRL", "zic")


#bad <- as.character(subset(res, res==1)[,1])
#dput(bad)

prevprevbadPkg <- c("climdex.pcic", "cqrReg", "dplyr", "FisHiCal", "HUM", "KernSmoothIRT", 
                    "lme4", "lpme", "msgl", "randomUniformForest", "rARPACK", "RcppCNPy", 
                    "spBayesSurv", "strum", "tbart", "textreg", "wsrf")

prevbadPkg <- c("climdex.pcic", "FisHiCal", "HUM", "KernSmoothIRT", "lme4", 
                "msgl", "strataG", "strum", "textreg")

badPkg <- c("dplyr", "FisHiCal", "HUM", "KernSmoothIRT", "lme4", "msgl", "scrm", "strum")

skippedPkgs <- c("cqrReg", # package required by not avilable: ‘Rmosek’ (which needs Mosek)
                 "wideLM") # needs working cuda

goodAfterPatch <- c(   
    "strum")           # needs const_cast patch; maintainer knows and will upload

badNotRcpp <- c()

badnotrcpp <- c(
    "FisHiCal",       # builds, bombs in examples on lack of rgl device
    "HUM",            # builds, bombs in examples on lack of rgl device
    "KernSmoothIRT",  # builds, bombs in examples on lack of rgl device
    "lme4",           # test fails, no object 'Orthodont'
    "msgl")	      # test tolerance too low; msgl fails on stop() in one of its tests
   
## missing BioC depends -- no longer applicable as we now explicitly set the BioC repo too
#bad4BioCdep <- c()

## ## Failing at compile time due to Rcpp issues
## bad4RcppAPI <- c()

bad4unclear <- c(
    "dplyr",          # something in its regression tests, unclear
    "scrm")	      #something in its regression tests, unclear
            

good <- length(goodPkgs) + length(goodAfterPatch)
#badrcpp <- length(bad4RcppAPI) + length(bad4unclear) + length
#badother <- length(bad4notrcpp) 
#bad <- badrcpp + badother
bad <- length(badPkg) - length(goodAfterPatch)
skipped <- length(skippedPkgs)

bad4notrcpp <- length(badnotrcpp) 
badremain <- bad - bad4notrcpp 

cat("Good         ", good, "\n")
cat("  AsIs       ", length(goodPkgs), "\n")
#cat("  w/Other    ", length(goodWithOtherChange), "\n")
#cat("  w/Question ", length(goodWithQuestion), "\n")
cat("  w/Patches  ", length(goodAfterPatch), "\n")
cat("Bad          ", bad, "\n")
#cat("  RcppApi    ", length(bad4RcppAPI), "\n")
cat("  Unclear    ", length(bad4unclear), "\n")
#cat("  Other      ", badother, "\n")
#cat("  BioCDep    ", length(bad4BioCdep), "\n")
cat("  NotRcpp    ", bad4notrcpp, "\n")
cat("Skipped      ", skipped, "\n")
cat("Total        ", good + bad + skipped, "\n")
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
            "diversitree", "diveRsity", "divo", "DNAprofiles", "DNAtools", 
            "dplyr", "dslice", "DStree", "ecp", "eive", "EpiContactTrace", 
            "ESGtoolkit", "EWGoF", "fastGHQuad", "FastHCS", "fastM", "FastPCS", 
            "FastRCS", "FBFsearch", "fdaMixed", "FDGcopulas", "FDRreg", "FeatureHashing", 
            "fICA", "FisHiCal", "flip", "FLSSS", "forecast", "fugeR", "Funclustering", 
            "fwsim", "GCPM", "geiger", "GeneticTools", "GENLIB", "geoCount", 
            "glcm", "GMCM", "gMWT", "GPareto", "GPvam", "gRbase", "gRim", 
            "growcurves", "growfunctions", "GSE", "GUILDS", "GUTS", "GxM", 
            "hawkes", "HDPenReg", "HLMdiag", "hsphase", "httpuv", "HUM", 
            "hypervolume", "iBATCGH", "IBHM", "icamix", "iccbeta", "icd9", 
            "icensmis", "inarmix", "IsingSampler", "ISOpureR", "iterpc", 
            "jaatha", "JAGUAR", "jiebaR", "KernSmoothIRT", "kmc", "Kmisc", 
            "LaF", "lbfgs", "lfl", "lm.br", "lme4", "lpme", "lsgl", "marked", 
            "MAT", "matchingMarkets", "maxent", "mcIRT", "metafolio", "mets", 
            "mice", "miceadds", "minqa", "mirt", "mirtCAT", "miscF", "miscset", 
            "mkde", "mlxR", "mmand", "Morpho", "mp", "Mposterior", "MPTinR", 
            "msgl", "MTS", "mvabund", "MVB", "mvnfast", "mwaved", "myTAI", 
            "nabor", "NAM", "ndl", "NetSim", "ngspatial", "NHMM", "NPBayesImpute", 
            "oem", "onlinePCA", "openair", "openxlsx", "orQA", "pander", 
            "partialAR", "PBC", "pcalg", "PedCNV", "pedometrics", "penMSM", 
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
            "SpatPCA", "spBayesSurv", "StereoMorph", "StMoSim", "StochKit2R", 
            "stochvol", "stosim", "strataG", "strum", "survAccuracyMeasures", 
            "surveillance", "survSNP", "synlik", "tagcloud", "TAM", "tbart", 
            "tcR", "TED", "termstrc", "textreg", "TFMPvalue", "timma", "treeclim", 
            "trustOptim", "tvd", "unmarked", "urltools", "V8", "VideoComparison", 
            "VIM", "waffect", "wordcloud", "wsrf", "XBRL", "zic")

allPkg <- c(allPkg, skippedPkgs)
checkPkg <- c(goodPkgs, badPkg, skippedPkgs)
stopifnot(length(setdiff(checkPkg, allPkg))==0)
stopifnot(length(setdiff(allPkg, checkPkg))==0)



