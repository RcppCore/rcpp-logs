#!/usr/bin/Rscript
 
#load("~/git/rcpp-logs/results/result-20150901-085519.RData")
#goodPkgs <- as.character(subset(res, res==0)[,1])
#dput(goodPkgs)

goodPkgs <- c("accelerometry", "AdaptiveSparsity", "AHR", "algstat", "ALKr", 
              "Amelia", "apcluster", "ASPBay", "autovarCore", "BaBooN", "BalancedSampling", 
              "BayesComm", "BayesFactor", "bayesm", "bayou", "bcp", "bcpa", 
              "bfa", "bfp", "bifactorial", "BIFIEsurvey", "BIPOD", "blockcluster", 
              "blockmodels", "brms", "btf", "bvarsv", "CARBayes", "CARBayesST", 
              "ccaPP", "cccp", "cda", "CDM", "cgAUC", "chopthin", "CIDnetworks", 
              "cladoRcpp", "classify", "clere", "climdex.pcic", "clogitL1", 
              "clusteval", "ClustMMDD", "ClustVarLV", "CMF", "coala", "CompGLM", 
              "ConConPiWiFun", "coneproj", "contoureR", "copCAR", "CorReg", 
              "Coxnet", "creditr", "Crossover", "D3M", "dbmss", "dbscan", "ddalpha", 
              "Delaporte", "dendextendRcpp", "DepthProc", "DescTools", "DetMCD", 
              "dfcomb", "dfmta", "dils", "disclapmix", "diversitree", "diveRsity", 
              "divo", "DNAprofiles", "DNAtools", "dplyr", "dslice", "DStree", 
              "ecp", "EditImputeCont", "eive", "emIRT", "EPGLM", "ESGtoolkit", 
              "EstHer", "evolqg", "EWGoF", "FastBandChol", "fastGHQuad", "FastGP", 
              "FastHCS", "fastM", "FastPCS", "FastRCS", "FBFsearch", "fbroc", 
              "FCNN4R", "fdaMixed", "FDGcopulas", "FDRreg", "FeatureHashing", 
              "fICA", "FisHiCal", "flam", "flip", "FLSSS", "forecast", "forestFloor", 
              "FRESA.CAD", "FSInteract", "fugeR", "FunChisq", "Funclustering", 
              "fwsim", "gaselect", "GCPM", "gdm", "geiger", "GeneticTools", 
              "GENLIB", "geoCount", "GERGM", "gkmSVM", "glcm", "glmgraph", 
              "GMCM", "Gmisc", "gMWT", "GPareto", "GPvam", "graphicalVAR", 
              "gRbase", "gRim", "growcurves", "growfunctions", "GSE", "GUILDS", 
              "GUTS", "GxM", "h5", "haven", "hawkes", "HLMdiag", "hsphase", 
              "hts", "httpuv", "HUM", "humaniformat", "hypervolume", "iBATCGH", 
              "IBHM", "icamix", "iccbeta", "icd9", "icensmis", "imager", "inarmix", 
              "iptools", "IsingSampler", "ISOpureR", "iterpc", "jaatha", "JacobiEigen", 
              "JAGUAR", "jiebaR", "kdecopula", "kergp", "KernSmoothIRT", "kmc", 
              "Kmisc", "LaF", "lamW", "Langevin", "lasvmR", "lbfgs", "lcopula", 
              "lfl", "lifecontingencies", "lm.br", "lme4", "lpme", "lsbclust", 
              "lsgl", "Luminescence", "marked", "markophylo", "markovchain", 
              "MAT", "matchingMarkets", "matchingR", "maxent", "mbbefd", "mcemGLM", 
              "mcIRT", "mcmcse", "metafolio", "mets", "mev", "mice", "minqa", 
              "mirt", "mirtCAT", "miscF", "miscset", "missDeaths", "MixAll", 
              "mixedMem", "mkde", "mlxR", "mmand", "Morpho", "mp", "Mposterior", 
              "MPTinR", "MRIaggr", "msgl", "MTS", "multicool", "mvabund", "MVB", 
              "mvnfast", "mwaved", "myTAI", "nabor", "NAM", "ndl", "NetSim", 
              "neuroim", "ngspatial", "NHMM", "nonlinearTseries", "NPBayesImpute", 
              "oapackage", "odeintr", "oem", "olctools", "OneArmPhaseTwoStudy", 
              "onlinePCA", "openair", "OpenMx", "openxlsx", "orQA", "packcircles", 
              "PAFit", "pander", "PanelCount", "partialAR", "pcalg", "pcIRT", 
              "PedCNV", "pedometrics", "penMSM", "PerMallows", "phylobase", 
              "planar", "plotSEMM", "plyr", "poisDoubleSamp", "polywog", "PoweR", 
              "PP", "PPtreeViz", "PReMiuM", "primes", "pROC", "propagate", 
              "prospectr", "protViz", "pryr", "psd", "psgp", "pvar", "QRM", 
              "quadrupen", "quanteda", "quantspec", "qVarSel", "randomUniformForest", 
              "ranger", "Rankcluster", "rankdist", "rARPACK", "raster", "Rblpapi", 
              "Rborist", "Rclusterpp", "RcppAnnoy", "RcppAPT", "RcppArmadillo", 
              "RcppBDT", "rcppbugs", "RcppClassic", "RcppClassicExamples", 
              "RcppCNPy", "RcppDE", "RcppDL", "RcppEigen", "RcppExamples", 
              "RcppFaddeeva", "RcppGSL", "RcppMLPACK", "RcppOctave", "RcppProgress", 
              "RcppRedis", "RcppRoll", "RcppShark", "RcppSMC", "RcppStreams", 
              "RcppTOML", "RcppXts", "RcppZiggurat", "readr", "readstata13", 
              "readxl", "RealVAMS", "reconstructr", "recosystem", "redist", 
              "relSim", "remote", "ReorderCluster", "repra", "resemble", "reshape2", 
              "revealedPrefs", "rexpokit", "rforensicbatwing", "rgam", "RInside", 
              "ripa", "rivr", "rkvo", "Rlibeemd", "RLRsim", "Rmalschains", 
              "rmgarch", "Rmixmod", "RmixmodCombi", "rncl", "robustgam", "robustHD", 
              "robustreg", "rococo", "rotations", "RoughSets", "roxygen2", 
              "rpf", "rpg", "Rphylopars", "rplexos", "rPref", "RProtoBuf", 
              "RQuantLib", "RSNNS", "RSNPset", "RSofia", "Rsomoclu", "rstan", 
              "rstpm2", "rtkpp", "Rtsne", "Ruchardet", "rugarch", "Rvcg", "RVowpalWabbit", 
              "saturnin", "sbmSDP", "SBSA", "scales", "scrm", "scrypt", "sdcMicro", 
              "sdcTable", "SEERaBomb", "segmag", "seismicRoll", "SelvarMix", 
              "sequences", "sgd", "sglOptim", "signalHsmm", "simFrame", "simPop", 
              "SimReg", "sirt", "slfm", "SLOPE", "snipEM", "snplist", "SocialNetworks", 
              "SOD", "spacodiR", "spaMM", "SparseFactorAnalysis", "sparseHessianFD", 
              "sparseLTSEigen", "sparsereg", "SpatialEpi", "SpatialTools", 
              "SpatPCA", "spBayesSurv", "spduration", "spsann", "StatMethRank", 
              "staTools", "StereoMorph", "stm", "StMoSim", "stochvol", "stocks", 
              "stosim", "strataG", "stream", "strum", "survAccuracyMeasures", 
              "surveillance", "survSNP", "SVMMatch", "synlik", "systemicrisk", 
              "tagcloud", "TAM", "TAQMNGR", "tbart", "tcR", "TED", "termstrc", 
              "TESS", "textreg", "TFMPvalue", "timma", "tmg", "treeclim", "trustOptim", 
              "tvd", "unmarked", "urltools", "V8", "VarSelLCM", "VideoComparison", 
              "VIM", "waffect", "walkr", "webreadr", "wordcloud", "wsrf", "XBRL", 
              "xergm", "xml2", "yakmoR", "zic")

    
