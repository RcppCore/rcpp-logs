#!/usr/bin/Rscript
 
#load("~/git/rcpp-logs/results/result-20150720-081315.RData")
#goodPkgs <- as.character(subset(res, res==0)[,1])
#dput(goodPkgs)

goodPkgs <- c("accelerometry", "AdaptiveSparsity", "AHR", "algstat", "ALKr", 
              "Amelia", "apcluster", "ASPBay", "autovarCore", "BalancedSampling", 
              "BayesFactor", "bayesm", "bayou", "bcp", "bfa", "bfp", "bifactorial", 
              "BIFIEsurvey", "BIPOD", "blockcluster", "blockmodels", "brms", 
              "btf", "bvarsv", "CARBayes", "CARBayesST", "ccaPP", "cda", "CDM", 
              "cgAUC", "chopthin", "CIDnetworks", "cladoRcpp", "classify", 
              "clere", "climdex.pcic", "clogitL1", "clusteval", "ClustMMDD", 
              "ClustVarLV", "CMF", "coala", "CompGLM", "ConConPiWiFun", "coneproj", 
              "copCAR", "CorReg", "Coxnet", "Crossover", "dbmss", "dbscan", 
              "ddalpha", "Delaporte", "dendextendRcpp", "DepthProc", "DetMCD", 
              "dfcomb", "dfmta", "dils", "disclapmix", "diversitree", "diveRsity", 
              "divo", "DNAprofiles", "DNAtools", "dslice", "DStree", "ecp", 
              "EditImputeCont", "eive", "emIRT", "ESGtoolkit", "evolqg", "EWGoF", 
              "fastGHQuad", "FastHCS", "fastM", "FastPCS", "FastRCS", "FBFsearch", 
              "fbroc", "FCNN4R", "fdaMixed", "FDGcopulas", "FDRreg", "FeatureHashing", 
              "fICA", "flam", "flip", "FLSSS", "forecast", "FRESA.CAD", "FSInteract", 
              "fugeR", "FunChisq", "Funclustering", "fwsim", "gaselect", "GCPM", 
              "gdm", "geiger", "GeneticTools", "GENLIB", "geoCount", "gkmSVM", 
              "glcm", "glmgraph", "GMCM", "Gmisc", "gMWT", "GPvam", "graphicalVAR", 
              "gRbase", "gRim", "growcurves", "growfunctions", "GSE", "GUILDS", 
              "GUTS", "GxM", "h5", "haven", "hawkes", "HLMdiag", "hsphase", 
              "hts", "httpuv", "hypervolume", "iBATCGH", "IBHM", "iccbeta", 
              "icd9", "icensmis", "inarmix", "iptools", "IsingSampler", "ISOpureR", 
              "iterpc", "jaatha", "JAGUAR", "jiebaR", "kdecopula", "kergp", 
              "kmc", "Kmisc", "LaF", "lamW", "lbfgs", "lfl", "lifecontingencies", 
              "lm.br", "lpme", "lsbclust", "lsgl", "Luminescence", "marked", 
              "markophylo", "markovchain", "MAT", "matchingMarkets", "matchingR", 
              "maxent", "mbbefd", "mcIRT", "metafolio", "mets", "mice", "minqa", 
              "mirt", "mirtCAT", "miscF", "miscset", "MixAll", "mixedMem", 
              "mkde", "mlxR", "mmand", "mp", "Mposterior", "MPTinR", "MTS", 
              "multicool", "mvabund", "MVB", "mvnfast", "mwaved", "myTAI", 
              "NAM", "ndl", "NetSim", "neuroim", "ngspatial", "NHMM", "nonlinearTseries", 
              "NPBayesImpute", "oapackage", "odeintr", "oem", "OneArmPhaseTwoStudy", 
              "onlinePCA", "openair", "OpenMx", "openxlsx", "orQA", "PAFit", 
              "pander", "partialAR", "pcalg", "pcIRT", "PedCNV", "pedometrics", 
              "penMSM", "PerMallows", "phylobase", "planar", "plotSEMM", "poisDoubleSamp", 
              "polywog", "PoweR", "PP", "PPtreeViz", "PReMiuM", "primes", "propagate", 
              "prospectr", "protViz", "pryr", "psd", "psgp", "pvar", "QRM", 
              "quadrupen", "quanteda", "quantspec", "qVarSel", "randomUniformForest", 
              "Rankcluster", "rankdist", "rARPACK", "raster", "Rborist", "Rclusterpp", 
              "RcppAnnoy", "RcppAPT", "RcppArmadillo", "RcppBDT", "rcppbugs", 
              "RcppClassic", "RcppClassicExamples", "RcppCNPy", "RcppDL", "RcppEigen", 
              "RcppExamples", "RcppFaddeeva", "RcppGSL", "RcppMLPACK", "RcppOctave", 
              "RcppProgress", "RcppRedis", "RcppRoll", "RcppSMC", "RcppStreams", 
              "RcppTOML", "RcppXts", "RcppZiggurat", "readr", "readstata13", 
              "readxl", "RealVAMS", "reconstructr", "recosystem", "redist", 
              "relSim", "remote", "ReorderCluster", "repra", "resemble", "reshape2", 
              "revealedPrefs", "rexpokit", "rforensicbatwing", "rgam", "RInside", 
              "ripa", "rivr", "rkvo", "Rlibeemd", "RLRsim", "Rmalschains", 
              "rmgarch", "Rmixmod", "RmixmodCombi", "rncl", "robustgam", "robustHD", 
              "robustreg", "rococo", "rotations", "RoughSets", "roxygen2", 
              "rpf", "rpg", "Rphylopars", "rplexos", "rPref", "RProtoBuf", 
              "RQuantLib", "RSNNS", "RSNPset", "RSofia", "Rsomoclu", "rstan", 
              "rtkpp", "Rtsne", "Ruchardet", "rugarch", "Rvcg", "RVowpalWabbit", 
              "sbmSDP", "SBSA", "scales", "scrm", "scrypt", "sdcMicro", "sdcTable", 
              "SEERaBomb", "segmag", "seismicRoll", "SelvarMix", "sequences", 
              "sgd", "sglOptim", "signalHsmm", "simFrame", "simPop", "sirt", 
              "slfm", "SLOPE", "snipEM", "snplist", "SocialNetworks", "SOD", 
              "spacodiR", "spaMM", "sparseHessianFD", "sparseLTSEigen", "SpatialEpi", 
              "SpatialTools", "SpatPCA", "spBayesSurv", "spduration", "spsann", 
              "staTools", "StereoMorph", "StMoSim", "stochvol", "stocks", "stosim", 
              "stream", "strum", "survAccuracyMeasures", "surveillance", "survSNP", 
              "SVMMatch", "synlik", "systemicrisk", "tagcloud", "TAM", "TAQMNGR", 
              "tcR", "TED", "termstrc", "TESS", "textreg", "TFMPvalue", "timma", 
              "tmg", "treeclim", "trustOptim", "tvd", "unmarked", "urltools", 
              "V8", "VarSelLCM", "VideoComparison", "VIM", "waffect", "webreadr", 
              "wordcloud", "XBRL", "xergm", "xml2", "zic",
              # three spurious failures
              "plyr",  "RcppDE",  "strataG")
    
