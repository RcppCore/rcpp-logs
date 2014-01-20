
## -- started with Rcpp (current on GitHub as of 2-14-Jan-12,
##    as well as current RcppArmadillo and RcppEigen)
## -- updated throughout the week, see github commit log

## loads 'res'
load("~/svn/rcpp/testlogs/result-20140112-230103.RData")

## good <- as.character(subset(res, res==0)[,1])
## dput(good)

goodPkgAsIs <- c("accelerometry", "acer", "AdaptiveSparsity", "ALKr",
                 "BayesComm", "bcp", "bcpa", "bfa", "bfp", "blockcluster",
                 "bifactorial", "bilan", "ccaPP", "cda", "cladoRcpp", "climdex.pcic",
                 "clogitL1", "clusteval", "ClustVarLV", "ConConPiWiFun", "coneproj",
                 "Delaporte", "disclapmix", "ecp", "EpiContactTrace", "fastGHQuad",
                 "FastPCS", "FastRCS", "FBFsearch", "forecast", "fugeR",
                 "Funclustering", "geoCount", "growcurves", "GSE", "gMWT", "GxM",
                 "hawkes", "hsphase", "IBHM", "jaatha", "Kmisc", "LaF", "marked",
                 "minqa", "mirt", "miscF", "MPTinR", "msgl", "MVB", "ndl", "NetSim",
                 "ngspatial", "oem", "PedCNV", "phylobase", "planar", "PReMiuM",
                 "pROC", "prospectr", "psgp", "Rankcluster", "rARPACK", "Rclusterpp",
                 "RcppArmadillo", "RcppBDT", "rcppbugs", "RcppClassicExamples",
                 "RcppCNPy", "RcppDE", "RcppExamples", "RcppGSL", "RcppOctave",
                 "RcppProgress", "RcppRoll", "RcppSMC", "RcppXts", "rexpokit",
                 "rforensicbatwing", "RInside", "Rmalschains", "RMessenger",
                 "robustgam", "robustHD", "rococo", "RSNNS", "RSofia", "RVowpalWabbit",
                 "sdcMicro", "sdcTable", "sequences", "simFrame", "spacodiR", "sparseHessianFD",
                 "sparseLTSEigen", "stochvol", "survSNP", "TAQMNGR", "termstrc",
                 "trustOptim", "tvm", "unmarked", "VIM", "waffect", "WideLm", "XBRL",
                 "zic")

## bad <- as.character(subset(res, res==1)[,1])
## dput(bad)
badPkg <- c("ALDqr", "Amelia", "apcluster", "CARBayes", "CDM", "classify", 
            "climdex.pcic", "dils", "disclapmix", "diversitree", "fdaMixed", 
            "geiger", "GeneticTools", "gMWT", "GOsummaries", "gRbase", 
            "gRim", "HLMdiag", "httpuv", "hypervolume", "inarmix", 
            "IsingSampler", "KernSmoothIRT", "kmc", "lm.br", "lme4", 
            "maxent", "mets", "mirt", "miscF", "mvabund", 
            "ngspatial", "orQA", "pROC", "protViz", "RcppClassic", 
            "RcppEigen", "RcppZiggurat", "rgam", "rmgarch", "Rmixmod", "rotations", 
            "RProtoBuf", "RQuantLib", "Ruchardet", "rugarch", "SBSA", 
            "sglOptim", "sirt", "snplist", "spacodiR", "SpatialTools", "strum", 
            "surveillance", "TAM", "tbart", "VideoComparison", "WideLM", 
            "wordcloud", "wsrf")

