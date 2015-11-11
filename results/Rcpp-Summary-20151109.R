#!/usr/bin/Rscript
 
#load("~/git/rcpp-logs/results/result-20151109-192443.RData")
#goodPkgs <- as.character(subset(res, res==0)[,1])
#dput(goodPkgs)

goodPkgs <- c("accelerometry", "AdaptiveSparsity", "AHR", "algstat", "ALKr", 
              "Amelia", "apcluster", "ASPBay", "autovarCore", "BaBooN", "BalancedSampling", 
              "batman", "BayesComm", "BayesFactor", "bayesm", "bayou", "bcp", 
              "bcpa", "BEDMatrix", "bfa", "bfp", "bifactorial", "BIFIEsurvey", 
              "bigmemory", "bigtabulate", "Biocomb", "BIPOD", "blockcluster", 
              "blockmodels", "btf", "BTLLasso", "bvarsv", "bWGR", "CARBayes", 
              "CARBayesST", "ccaPP", "cccp", "cda", "CDM", "cgAUC", "ChannelAttribution", 
              "chopthin", "CIDnetworks", "cladoRcpp", "classify", "clere", 
              "climdex.pcic", "clogitL1", "ClusterStability", "clusteval", 
              "ClustMMDD", "ClustVarLV", "CMF", "coala", "CompGLM", "ConConPiWiFun", 
              "coneproj", "contoureR", "copCAR", "cord", "CorReg", "Coxnet", 
              "CoxPlus", "cpgen", "creditr", "Crossover", "D3M", "datafsm", 
              "dbmss", "dbscan", "ddalpha", "ddR", "Delaporte", "dendextendRcpp", 
              "DepthProc", "DescTools", "DetMCD", "dfcomb", "dfmta", "DiffusionRgqd", 
              "dils", "dina", "disclapmix", "diversitree", "diveRsity", "divo", 
              "DNAprofiles", "DNAtools", "dslice", "DStree", "ecp", "EditImputeCont", 
              "eive", "EloChoice", "emil", "emIRT", "EPGLM", "ESGtoolkit", 
              "EstHer", "evolqg", "EWGoF", "FastBandChol", "fastGHQuad", "FastGP", 
              "FastHCS", "fastM", "FastPCS", "FastRCS", "FBFsearch", "fbroc", 
              "FCNN4R", "fdaMixed", "FDGcopulas", "FDRreg", "FeatureHashing", 
              "FIACH", "fICA", "FisHiCal", "flam", "flip", "FLSSS", "forecast", 
              "fourPNO", "frailtySurv", "FRESA.CAD", "FSInteract", "fugeR", 
              "FunChisq", "Funclustering", "fwsim", "gaselect", "gaston", "GCPM", 
              "gdm", "gdtools", "geiger", "GeneticTools", "GENLIB", "geoCount", 
              "GERGM", "gkmSVM", "glamlasso", "glcm", "glmgraph", "GMCM", "Gmisc", 
              "gmum.r", "gmwm", "gMWT", "GPvam", "gRain", "graphicalVAR", "gRbase", 
              "gRim", "growcurves", "growfunctions", "GSE", "GUILDS", "GUTS", 
              "GxM", "h5", "haven", "hawkes", "HDPenReg", "hit", "HLMdiag", 
              "hsphase", "hts", "httpuv", "HUM", "humaniformat", "hypervolume", 
              "iBATCGH", "IBHM", "icamix", "iccbeta", "icd9", "icensmis", "iLaplace", 
              "imager", "immer", "inarmix", "iptools", "IsingSampler", "ISOpureR", 
              "iterpc", "jaatha", "JacobiEigen", "JAGUAR", "jiebaR", "jmotif", 
              "kdecopula", "kergp", "kernDeepStackNet", "KernSmoothIRT", "kmc", 
              "kmeans.ddR", "Kmisc", "LaF", "lamW", "Langevin", "lasvmR", "lbfgs", 
              "lcopula", "lfl", "lifecontingencies", "lm.br", "lpme", "lsbclust", 
              "lsgl", "lucr", "Luminescence", "marked", "markophylo", "markovchain", 
              "MAT", "matchingMarkets", "matchingR", "maxent", "mbbefd", "mcemGLM", 
              "mcIRT", "mcmcse", "metafolio", "mets", "mev", "mgm", "minqa", 
              "mirt", "mirtCAT", "miscF", "miscset", "missDeaths", "MixAll", 
              "mixedMem", "mkde", "mlxR", "mmand", "Morpho", "moveHMM", "mp", 
              "Mposterior", "MPTinR", "MRIaggr", "msgl", "MTS", "multicool", 
              "mvabund", "MVB", "mvnfast", "mwaved", "myTAI", "nabor", "NAM", 
              "ndl", "NetSim", "neuroim", "ngspatial", "NHMM", "nonlinearTseries", 
              "NPBayesImpute", "oapackage", "odeintr", "oem", "olctools", "OneArmPhaseTwoStudy", 
              "onlinePCA", "openair", "OpenMx", "openxlsx", "optmatch", "orQA", 
              "packcircles", "PAFit", "pander", "PanelCount", "partialAR", 
              "pcalg", "pcIRT", "PedCNV", "penMSM", "PerMallows", "phylobase", 
              "phylosignal", "planar", "plotSEMM", "plyr", "poisDoubleSamp", 
              "polyfreqs", "polywog", "PoweR", "PP", "PPtreeViz", "prclust", 
              "PReMiuM", "primes", "prodlim", "ProNet", "propagate", "prospectr", 
              "protViz", "pryr", "psd", "psgp", "purrr", "pvar", "QRM", "quadrupen", 
              "quanteda", "quantspec", "qVarSel", "rags2ridges", "randomUniformForest", 
              "ranger", "Rankcluster", "rankdist", "rARPACK", "raster", "Rblpapi", 
              "Rborist", "Rclusterpp", "RcppAnnoy", "RcppAPT", "RcppArmadillo", 
              "RcppBDT", "rcppbugs", "RcppClassic", "RcppClassicExamples", 
              "RcppCNPy", "RcppDL", "RcppEigen", "RcppExamples", "RcppFaddeeva", 
              "RcppGSL", "RcppMLPACK", "RcppOctave", "RcppProgress", "RcppRedis", 
              "RcppRoll", "RcppShark", "RcppSMC", "RcppStreams", "RcppTOML", 
              "RcppXts", "RcppZiggurat", "readr", "readstata13", "readxl", 
              "RealVAMS", "reconstructr", "recosystem", "redist", "relSim", 
              "remote", "ReorderCluster", "resemble", "reshape2", "revealedPrefs", 
              "rexpokit", "rforensicbatwing", "rgam", "rgeolocate", "RInside", 
              "Rip46", "ripa", "rivr", "rkvo", "Rlibeemd", "RLRsim", "Rmalschains", 
              "rmgarch", "Rmixmod", "RmixmodCombi", "rncl", "RNiftyReg", "robustgam", 
              "robustHD", "robustreg", "rococo", "rollply", "rotations", "RoughSets", 
              "roxygen2", "rpf", "rpg", "Rphylopars", "rplexos", "rPref", "RProtoBuf", 
              "RQuantLib", "RSNNS", "RSNPset", "RSofia", "Rsomoclu", "rstan", 
              "rstpm2", "rtkpp", "Rtsne", "Ruchardet", "rugarch", "Rvcg", "RVowpalWabbit", 
              "rwirelesscom", "saturnin", "sbmSDP", "SBSA", "scales", "scrm", 
              "scrypt", "sdcMicro", "sdcTable", "SEERaBomb", "segmag", "seismicRoll", 
              "SelvarMix", "sequences", "sgd", "sglOptim", "signalHsmm", "simFrame", 
              "simPop", "SimReg", "sirt", "slfm", "SLOPE", "snipEM", "snplist", 
              "SocialNetworks", "SOD", "spacodiR", "spaMM", "SparseFactorAnalysis", 
              "sparseHessianFD", "sparseLTSEigen", "sparsereg", "spatgraphs", 
              "SpatialEpi", "SpatialTools", "SpatPCA", "spBayesSurv", "spduration", 
              "spsann", "starma", "StatMethRank", "staTools", "StereoMorph", 
              "stm", "StMoSim", "stochvol", "stocks", "stosim", "strataG", 
              "stream", "strum", "survAccuracyMeasures", "surveillance", "survSNP", 
              "SVMMatch", "synlik", "systemicrisk", "tagcloud", "TAM", "TAQMNGR", 
              "TauStar", "tcR", "TDA", "TED", "termstrc", "TESS", "textreg", 
              "textreuse", "TFMPvalue", "tidyr", "timma", "TMB", "tmg", "tmlenet", 
              "tnam", "treeclim", "treescape", "trustOptim", "tvd", "unmarked", 
              "urltools", "V8", "VarSelLCM", "VideoComparison", "VIM", "waffect", 
              "walkr", "webreadr", "wingui", "wordcloud", "XBRL", "xml2", "yakmoR", 
              "zic",
              ## spurious failures
              "RcppDE"
              )