#badpkg <- as.character(subset(res, res==1)[,1])
#dput(badPkg)

## reported bad:
## [1] "BaBooN"        "bcpa"          "cccp"          "dplyr" 
## [5] "FisHiCal"      "forestFloor"   "GPareto"       "HUM"   
## [9] "icamix"        "KernSmoothIRT" "lme4"          "miceadds" 
## [13] "missDeaths"    "Morpho"        "MRIaggr"       "msgl"    
## [17] "nabor"         "PBC"           "plyr"          "pROC"    
## [21] "RcppDE"        "rlme"          "strataG"       "tbart"   
## [25] "wsrf"
## of these    plyr RcppDe strataG   spurious
## new: cccp

oldbadPkg <- c("BaBooN", "bcpa", "dplyr", "FisHiCal", "forestFloor", "GPareto", 
               "HUM", "icamix", "KernSmoothIRT", "lme4", "miceadds", "missDeaths", 
               "Morpho", "MRIaggr", "msgl", "nabor", "PBC",  
               "pROC", "RcppRedis", "rlme", "tbart", "wsrf")

badPkg <- c("BaBooN", "bcpa", "cccp", "dplyr", "FisHiCal", "forestFloor", 
            "GPareto", "HUM", "icamix", "KernSmoothIRT", "lme4", "miceadds", 
            "missDeaths", "Morpho", "MRIaggr", "msgl", "nabor", "PBC", 
            "pROC", "rlme", "tbart", "wsrf")