bad4missing <- c("CARBayes",		# ‘deldir’ ‘maptools’ ‘shapefiles’ ‘spdep’
                 "CDM",			# ‘psych’ ‘polycor’
                 "classify",		# ‘R2WinBUGS’ ‘R2jags’
                 "diversitree",		# ‘deSolve’ ‘subplex’
                 "geiger",		# ‘msm’ ‘subplex’ ‘deSolve’ ‘coda’ ‘ncbit’
                 "GeneticTools",	# ‘gMWT’ ‘snpStats’
                 "GOsummaries",		# ‘gProfileR’ ‘limma’
                 "hypervolume",		# raster, maps
                 "kmc",			# ‘rootSolve’ ‘emplik’
                 "mets",		# ‘lava’ ‘timereg’ 
                 "orQA",		# ‘genefilter’ [from BioC]
                 "sirt",		# ‘gregmisc’ ‘sfsmisc’ ‘TAM’ ‘CDM’ ‘ic.infer’ ‘psych’ ‘pbivnorm’
                 "snplist",		#" 'biomaRt' [from BioC]
                 "strum",		# 'pedigree'
                 "surveillance",	# ‘polyCub’ ‘spatstat’
                 "TAM",			# ‘tensor’ ‘sfsmisc’ ‘GPArotation’ ‘psych’
                 "tbart",               # ‘GISTools’
                 "VideoComparison",	# ‘pracma’
                 "VIMGUI")		# VIM, survey


## Failing at compile time
bad4RcppAPI <- c()


bad4unclear <- c("maxent",              # passes iff maxent.Rd's example gets \dontrun{}
                 "sglOptim",            # error crit. changed, passes with 1.0e-7 (was 1.0e-10)
                 "wordcloud")		# passes iff 'tm' not used in examples


goodWithImport <- c("Amelia",		# works with proper Import
                    "apcluster", 	# works with proper Import
                    "fdaMixed",  	# works with proper Import
                    "gRbase",   	# works with proper Import
                    "gRim",  		# works with proper Import
                    "HLMdiag",  	# works with proper Import
                    "inarmix",  	# works with proper Import
                    "IsingSampler", 	# works with proper Import
                    "lme4",		# works with proper Import
                    "mvabund",		# works with proper Import
                    "openair",		# works with proper Import                    
                    "protvix", 		# works with proper Import
                    "RcppEigen",        # [next version] after user fix for 'SHLIB.maker' 
                    "RcppZiggurat",     # works with proper Import
                    "rgam",             # works with proper Import
                    "rotations",        # works with proper Import
                    "Rmixmod",          # works with proper Import (and newest Rcpp)
                    "RQuantLib",	# [next version] with 'importFrom(Rcpp, evalCpp)'
                    "Ruchardet",	# works with proper Import
                    "SBSA",		# works with proper Import
                    "SpatialTools",	# works with proper Import
                    "strum", 		# works with proper Import
                    "wsrf")             # works with proper Import


goodWithUserChange <- c("dplyr",		# see Rcpp issue #99
                        "httpuv", 	# include <Rcpp.h> -- not Rcpp/exceptions.h
                        "RcppClassic", 	# need to hide 'Rcpp::internal::getPosixClasses()’
                        "rmgarch",      # header file order: incl. only RcppArmadillo
                        "RProtoBuf",    # rel 0.4.0 with S4 accomodation
                        "rugarch")      # header file order: incl. only RcppArmadillo


#bad4rcpp <- c()				# Yay!

## these fail initially but can all be run with some extra effort
bad4notrcpp <-   c("ALDqr",		# needs \dontrun{} in example, comment alone useless
                   "KernSmoothIRT")	# rgl failed, needs full x11 session
                            
good <- length(goodPkgAsIs) + length(goodWithImport) + length(goodWithUserChange)
badrcpp <- length(bad4RcppAPI) + length(bad4unclear)
badother <- length(bad4missing) + length(bad4notrcpp)
bad <- badrcpp + badother

#stopifnot(all.equal(bad,length(badPkg)))  ## account for GeoBIO

cat("Good         ", good, "\n")
cat("  AsIs       ", length(goodPkgAsIs), "\n")
cat("  w/Imports  ", length(goodWithImport), "\n")
cat("  w/Change   ", length(goodWithUserChange), "\n")
cat("Bad Rcpp     ", badrcpp, "\n")
cat("  RcppApi    ", length(bad4RcppAPI), "\n")
cat("  Unclear    ", length(bad4unclear), "\n")
cat("Bad other    ", badother, "\n")
cat("  MissDep    ", length(bad4missing), "\n")
cat("  NotRcpp    ", length(bad4notrcpp), "\n")
cat("Total        ", good + bad, "\n")
cat("Bad Rcpp Pct ", badrcpp / (good + bad), "\n")