#badPkg <- as.character(subset(res, res==1)[,1])
#dput(badPkg)

oldoldbadPkg <- c("dfcomb", "emil", "icd9", "miceadds", "optmatch",  
                  "readr", "readxl", "rpg", "RStoolbox", "satellite", "tidyr")

oldbadPkg <- c("dfcomb", "miceadds", "optmatch", "rgeolocate", "RStoolbox", 
            "satellite")

badPkg <- c("cycleRtools", "dplyr", "forestFloor", "GPareto", "LANDD", 
            "lme4", "mice", "miceadds", "pedometrics", "pROC", 
            "RStoolbox", "satellite", "tbart", "wsrf")

skippedPkgs <- c("cqrReg", # package required by not avilable: ‘Rmosek’ (which needs Mosek)
                 "wideLM") # needs working cuda

goodAfterPatch <- c()   

badNotRcpp <- c()

baddepends <- c(
    "cycleRtools",      # builds, bombs in examples: "there is no package called ‘changepoint’"
    "dplyr",            # builds, bombs in tests: "there is no package called 'Lahman'"
    "forestFloor",      # builds, bombs in tests: "there is no package called 'rfPermute'"
    "GPareto",          # builds, bombs in examples: "there is no package called ‘DiceDesign’"
    "LANDD",            # Packages required but not available: ‘GOstats’ ‘GOSemSim’
    "miceadds",         # builds, bombs in examples: "there is no package called ‘jomo’" -- Rmosek
    "pedometrics", 	# Error: Package 'moments' needed for this function to work. Please install it.
    "pROC",		# Package logcondens not available, required with method='logcondens'. Please install it
    "RStoolbox",	# builds, bombs in examples: "perhaps you need to install rgdal first"
    "satellite", 	# builds, bombs in examples: "perhaps you need to install rgdal first"
    "tbart",            # builds, bombs in examples: "there is no package called ‘GISTools’"
    "wsrf"              # builds, bombs in examples: "there is no package called 'rattle'"
    )