#badPkg <- as.character(subset(res, res==1)[,1])
#dput(badPkg)

oldbadPkgs <- c("bcpa", "dplyr", "dslice", "GPareto", "lme4", "markovchain", 
                "mcmcse", "miceadds", "MRIaggr", "msgl", "nabor", "optmatch", 
                "pROC", "RcppDE", "rlme", "satellite", "tbart", "wsrf")

badPkg <- c("miceadds", "optmatch", "rgeolocate", "rlme", "satellite")

skippedPkgs <- c("cqrReg", # package required by not avilable: ‘Rmosek’ (which needs Mosek)
                 "wideLM") # needs working cuda

goodAfterPatch <- c()   

badNotRcpp <- c()

baddepends <- c(
    "miceadds"         # buildsm bombs in examples: "there is no package called ‘jomo’" -- Rmosek
    )

badnotrcpp <- c(
    "optmatch",         # internal to package -- fails test
    "rgeolocate",       # internal to package ?  fails with some curl error
    "rlme",		# fails in examples with regexp error, seems local to package
    "satellite"		# builds, fails in example with rgdal missing even though only suggested
    )

## missing BioC depends -- no longer applicable as we now explicitly set the BioC repo too
#bad4BioCdep <- c()

## ## Failing at compile time due to Rcpp issues
bad4RcppAPI <- c()

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
cat("  Bad Deps   ", length(baddepends), "\n")
cat("Skipped      ", skipped, "\n")
cat("Total        ", good + bad, "\n")
cat("Bad Percent  ", badremain / (good + bad), "\n")


