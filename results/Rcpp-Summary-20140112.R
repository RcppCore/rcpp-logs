 
## -- started with Rcpp (current on GitHub as of 2-14-Jan-12,
##    as well as current RcppArmadillo and RcppEigen)
## -- updated throughout the week, see github commit log

## loads 'res'
#load("~/git/rcpp-logs/results/result-20140112-230103.RData")

## good <- as.character(subset(res, res==0)[,1])
## dput(good)

goodPkgAsIs <- c("accelerometry", "acer", "AdaptiveSparsity", "ALKr", "apcluster",
                 "BayesComm", "bcp", "bcpa", "bfa", "bfp", "blockcluster",
                 "bifactorial", "bilan", "ccaPP", "cda", "cladoRcpp", "climdex.pcic",
                 "clogitL1", "clusteval", "ClustVarLV", "ConConPiWiFun", "coneproj",
                 "Delaporte", "disclapmix", "ecp", "EpiContactTrace", "fastGHQuad",
                 "FastPCS", "FastRCS", "FBFsearch", "forecast", "fugeR",
                 "Funclustering", "geoCount", "growcurves", "GSE", "gMWT", "GxM",
                 "hawkes", "hsphase", "HUM", "IBHM", "inarmix", "IsingSampler", "jaatha", "KernSmoothIRT",
                 "Kmisc", "LaF", "marked", "maxent", "mets", "minqa", "mirt", "miscF",
                 "MPTinR", "msgl", "mvabund", "MVB", "ndl", "NetSim", "ngspatial", "oem",
                 "PedCNV", "phylobase", "planar", "PReMiuM", "pROC", "prospectr", "protViz",
                 "psgp", "Rankcluster", "rARPACK", "Rclusterpp", "RcppArmadillo",
                 "RcppBDT", "rcppbugs", "RcppClassicExamples", "RcppCNPy", "RcppDE",
                 "RcppExamples", "RcppGSL", "RcppOctave", "RcppProgress", "RcppRoll",
                 "RcppSMC", "RcppXts", "rexpokit", "rforensicbatwing", "RInside",
                 "Rmalschains", "RMessenger", "robustgam", "robustHD", "rococo", "rotations", "Rmixmod",
                 "RProtoBuf", "RSNNS", "RSofia", "RVowpalWabbit", "sdcMicro", "sdcTable",
                 "sequences", "sglOptim", "simFrame", "spacodiR", "sparseHessianFD",
                 "sparseLTSEigen", "stochvol", "survSNP", "TAQMNGR", "termstrc",
                 "trustOptim", "tvm", "unmarked", "VideoComparison", "VIM", "VIMGUI",
                 "waffect", "wordcloud", "WideLm", "wsrf", "XBRL", "zic")

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
                 "orQA",		# ‘genefilter’ [from BioC]
                 "sirt",		# ‘gregmisc’ ‘sfsmisc’ ‘TAM’ ‘CDM’ ‘ic.infer’ ‘psych’ ‘pbivnorm’
                 "snplist",		#" 'biomaRt' [from BioC]
                 "surveillance",	# ‘polyCub’ ‘spatstat’
                 "TAM",			# ‘tensor’ ‘sfsmisc’ ‘GPArotation’ ‘psych’
                 "tbart")               # ‘GISTools’ (and maptools, geos)


## Failing at compile time
bad4RcppAPI <- c()


bad4unclear <- c()   

goodWithQuestion <- c("Amelia")		# works as is w. '--no-vignettes', but loops in vignette (?)

## For problems of this variety:
##     function 'dataptr' not provided by package 'Rcpp'
goodWithImport <- c("fdaMixed",  	# works with proper Import, see patch
                    "gRbase",   	# works with proper Import, see patch
                    "gRim",  		# works with proper Import, see patch
                    "HLMdiag",  	# works with proper Import, see patch
                    "lme4",		# works with proper Import, see patch
                    "openair",		# works with proper Import, see patch                    
                    "Rvcg",             # works with proper Import, see patch
                    "rgam",             # works with proper Import, see patch
                    "Ruchardet",	# works with proper Import, see patch
                    "SBSA",		# works with proper Import, see patch
                    "SpatialTools",	# works with proper Import, see patch
                    "strum") 		# works with proper Import, see patch



goodWithOtherChange <- c("dplyr",	# works with https://github.com/hadley/dplyr/pull/190, see Rcpp issue #99
                         "httpuv", 	# works with patch
                         "RcppClassic", # works with version in R-Forge repo
                         "RcppEigen",   # version in GitHub repo now passes
                         "RcppZiggurat",# version in GitHub repo now passes
                         "rmgarch",     # works with patch [which also adds importFrom()]
                         "RQuantLib",	# version in R-Forge repo now passes
                         "rugarch")     # works with patch [which also adds importFrom()]

#bad4rcpp <- c()				# Yay!

## these fail initially but can all be run with some extra effort
bad4notrcpp <-   c("ALDqr",		# needs \dontrun{} in example, comment alone useless
                   "roxygen2")		# loops forever in wgen running regression test
                   
good <- length(goodPkgAsIs) + length(goodWithQuestion) + length(goodWithImport) + length(goodWithOtherChange)
badrcpp <- length(bad4RcppAPI) + length(bad4unclear)
badother <- length(bad4missing) + length(bad4notrcpp)
bad <- badrcpp + badother

#stopifnot(all.equal(bad,length(badPkg)))  ## account for GeoBIO

cat("Good         ", good, "\n")
cat("  AsIs       ", length(goodPkgAsIs), "\n")
cat("  w/Imports  ", length(goodWithImport), "\n")
cat("  w/Other    ", length(goodWithOtherChange), "\n")
cat("  w/Question ", length(goodWithQuestion), "\n")
cat("Bad Rcpp     ", badrcpp, "\n")
cat("  RcppApi    ", length(bad4RcppAPI), "\n")
cat("  Unclear    ", length(bad4unclear), "\n")
cat("Bad other    ", badother, "\n")
cat("  MissDep    ", length(bad4missing), "\n")
cat("  NotRcpp    ", length(bad4notrcpp), "\n")
cat("Total        ", good + bad, "\n")
cat("Bad Rcpp Pct ", badrcpp / (good + bad), "\n")



