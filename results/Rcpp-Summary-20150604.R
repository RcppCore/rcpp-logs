#!/usr/bin/Rscript
 
#load("~/git/rcpp-logs/results/result-20150604-001115.RData")
#goodPkgs <- as.character(subset(res, res==0)[,1])
#dput(goodPkgs)

goodPkgs <- c("accelerometry", "AdaptiveSparsity", "algstat", "ALKr", "Amelia", 
              "apcluster", "ASPBay", "BalancedSampling", "BayesComm", "BayesFactor", 
              "bayou", "bcp", "bfa", "bfp", "bifactorial", "BIFIEsurvey", "BIPOD", 
              "blockcluster", "blockmodels", "brms", "btf", "bvarsv", "CARBayes", 
              "CARBayesST", "ccaPP", "cccp", "cda", "CDM", "cgAUC", "chopthin", 
              "CIDnetworks", "cladoRcpp", "classify", "clere", "climdex.pcic", 
              "clogitL1", "clusteval", "ClustMMDD", "ClustVarLV", "CMF", "CompGLM", 
              "ConConPiWiFun", "coneproj", "copCAR", "CorReg", "Coxnet", "Crossover", 
              "dbmss", "ddalpha", "Delaporte", "dendextendRcpp", "DepthProc", 
              "DetMCD", "dfcomb", "dfmta", "dils", "disclapmix", "diversitree", 
              "diveRsity", "divo", "DNAprofiles", "DNAtools", "dslice", "DStree", 
              "ecp", "eive", "emIRT", "EpiContactTrace", "ESGtoolkit", "evolqg", 
              "EWGoF", "fastGHQuad", "FastHCS", "fastM", "FastPCS", "FastRCS", 
              "FBFsearch", "fbroc", "fdaMixed", "FDGcopulas", "FDRreg", "FeatureHashing", 
              "fICA", "flip", "FLSSS", "forecast", "FRESA.CAD", "FSInteract", 
              "fugeR", "FunChisq", "Funclustering", "fwsim", "gaselect", "GCPM", 
              "gdm", "geiger", "GeneticTools", "GENLIB", "geoCount", "glcm", 
              "glmgraph", "GMCM", "Gmisc", "gMWT", "GPareto", "GPlab", "GPvam", 
              "graphicalVAR", "gRbase", "gRim", "growcurves", "growfunctions", 
              "GSE", "GUILDS", "GUTS", "GxM", "h5", "haven", "hawkes", "HLMdiag", 
              "hsphase", "httpuv", "hypervolume", "iBATCGH", "IBHM", "iccbeta", 
              "icd9", "icensmis", "inarmix", "IsingSampler", "ISOpureR", "iterpc", 
              "jaatha", "JAGUAR", "jiebaR", "kmc", "Kmisc", "LaF", "lamW", 
              "lbfgs", "lfl", "lifecontingencies", "lm.br", "lpme", "lsbclust", 
              "lsgl", "Luminescence", "marked", "markovchain", "MAT", "matchingMarkets", 
              "matchingR", "maxent", "mbbefd", "mcIRT", "metafolio", "mets", 
              "mice", "miceadds", "minqa", "mirt", "mirtCAT", "miscF", "miscset", 
              "MixAll", "mixedMem", "mkde", "mlxR", "mp", "Mposterior", "MPTinR", 
              "MTS", "multicool", "mvabund", "MVB", "mvnfast", "mwaved", "myTAI", 
              "NAM", "ndl", "NetSim", "ngspatial", "NHMM", "nonlinearTseries", 
              "NPBayesImpute", "odeintr", "oem", "onlinePCA", "openair", "OpenMx", 
              "openxlsx", "orQA", "PAFit", "pander", "partialAR", "PBC", "pcalg", 
              "PedCNV", "pedometrics", "penMSM", "PerMallows", "phom", "phylobase", 
              "planar", "plotSEMM", "poisDoubleSamp", "polywog", "PoweR", "PP", 
              "PPtreeViz", "PReMiuM", "propagate", "prospectr", "protViz", 
              "pryr", "psd", "psgp", "pvar", "QRM", "quadrupen", "quanteda", 
              "quantspec", "qVarSel", "randomUniformForest", "Rankcluster", 
              "rankdist", "Rborist", "Rclusterpp", "RcppAnnoy", "RcppAPT", 
              "RcppArmadillo", "RcppBDT", "rcppbugs", "RcppClassic", "RcppClassicExamples", 
              "RcppCNPy", "RcppDE", "RcppDL", "RcppEigen", "RcppExamples", 
              "RcppGSL", "RcppMLPACK", "RcppOctave", "RcppProgress", "RcppRoll", 
              "RcppSMC", "RcppStreams", "RcppTOML", "RcppXts", "RcppZiggurat", 
              "readr", "readstata13", "readxl", "RealVAMS", "reconstructr", 
              "recosystem", "redist", "relSim", "remote", "ReorderCluster", 
              "repra", "resemble", "reshape2", "revealedPrefs", "rexpokit", 
              "rforensicbatwing", "rgam", "RInside", "ripa", "rkvo", "Rlibeemd", 
              "RLRsim", "Rmalschains", "rmgarch", "Rmixmod", "RmixmodCombi", 
              "rncl", "robustgam", "robustHD", "robustreg", "rococo", "rotations", 
              "RoughSets", "roxygen2", "rpf", "rpg", "Rphylopars", "rplexos", 
              "rPref", "RProtoBuf", "RQuantLib", "RSNNS", "RSNPset", "RSofia", 
              "Rsomoclu", "rtkpp", "Rtsne", "Ruchardet", "rugarch", "Rvcg", 
              "RVowpalWabbit", "SBSA", "scrm", "scrypt", "sdcMicro", "sdcTable", 
              "SEERaBomb", "segmag", "seismicRoll", "SelvarMix", "sequences", 
              "sgd", "sglOptim", "simFrame", "simPop", "sirt", "slfm", "SLOPE", 
              "snipEM", "snplist", "SocialNetworks", "SOD", "spacodiR", "spaMM", 
              "sparseHessianFD", "sparseLTSEigen", "SpatialEpi", "SpatialTools", 
              "SpatPCA", "spBayesSurv", "staTools", "StereoMorph", "StMoSim", 
              "stochvol", "stocks", "stosim", "stream", "strum", "survAccuracyMeasures", 
              "surveillance", "survSNP", "SVMMatch", "synlik", "systemicrisk", 
              "tagcloud", "TAM", "TAQMNGR", "tcR", "TED", "textreg", "TFMPvalue", 
              "timma", "tmg", "treeclim", "trustOptim", "tvd", "unmarked", 
              "urltools", "V8", "VarSelLCM", "VideoComparison", "VIM", "waffect", 
              "wordcloud", "XBRL", "xergm", "xml2", "zic",
              ## the following all passes manually
              "mmand", "plyr", "rARPACK", "rivr", "strataG", "termstrc")
    