#allPkg <- as.character(res[,1])
#dput(allPkg)

allPkg <- c("accelerometry", "AdaptiveSparsity", "AHR", "algstat", "ALKr", 
            "Amelia", "apcluster", "ASPBay", "autovarCore", "BaBooN", "BalancedSampling", 
            "BayesComm", "BayesFactor", "bayesm", "bayou", "bcp", "bcpa", 
            "bfa", "bfp", "bifactorial", "BIFIEsurvey", "BIPOD", "blockcluster", 
            "blockmodels", "brms", "btf", "bvarsv", "CARBayes", "CARBayesST", 
            "ccaPP", "cccp", "cda", "CDM", "cgAUC", "chopthin", "CIDnetworks", 
            "cladoRcpp", "classify", "clere", "climdex.pcic", "clogitL1", 
            "clusteval", "ClustMMDD", "ClustVarLV", "CMF", "coala", "CompGLM", 
            "ConConPiWiFun", "coneproj", "contoureR", "copCAR", "CorReg", 
            "Coxnet", "creditr", "Crossover", "D3M", "dbmss", "dbscan", "ddalpha", 
            "Delaporte", "dendextendRcpp", "DepthProc", "DescTools", "DetMCD", 
            "dfcomb", "dfmta", "dils", "disclapmix", "diversitree", "diveRsity", 
            "divo", "DNAprofiles", "DNAtools", "dplyr", "dslice", "DStree", 
            "ecp", "EditImputeCont", "eive", "emIRT", "EPGLM", "ESGtoolkit", 
            "EstHer", "evolqg", "EWGoF", "FastBandChol", "fastGHQuad", "FastGP", 
            "FastHCS", "fastM", "FastPCS", "FastRCS", "FBFsearch", "fbroc", 
            "FCNN4R", "fdaMixed", "FDGcopulas", "FDRreg", "FeatureHashing", 
            "fICA", "FisHiCal", "flam", "flip", "FLSSS", "forecast", "forestFloor", 
            "FRESA.CAD", "FSInteract", "fugeR", "FunChisq", "Funclustering", 
            "fwsim", "gaselect", "GCPM", "gdm", "geiger", "GeneticTools", 
            "GENLIB", "geoCount", "GERGM", "gkmSVM", "glcm", "glmgraph", 
            "GMCM", "Gmisc", "gMWT", "GPareto", "GPvam", "graphicalVAR", 
            "gRbase", "gRim", "growcurves", "growfunctions", "GSE", "GUILDS", 
            "GUTS", "GxM", "h5", "haven", "hawkes", "HLMdiag", "hsphase", 
            "hts", "httpuv", "HUM", "humaniformat", "hypervolume", "iBATCGH", 
            "IBHM", "icamix", "iccbeta", "icd9", "icensmis", "imager", "inarmix", 
            "iptools", "IsingSampler", "ISOpureR", "iterpc", "jaatha", "JacobiEigen", 
            "JAGUAR", "jiebaR", "kdecopula", "kergp", "KernSmoothIRT", "kmc", 
            "Kmisc", "LaF", "lamW", "Langevin", "lasvmR", "lbfgs", "lcopula", 
            "lfl", "lifecontingencies", "lm.br", "lme4", "lpme", "lsbclust", 
            "lsgl", "Luminescence", "marked", "markophylo", "markovchain", 
            "MAT", "matchingMarkets", "matchingR", "maxent", "mbbefd", "mcemGLM", 
            "mcIRT", "mcmcse", "metafolio", "mets", "mev", "mice", "miceadds", 
            "minqa", "mirt", "mirtCAT", "miscF", "miscset", "missDeaths", 
            "MixAll", "mixedMem", "mkde", "mlxR", "mmand", "Morpho", "mp", 
            "Mposterior", "MPTinR", "MRIaggr", "msgl", "MTS", "multicool", 
            "mvabund", "MVB", "mvnfast", "mwaved", "myTAI", "nabor", "NAM", 
            "ndl", "NetSim", "neuroim", "ngspatial", "NHMM", "nonlinearTseries", 
            "NPBayesImpute", "oapackage", "odeintr", "oem", "olctools", "OneArmPhaseTwoStudy", 
            "onlinePCA", "openair", "OpenMx", "openxlsx", "optmatch", "orQA", 
            "packcircles", "PAFit", "pander", "PanelCount", "partialAR", 
            "pcalg", "pcIRT", "PedCNV", "pedometrics", "penMSM", "PerMallows", 
            "phylobase", "planar", "plotSEMM", "plyr", "poisDoubleSamp", 
            "polywog", "PoweR", "PP", "PPtreeViz", "PReMiuM", "primes", "pROC", 
            "propagate", "prospectr", "protViz", "pryr", "psd", "psgp", "pvar", 
            "QRM", "quadrupen", "quanteda", "quantspec", "qVarSel", "randomUniformForest", 
            "ranger", "Rankcluster", "rankdist", "rARPACK", "raster", "Rblpapi", 
            "Rborist", "Rclusterpp", "RcppAnnoy", "RcppAPT", "RcppArmadillo", 
            "RcppBDT", "rcppbugs", "RcppClassic", "RcppClassicExamples", 
            "RcppCNPy", "RcppDE", "RcppDL", "RcppEigen", "RcppExamples", 
            "RcppFaddeeva", "RcppGSL", "RcppMLPACK", "RcppOctave", "RcppProgress", 
            "RcppRedis", "RcppRoll", "RcppShark", "RcppSMC", "RcppStreams", 
            "RcppTOML", "RcppXts", "RcppZiggurat", "readr", "readstata13", 
            "readxl", "RealVAMS", "reconstructr", "recosystem", "redist", 
            "relSim", "remote", "ReorderCluster", "repra", "resemble", "reshape2", 
            "revealedPrefs", "rexpokit", "rforensicbatwing", "rgam", "rgeolocate", 
            "RInside", "ripa", "rivr", "rkvo", "Rlibeemd", "rlme", "RLRsim", 
            "Rmalschains", "rmgarch", "Rmixmod", "RmixmodCombi", "rncl", 
            "robustgam", "robustHD", "robustreg", "rococo", "rotations", 
            "RoughSets", "roxygen2", "rpf", "rpg", "Rphylopars", "rplexos", 
            "rPref", "RProtoBuf", "RQuantLib", "RSNNS", "RSNPset", "RSofia", 
            "Rsomoclu", "rstan", "rstpm2", "rtkpp", "Rtsne", "Ruchardet", 
            "rugarch", "Rvcg", "RVowpalWabbit", "satellite", "saturnin", 
            "sbmSDP", "SBSA", "scales", "scrm", "scrypt", "sdcMicro", "sdcTable", 
            "SEERaBomb", "segmag", "seismicRoll", "SelvarMix", "sequences", 
            "sgd", "sglOptim", "signalHsmm", "simFrame", "simPop", "SimReg", 
            "sirt", "slfm", "SLOPE", "snipEM", "snplist", "SocialNetworks", 
            "SOD", "spacodiR", "spaMM", "SparseFactorAnalysis", "sparseHessianFD", 
            "sparseLTSEigen", "sparsereg", "SpatialEpi", "SpatialTools", 
            "SpatPCA", "spBayesSurv", "spduration", "spsann", "StatMethRank", 
            "staTools", "StereoMorph", "stm", "StMoSim", "stochvol", "stocks", 
            "stosim", "strataG", "stream", "strum", "survAccuracyMeasures", 
            "surveillance", "survSNP", "SVMMatch", "synlik", "systemicrisk", 
            "tagcloud", "TAM", "TAQMNGR", "tbart", "tcR", "TED", "termstrc", 
            "TESS", "textreg", "TFMPvalue", "timma", "tmg", "treeclim", "trustOptim", 
            "tvd", "unmarked", "urltools", "V8", "VarSelLCM", "VideoComparison", 
            "VIM", "waffect", "walkr", "webreadr", "wordcloud", "wsrf", "XBRL", 
            "xergm", "xml2", "yakmoR", "zic")

   
allPkg <- c(allPkg, skippedPkgs)
checkPkg <- c(goodPkgs, badPkg, skippedPkgs)
stopifnot(length(setdiff(checkPkg, allPkg))==0)
stopifnot(length(setdiff(allPkg, checkPkg))==0)