skippedPkgs <- c("cqrReg", # package required by not avilable: ‘Rmosek’ (which needs Mosek)
                 "wideLM") # needs working cuda

goodAfterPatch <- c()   

badNotRcpp <- c()

badnotrcpp <- c(
    "BaBoon",		# builds but "there is no package called ‘norm’"
    "bcpa",		# builds, examples fail at "there is no package called ‘circular’"
    "dplyr",            # builds, tests fail at "Error in library("Lahman") : there is no package called 'Lahman'"
    "FisHiCal",         # builds, bombs in examples: "RGL: GLX extension missing on server"
    "forestFloor",      # builds, bombs in tests: "Error in rgl.open(useNULL) : rgl.open failed"
    "GPareto",          # builds, examples fail: "there is no package called ‘DiceDesign’"
    "HUM",              # builds, bombs in examples: "Error in rgl.open(useNULL) : rgl.open failed"
    "icamix",		# builds, bombs in examples: "there is no package called ‘mixtools’"
    "KernSmoothIRT",    # builds, bombs in examples: "Error in rgl.open(useNULL) : rgl.open failed"
    "lme4",             # builds, bombs in tests: "there is no package called 'MEMSS'"
    "miceadds",         # buildsm bombs in examples: "there is no package called ‘jomo’"
    "missDeaths",	# does NOT build, issue with R_xlen_t; communicated to upstream
    "Morpho",		# builds, bombs in examples: "Error in library(shapes) : there is no package called ‘shapes’",
    "MRIaggr",          # builds, bombs in examples: "requires to have installed the oro.nifti package"
    "msgl",  	        # builds, test tolerance too low; msgl fails on stop() in one of its tests
    "nabor", 		# builds, bombs in tests: "Error in library(RANN) : there is no package called 'RANN'"
    "PBC",              # builds, bombs in examples: "unimplemented type 'expression' in 'copyMatrix'"
    "pROC",		# buids, bombs in examples: "  Package logcondens not available, required with method='logcondens'."
    "RcppRedis", 	# needs an upstream fix in unit test setup (related to rredis)
    "rlme",		# fails in examples with regexp error, seems local to package
    "tbart",		# builds, fails in examples: "  there is no package called ‘GISTools’"
    "wsrf"		# builds, failes in examples: "  Error in library(rattle) : there is no package called 'rattle'"
    )

## missing BioC depends -- no longer applicable as we now explicitly set the BioC repo too
#bad4BioCdep <- c()

## ## Failing at compile time due to Rcpp issues
bad4RcppAPI <- c(
    "cccp"		# segfaults due to apparent changes with String protection, commit now reverted
    )

bad4unclear <- c()

good <- length(goodPkgs) + length(goodAfterPatch)
#badrcpp <- length(bad4RcppAPI) + length(bad4unclear) + length
#badother <- length(bad4notrcpp) 
#bad <- badrcpp + badother
bad <- length(badPkg) - length(goodAfterPatch)
skipped <- length(skippedPkgs)

bad4notrcpp <- length(badnotrcpp)  - length(bad4RcppAPI)
badremain <- bad - bad4notrcpp 