#badPkg <- as.character(subset(res, res==1)[,1])
#dput(badPkg)

badPkg <- c("bcpa", "dplyr", "FisHiCal", "forestFloor", "HUM", "icamix", 
            "KernSmoothIRT", "lme4", "Morpho", "MRIaggr", "msgl", 
            "nabor", "pROC", "RcppRedis", "rlme", "tbart", "wsrf")

skippedPkgs <- c("cqrReg", # package required by not avilable: ‘Rmosek’ (which needs Mosek)
                 "wideLM") # needs working cuda

goodAfterPatch <- c()   

badNotRcpp <- c()

badnotrcpp <- c(
    "bcpa",		# builds, examples fail at "there is no package called ‘circular’"
    "dplyr",            # builds, tests fail at "Error in library("Lahman") : there is no package called 'Lahman'"
    "FisHiCal",         # builds, bombs in examples: "RGL: GLX extension missing on server"
    "forestFloor",      # builds, bombs in tests: "Error in rgl.open(useNULL) : rgl.open failed"
    "HUM",              # builds, bombs in examples: "Error in rgl.open(useNULL) : rgl.open failed"
    "icamix",		# builds, bombs in examples: "Error in library(mixtools) : there is no package called ‘mixtools’"
    "KernSmoothIRT",    # builds, bombs in examples: "Error in rgl.open(useNULL) : rgl.open failed"
    "lme4",             # builds, bombs in tests: "there is no package called 'MEMSS'"
    "Morpho",		# builds, bombs in examples: "Error in library(shapes) : there is no package called ‘shapes’",
    "MRIaggr",          # builds, bombs in examples: "requires to have installed the oro.nifti package"
    "msgl",  	        # builds, test tolerance too low; msgl fails on stop() in one of its tests
    "nabor", 		# builds, bombs in tests: "Error in library(RANN) : there is no package called 'RANN'"
    "pROC",		# buids, bombs in examples: "  Package logcondens not available, required with method='logcondens'."
    "RcppRedis", 	# needs an upstream fix in unit test setup (related to rredis)
    "rlme",		# fails in examples with regexp error, seems local to package
    "tbart",		# builds, fails in examples: "  there is no package called ‘GISTools’"
    "wsrf"		# builds, failes in examples: "  Error in library(rattle) : there is no package called 'rattle'"
    )