badother <- c()

## missing BioC depends -- no longer applicable as we now explicitly set the BioC repo too
#bad4BioCdep <- c()

## ## Failing at compile time due to Rcpp issues
bad4RcppAPI <- c()

bad4unclear <- c(
    "lme4",		# test failure -- no convergence in test
    "mice"		# Error in var(data[, j], na.rm = TRUE) : 'x' is a factor
)

good <- length(goodPkgs) + length(goodAfterPatch)
#badrcpp <- length(bad4RcppAPI) + length(bad4unclear) + length
badother <- length(badother) 
#bad <- badrcpp + badother
bad <- length(badPkg) - length(goodAfterPatch)
skipped <- length(skippedPkgs)

#bad4notrcpp <- length(badnotrcpp)  - length(bad4RcppAPI) 
badremain <- bad - length(baddepends)

cat("Good         ", good, "\n")
cat("  AsIs       ", length(goodPkgs), "\n")
#cat("  w/Other    ", length(goodWithOtherChange), "\n")
#cat("  w/Question ", length(goodWithQuestion), "\n")
cat("  w/Patches  ", length(goodAfterPatch), "\n")
cat("Bad          ", bad, "\n")
cat("  RcppApi    ", length(bad4RcppAPI), "\n")
cat("  Unclear    ", length(bad4unclear), "\n")
cat("  Bad Deps   ", length(baddepends), "\n")
cat("  Other      ", badother, "\n")
#cat("  BioCDep    ", length(bad4BioCdep), "\n")
#cat("  NotRcpp    ", bad4notrcpp, "\n")
cat("Skipped      ", skipped, "\n")
cat("Total        ", good + bad, "\n")
cat("Bad Percent  ", badremain / (good + bad), "\n")


#allPkg <- as.character(res[,1])
#dput(allPkg)