cat("Good         ", good, "\n")
cat("  AsIs       ", length(goodPkgs), "\n")
#cat("  w/Other    ", length(goodWithOtherChange), "\n")
#cat("  w/Question ", length(goodWithQuestion), "\n")
cat("  w/Patches  ", length(goodAfterPatch), "\n")
cat("Bad          ", bad, "\n")
cat("  RcppApi    ", length(bad4RcppAPI), "\n")
cat("  Unclear    ", length(bad4unclear), "\n")
#cat("  Other      ", badother, "\n")
#cat("  BioCDep    ", length(bad4BioCdep), "\n")
cat("  NotRcpp    ", bad4notrcpp, "\n")
cat("Skipped      ", skipped, "\n")
cat("Total        ", good + bad, "\n")
cat("Bad Percent  ", badremain / (good + bad), "\n")



#allPkg <- as.character(res[,1])
#dput(allPkg)

allPkg <- c("accelerometry", "AdaptiveSparsity", "AHR", "algstat", "ALKr", 
            "Amelia", "apcluster", "ASPBay", "autovarCore", "BaBooN", "BalancedSampling", 
            "BayesFactor", "bayesm", "bayou", "bcp", "bcpa", "bfa", "bfp", 
            "bifactorial", "BIFIEsurvey", "BIPOD", "blockcluster", "blockmodels", 
            "brms", "btf", "bvarsv", "CARBayes", "CARBayesST", "ccaPP", "cccp", 
            "cda", "CDM", "cgAUC", "chopthin", "CIDnetworks", "cladoRcpp", 
            "classify", "clere", "climdex.pcic", "clogitL1", "clusteval", 
            "ClustMMDD", "ClustVarLV", "CMF", "coala", "CompGLM", "ConConPiWiFun", 
            "coneproj", "copCAR", "CorReg", "Coxnet", "Crossover", "dbmss", 
            "dbscan", "ddalpha", "Delaporte", "dendextendRcpp", "DepthProc", 
            "DetMCD", "dfcomb", "dfmta", "dils", "disclapmix", "diversitree", 
            "diveRsity", "divo", "DNAprofiles", "DNAtools", "dplyr", "dslice", 
            "DStree", "ecp", "EditImputeCont", "eive", "emIRT", "ESGtoolkit", 
            "evolqg", "EWGoF", "fastGHQuad", "FastHCS", "fastM", "FastPCS", 
            "FastRCS", "FBFsearch", "fbroc", "FCNN4R", "fdaMixed", "FDGcopulas", 
            "FDRreg", "FeatureHashing", "fICA", "FisHiCal", "flam", "flip", 
            "FLSSS", "forecast", "forestFloor", "FRESA.CAD", "FSInteract", 
            "fugeR", "FunChisq", "Funclustering", "fwsim", "gaselect", "GCPM", 
            "gdm", "geiger", "GeneticTools", "GENLIB", "geoCount", "gkmSVM", 
            "glcm", "glmgraph", "GMCM", "Gmisc", "gMWT", "GPareto", "GPvam", 
            "graphicalVAR", "gRbase", "gRim", "growcurves", "growfunctions", 
            "GSE", "GUILDS", "GUTS", "GxM", "h5", "haven", "hawkes", "HLMdiag", 
            "hsphase", "hts", "httpuv", "HUM", "hypervolume", "iBATCGH", 
            "IBHM", "icamix", "iccbeta", "icd9", "icensmis", "inarmix", "iptools", 
            "IsingSampler", "ISOpureR", "iterpc", "jaatha", "JAGUAR", "jiebaR", 
            "kdecopula", "kergp", "KernSmoothIRT", "kmc", "Kmisc", "LaF", 
            "lamW", "lbfgs", "lfl", "lifecontingencies", "lm.br", "lme4", 
            "lpme", "lsbclust", "lsgl", "Luminescence", "marked", "markophylo", 
            "markovchain", "MAT", "matchingMarkets", "matchingR", "maxent", 
            "mbbefd", "mcIRT", "metafolio", "mets", "mice", "miceadds", "minqa", 
            "mirt", "mirtCAT", "miscF", "miscset", "missDeaths", "MixAll", 
            "mixedMem", "mkde", "mlxR", "mmand", "Morpho", "mp", "Mposterior", 
            "MPTinR", "MRIaggr", "msgl", "MTS", "multicool", "mvabund", "MVB", 
            "mvnfast", "mwaved", "myTAI", "nabor", "NAM", "ndl", "NetSim", 
            "neuroim", "ngspatial", "NHMM", "nonlinearTseries", "NPBayesImpute", 
            "oapackage", "odeintr", "oem", "OneArmPhaseTwoStudy", "onlinePCA", 
            "openair", "OpenMx", "openxlsx", "orQA", "PAFit", "pander", "partialAR", 
            "PBC", "pcalg", "pcIRT", "PedCNV", "pedometrics", "penMSM", "PerMallows", 
            "phylobase", "planar", "plotSEMM", "plyr", "poisDoubleSamp", 
            "polywog", "PoweR", "PP", "PPtreeViz", "PReMiuM", "primes", "pROC", 
            "propagate", "prospectr", "protViz", "pryr", "psd", "psgp", "pvar", 
            "QRM", "quadrupen", "quanteda", "quantspec", "qVarSel", "randomUniformForest", 
            "Rankcluster", "rankdist", "rARPACK", "raster", "Rborist", "Rclusterpp", 
            "RcppAnnoy", "RcppAPT", "RcppArmadillo", "RcppBDT", "rcppbugs", 
            "RcppClassic", "RcppClassicExamples", "RcppCNPy", "RcppDE", "RcppDL", 
            "RcppEigen", "RcppExamples", "RcppFaddeeva", "RcppGSL", "RcppMLPACK", 
            "RcppOctave", "RcppProgress", "RcppRedis", "RcppRoll", "RcppSMC", 
            "RcppStreams", "RcppTOML", "RcppXts", "RcppZiggurat", "readr", 
            "readstata13", "readxl", "RealVAMS", "reconstructr", "recosystem", 
            "redist", "relSim", "remote", "ReorderCluster", "repra", "resemble", 
            "reshape2", "revealedPrefs", "rexpokit", "rforensicbatwing", 
            "rgam", "RInside", "ripa", "rivr", "rkvo", "Rlibeemd", "rlme", 
            "RLRsim", "Rmalschains", "rmgarch", "Rmixmod", "RmixmodCombi", 
            "rncl", "robustgam", "robustHD", "robustreg", "rococo", "rotations", 
            "RoughSets", "roxygen2", "rpf", "rpg", "Rphylopars", "rplexos", 
            "rPref", "RProtoBuf", "RQuantLib", "RSNNS", "RSNPset", "RSofia", 
            "Rsomoclu", "rstan", "rtkpp", "Rtsne", "Ruchardet", "rugarch", 
            "Rvcg", "RVowpalWabbit", "sbmSDP", "SBSA", "scales", "scrm", 
            "scrypt", "sdcMicro", "sdcTable", "SEERaBomb", "segmag", "seismicRoll", 
            "SelvarMix", "sequences", "sgd", "sglOptim", "signalHsmm", "simFrame", 
            "simPop", "sirt", "slfm", "SLOPE", "snipEM", "snplist", "SocialNetworks", 
            "SOD", "spacodiR", "spaMM", "sparseHessianFD", "sparseLTSEigen", 
            "SpatialEpi", "SpatialTools", "SpatPCA", "spBayesSurv", "spduration", 
            "spsann", "staTools", "StereoMorph", "StMoSim", "stochvol", "stocks", 
            "stosim", "strataG", "stream", "strum", "survAccuracyMeasures", 
            "surveillance", "survSNP", "SVMMatch", "synlik", "systemicrisk", 
            "tagcloud", "TAM", "TAQMNGR", "tbart", "tcR", "TED", "termstrc", 
            "TESS", "textreg", "TFMPvalue", "timma", "tmg", "treeclim", "trustOptim", 
            "tvd", "unmarked", "urltools", "V8", "VarSelLCM", "VideoComparison", 
            "VIM", "waffect", "webreadr", "wordcloud", "wsrf", "XBRL", "xergm", 
            "xml2", "zic")

    
allPkg <- c(allPkg, skippedPkgs)
checkPkg <- c(goodPkgs, badPkg, skippedPkgs)
stopifnot(length(setdiff(checkPkg, allPkg))==0)
stopifnot(length(setdiff(allPkg, checkPkg))==0)