## missing BioC depends -- no longer applicable as we now explicitly set the BioC repo too
#bad4BioCdep <- c()

## ## Failing at compile time due to Rcpp issues
## bad4RcppAPI <- c()

bad4unclear <- c()

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
cat("Total        ", good + bad, "\n")
cat("Bad Percent  ", badremain / (good + bad), "\n")



#allPkg <- as.character(res[,1])
#dput(allPkg)

allPkg <- c("accelerometry", "AdaptiveSparsity", "algstat", "ALKr", "Amelia", 
            "apcluster", "ASPBay", "BalancedSampling", "BayesComm", "BayesFactor", 
            "bayou", "bcp", "bcpa", "bfa", "bfp", "bifactorial", "BIFIEsurvey", 
            "BIPOD", "blockcluster", "blockmodels", "brms", "btf", "bvarsv", 
            "CARBayes", "CARBayesST", "ccaPP", "cccp", "cda", "CDM", "cgAUC", 
            "chopthin", "CIDnetworks", "cladoRcpp", "classify", "clere", 
            "climdex.pcic", "clogitL1", "clusteval", "ClustMMDD", "ClustVarLV", 
            "CMF", "CompGLM", "ConConPiWiFun", "coneproj", "copCAR", "CorReg", 
            "Coxnet", "Crossover", "dbmss", "ddalpha", "Delaporte", "dendextendRcpp", 
            "DepthProc", "DetMCD", "dfcomb", "dfmta", "dils", "disclapmix", 
            "diversitree", "diveRsity", "divo", "DNAprofiles", "DNAtools", 
            "dplyr", "dslice", "DStree", "ecp", "eive", "emIRT", "EpiContactTrace", 
            "ESGtoolkit", "evolqg", "EWGoF", "fastGHQuad", "FastHCS", "fastM", 
            "FastPCS", "FastRCS", "FBFsearch", "fbroc", "fdaMixed", "FDGcopulas", 
            "FDRreg", "FeatureHashing", "fICA", "FisHiCal", "flip", "FLSSS", 
            "forecast", "forestFloor", "FRESA.CAD", "FSInteract", "fugeR", 
            "FunChisq", "Funclustering", "fwsim", "gaselect", "GCPM", "gdm", 
            "geiger", "GeneticTools", "GENLIB", "geoCount", "glcm", "glmgraph", 
            "GMCM", "Gmisc", "gMWT", "GPareto", "GPlab", "GPvam", "graphicalVAR", 
            "gRbase", "gRim", "growcurves", "growfunctions", "GSE", "GUILDS", 
            "GUTS", "GxM", "h5", "haven", "hawkes", "HLMdiag", "hsphase", 
            "httpuv", "HUM", "hypervolume", "iBATCGH", "IBHM", "icamix", 
            "iccbeta", "icd9", "icensmis", "inarmix", "IsingSampler", "ISOpureR", 
            "iterpc", "jaatha", "JAGUAR", "jiebaR", "KernSmoothIRT", "kmc", 
            "Kmisc", "LaF", "lamW", "lbfgs", "lfl", "lifecontingencies", 
            "lm.br", "lme4", "lpme", "lsbclust", "lsgl", "Luminescence", 
            "marked", "markovchain", "MAT", "matchingMarkets", "matchingR", 
            "maxent", "mbbefd", "mcIRT", "metafolio", "mets", "mice", "miceadds", 
            "minqa", "mirt", "mirtCAT", "miscF", "miscset", "MixAll", "mixedMem", 
            "mkde", "mlxR", "mmand", "Morpho", "mp", "Mposterior", "MPTinR", 
            "MRIaggr", "msgl", "MTS", "multicool", "mvabund", "MVB", "mvnfast", 
            "mwaved", "myTAI", "nabor", "NAM", "ndl", "NetSim", "ngspatial", 
            "NHMM", "nonlinearTseries", "NPBayesImpute", "odeintr", "oem", 
            "onlinePCA", "openair", "OpenMx", "openxlsx", "orQA", "PAFit", 
            "pander", "partialAR", "PBC", "pcalg", "PedCNV", "pedometrics", 
            "penMSM", "PerMallows", "phom", "phylobase", "planar", "plotSEMM", 
            "plyr", "poisDoubleSamp", "polywog", "PoweR", "PP", "PPtreeViz", 
            "PReMiuM", "pROC", "propagate", "prospectr", "protViz", "pryr", 
            "psd", "psgp", "pvar", "QRM", "quadrupen", "quanteda", "quantspec", 
            "qVarSel", "randomUniformForest", "Rankcluster", "rankdist", 
            "rARPACK", "Rborist", "Rclusterpp", "RcppAnnoy", "RcppAPT", "RcppArmadillo", 
            "RcppBDT", "rcppbugs", "RcppClassic", "RcppClassicExamples", 
            "RcppCNPy", "RcppDE", "RcppDL", "RcppEigen", "RcppExamples", 
            "RcppGSL", "RcppMLPACK", "RcppOctave", "RcppProgress", "RcppRedis", 
            "RcppRoll", "RcppSMC", "RcppStreams", "RcppTOML", "RcppXts", 
            "RcppZiggurat", "readr", "readstata13", "readxl", "RealVAMS", 
            "reconstructr", "recosystem", "redist", "relSim", "remote", "ReorderCluster", 
            "repra", "resemble", "reshape2", "revealedPrefs", "rexpokit", 
            "rforensicbatwing", "rgam", "RInside", "ripa", "rivr", "rkvo", 
            "Rlibeemd", "rlme", "RLRsim", "Rmalschains", "rmgarch", "Rmixmod", 
            "RmixmodCombi", "rncl", "robustgam", "robustHD", "robustreg", 
            "rococo", "rotations", "RoughSets", "roxygen2", "rpf", "rpg", 
            "Rphylopars", "rplexos", "rPref", "RProtoBuf", "RQuantLib", "RSNNS", 
            "RSNPset", "RSofia", "Rsomoclu", "rtkpp", "Rtsne", "Ruchardet", 
            "rugarch", "Rvcg", "RVowpalWabbit", "SBSA", "scrm", "scrypt", 
            "sdcMicro", "sdcTable", "SEERaBomb", "segmag", "seismicRoll", 
            "SelvarMix", "sequences", "sgd", "sglOptim", "simFrame", "simPop", 
            "sirt", "slfm", "SLOPE", "snipEM", "snplist", "SocialNetworks", 
            "SOD", "spacodiR", "spaMM", "sparseHessianFD", "sparseLTSEigen", 
            "SpatialEpi", "SpatialTools", "SpatPCA", "spBayesSurv", "staTools", 
            "StereoMorph", "StMoSim", "stochvol", "stocks", "stosim", "strataG", 
            "stream", "strum", "survAccuracyMeasures", "surveillance", "survSNP", 
            "SVMMatch", "synlik", "systemicrisk", "tagcloud", "TAM", "TAQMNGR", 
            "tbart", "tcR", "TED", "termstrc", "textreg", "TFMPvalue", "timma", 
            "tmg", "treeclim", "trustOptim", "tvd", "unmarked", "urltools", 
            "V8", "VarSelLCM", "VideoComparison", "VIM", "waffect", "wordcloud", 
            "wsrf", "XBRL", "xergm", "xml2", "zic")
   
allPkg <- c(allPkg, skippedPkgs)
checkPkg <- c(goodPkgs, badPkg, skippedPkgs)
stopifnot(length(setdiff(checkPkg, allPkg))==0)
stopifnot(length(setdiff(allPkg, checkPkg))==0)