allPkg <- c("accelerometry", "AdaptiveSparsity", "AHR", "algstat", "ALKr", 
            "Amelia", "apcluster", "ASPBay", "autovarCore", "BaBooN", "BalancedSampling", 
            "batman", "BayesComm", "BayesFactor", "bayesm", "bayou", "bcp", 
            "bcpa", "BEDMatrix", "bfa", "bfp", "bifactorial", "BIFIEsurvey", 
            "bigmemory", "bigtabulate", "Biocomb", "BIPOD", "blockcluster", 
            "blockmodels", "btf", "BTLLasso", "bvarsv", "bWGR", "CARBayes", 
            "CARBayesST", "ccaPP", "cccp", "cda", "CDM", "cgAUC", "ChannelAttribution", 
            "chopthin", "CIDnetworks", "cladoRcpp", "classify", "clere", 
            "climdex.pcic", "clogitL1", "ClusterStability", "clusteval", 
            "ClustMMDD", "ClustVarLV", "CMF", "coala", "CompGLM", "ConConPiWiFun", 
            "coneproj", "contoureR", "copCAR", "cord", "CorReg", "Coxnet", 
            "CoxPlus", "cpgen", "creditr", "Crossover", "cycleRtools", "D3M", 
            "datafsm", "dbmss", "dbscan", "ddalpha", "ddR", "Delaporte", 
            "dendextendRcpp", "DepthProc", "DescTools", "DetMCD", "dfcomb", 
            "dfmta", "DiffusionRgqd", "dils", "dina", "disclapmix", "diversitree", 
            "diveRsity", "divo", "DNAprofiles", "DNAtools", "dplyr", "dslice", 
            "DStree", "ecp", "EditImputeCont", "eive", "EloChoice", "emil", 
            "emIRT", "EPGLM", "ESGtoolkit", "EstHer", "evolqg", "EWGoF", 
            "FastBandChol", "fastGHQuad", "FastGP", "FastHCS", "fastM", "FastPCS", 
            "FastRCS", "FBFsearch", "fbroc", "FCNN4R", "fdaMixed", "FDGcopulas", 
            "FDRreg", "FeatureHashing", "FIACH", "fICA", "FisHiCal", "flam", 
            "flip", "FLSSS", "forecast", "forestFloor", "fourPNO", "frailtySurv", 
            "FRESA.CAD", "FSInteract", "fugeR", "FunChisq", "Funclustering", 
            "fwsim", "gaselect", "gaston", "GCPM", "gdm", "gdtools", "geiger", 
            "GeneticTools", "GENLIB", "geoCount", "GERGM", "gkmSVM", "glamlasso", 
            "glcm", "glmgraph", "GMCM", "Gmisc", "gmum.r", "gmwm", "gMWT", 
            "GPareto", "GPvam", "gRain", "graphicalVAR", "gRbase", "gRim", 
            "growcurves", "growfunctions", "GSE", "GUILDS", "GUTS", "GxM", 
            "h5", "haven", "hawkes", "HDPenReg", "hit", "HLMdiag", "hsphase", 
            "hts", "httpuv", "HUM", "humaniformat", "hypervolume", "iBATCGH", 
            "IBHM", "icamix", "iccbeta", "icd9", "icensmis", "iLaplace", 
            "imager", "immer", "inarmix", "iptools", "IsingSampler", "ISOpureR", 
            "iterpc", "jaatha", "JacobiEigen", "JAGUAR", "jiebaR", "jmotif", 
            "kdecopula", "kergp", "kernDeepStackNet", "KernSmoothIRT", "kmc", 
            "kmeans.ddR", "Kmisc", "LaF", "lamW", "LANDD", "Langevin", "lasvmR", 
            "lbfgs", "lcopula", "lfl", "lifecontingencies", "lm.br", "lme4", 
            "lpme", "lsbclust", "lsgl", "lucr", "Luminescence", "marked", 
            "markophylo", "markovchain", "MAT", "matchingMarkets", "matchingR", 
            "maxent", "mbbefd", "mcemGLM", "mcIRT", "mcmcse", "metafolio", 
            "mets", "mev", "mgm", "mice", "miceadds", "minqa", "mirt", "mirtCAT", 
            "miscF", "miscset", "missDeaths", "MixAll", "mixedMem", "mkde", 
            "mlxR", "mmand", "Morpho", "moveHMM", "mp", "Mposterior", "MPTinR", 
            "MRIaggr", "msgl", "MTS", "multicool", "mvabund", "MVB", "mvnfast", 
            "mwaved", "myTAI", "nabor", "NAM", "ndl", "NetSim", "neuroim", 
            "ngspatial", "NHMM", "nonlinearTseries", "NPBayesImpute", "oapackage", 
            "odeintr", "oem", "olctools", "OneArmPhaseTwoStudy", "onlinePCA", 
            "openair", "OpenMx", "openxlsx", "optmatch", "orQA", "packcircles", 
            "PAFit", "pander", "PanelCount", "partialAR", "pcalg", "pcIRT", 
            "PedCNV", "pedometrics", "penMSM", "PerMallows", "phylobase", 
            "phylosignal", "planar", "plotSEMM", "plyr", "poisDoubleSamp", 
            "polyfreqs", "polywog", "PoweR", "PP", "PPtreeViz", "prclust", 
            "PReMiuM", "primes", "pROC", "prodlim", "ProNet", "propagate", 
            "prospectr", "protViz", "pryr", "psd", "psgp", "purrr", "pvar", 
            "QRM", "quadrupen", "quanteda", "quantspec", "qVarSel", "rags2ridges", 
            "randomUniformForest", "ranger", "Rankcluster", "rankdist", "rARPACK", 
            "raster", "Rblpapi", "Rborist", "Rclusterpp", "RcppAnnoy", "RcppAPT", 
            "RcppArmadillo", "RcppBDT", "rcppbugs", "RcppClassic", "RcppClassicExamples", 
            "RcppCNPy", "RcppDE", "RcppDL", "RcppEigen", "RcppExamples", 
            "RcppFaddeeva", "RcppGSL", "RcppMLPACK", "RcppOctave", "RcppProgress", 
            "RcppRedis", "RcppRoll", "RcppShark", "RcppSMC", "RcppStreams", 
            "RcppTOML", "RcppXts", "RcppZiggurat", "readr", "readstata13", 
            "readxl", "RealVAMS", "reconstructr", "recosystem", "redist", 
            "relSim", "remote", "ReorderCluster", "resemble", "reshape2", 
            "revealedPrefs", "rexpokit", "rforensicbatwing", "rgam", "rgeolocate", 
            "RInside", "Rip46", "ripa", "rivr", "rkvo", "Rlibeemd", "RLRsim", 
            "Rmalschains", "rmgarch", "Rmixmod", "RmixmodCombi", "rncl", 
            "RNiftyReg", "robustgam", "robustHD", "robustreg", "rococo", 
            "rollply", "rotations", "RoughSets", "roxygen2", "rpf", "rpg", 
            "Rphylopars", "rplexos", "rPref", "RProtoBuf", "RQuantLib", "RSNNS", 
            "RSNPset", "RSofia", "Rsomoclu", "rstan", "RStoolbox", "rstpm2", 
            "rtkpp", "Rtsne", "Ruchardet", "rugarch", "Rvcg", "RVowpalWabbit", 
            "rwirelesscom", "satellite", "saturnin", "sbmSDP", "SBSA", "scales", 
            "scrm", "scrypt", "sdcMicro", "sdcTable", "SEERaBomb", "segmag", 
            "seismicRoll", "SelvarMix", "sequences", "sgd", "sglOptim", "signalHsmm", 
            "simFrame", "simPop", "SimReg", "sirt", "slfm", "SLOPE", "snipEM", 
            "snplist", "SocialNetworks", "SOD", "spacodiR", "spaMM", "SparseFactorAnalysis", 
            "sparseHessianFD", "sparseLTSEigen", "sparsereg", "spatgraphs", 
            "SpatialEpi", "SpatialTools", "SpatPCA", "spBayesSurv", "spduration", 
            "spsann", "starma", "StatMethRank", "staTools", "StereoMorph", 
            "stm", "StMoSim", "stochvol", "stocks", "stosim", "strataG", 
            "stream", "strum", "survAccuracyMeasures", "surveillance", "survSNP", 
            "SVMMatch", "synlik", "systemicrisk", "tagcloud", "TAM", "TAQMNGR", 
            "TauStar", "tbart", "tcR", "TDA", "TED", "termstrc", "TESS", 
            "textreg", "textreuse", "TFMPvalue", "tidyr", "timma", "TMB", 
            "tmg", "tmlenet", "tnam", "treeclim", "treescape", "trustOptim", 
            "tvd", "unmarked", "urltools", "V8", "VarSelLCM", "VideoComparison", 
            "VIM", "waffect", "walkr", "webreadr", "wingui", "wordcloud", 
            "wsrf", "XBRL", "xml2", "yakmoR", "zic")

allPkg <- c(allPkg, skippedPkgs)
checkPkg <- c(goodPkgs, badPkg, skippedPkgs)
stopifnot(length(setdiff(checkPkg, allPkg))==0)
stopifnot(length(setdiff(allPkg, checkPkg))==0)



