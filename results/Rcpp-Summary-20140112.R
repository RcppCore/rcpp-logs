
## started with Rcpp (current on GitHub, as well as RcppArmadillo and RcppEigen)

## loads 'res'
load("~/svn/rcpp/testlogs/result-20140112-230103.RData")

## g
## good <- as.character(subset(res, res==0)[,1])
## dput(good)
goodPkg <- c("accelerometry", "acer", "AdaptiveSparsity", "ALKr", "BayesComm", 
             "bcp", "bcpa", "bfa", "bfp", "bifactorial", "bilan", "ccaPP", 
             "cda", "cladoRcpp", "clogitL1", "clusteval", "ClustVarLV", "ConConPiWiFun", 
             "coneproj", "Delaporte", "ecp", "EpiContactTrace", "fastGHQuad", 
             "FastPCS", "FastRCS", "FBFsearch", "forecast", "geoCount", "growcurves", 
             "GSE", "GxM", "hawkes", "jaatha", "Kmisc", "minqa", "MPTinR", 
             "msgl", "MVB", "NetSim", "oem", "PedCNV", "phylobase", "planar", 
             "PReMiuM", "prospectr", "psgp", "Rankcluster", "Rclusterpp", 
             "RcppArmadillo", "RcppBDT", "rcppbugs", "RcppClassicExamples", 
             "RcppCNPy", "RcppDE", "RcppExamples", "RcppGSL", "RcppOctave", 
             "RcppProgress", "RcppRoll", "RcppSMC", "RcppXts", "rexpokit", 
             "rforensicbatwing", "RInside", "Rmalschains", "RMessenger", "robustgam", 
             "robustHD", "rococo", "RSNNS", "RSofia", "RVowpalWabbit", "sdcMicro", 
             "sequences", "simFrame", "sparseHessianFD", "sparseLTSEigen", 
             "stochvol", "survSNP", "termstrc", "trustOptim", "tvm", "unmarked", 
             "VIM", "waffect", "WideLm", "XBRL", "zic")
 

## bad <- as.character(subset(res, res==1)[,1])
## dput(bad)
badPkg <- c("ALDqr", "Amelia", "apcluster", "CARBayes", "CDM", "classify", 
            "climdex.pcic", "dils", "disclapmix", "diversitree", "fdaMixed", 
            "fugeR", "geiger", "GeneticTools", "gMWT", "GOsummaries", "gRbase", 
            "gRim", "HLMdiag", "hsphase", "httpuv", "hypervolume", "inarmix", 
            "IsingSampler", "KernSmoothIRT", "kmc", "LaF", "lm.br", "lme4", 
            "marked", "maxent", "mets", "mirt", "miscF", "mvabund", "ndl", 
            "ngspatial", "openair", "orQA", "pROC", "protViz", "RcppClassic", 
            "RcppEigen", "RcppZiggurat", "rgam", "rmgarch", "Rmixmod", "rotations", 
            "RProtoBuf", "RQuantLib", "Ruchardet", "rugarch", "SBSA", "sdcTable", 
            "sglOptim", "sirt", "snplist", "spacodiR", "SpatialTools", "strum", 
            "surveillance", "TAM", "tbart", "VideoComparison", "WideLM", 
            "wordcloud", "wsrf")

bad4missing <- c("ALDqr",		# 'HyperbolicDist’
                 "CARBayes",		# ‘deldir’ ‘maptools’ ‘shapefiles’ ‘spdep’
                 "CDM",			# ‘psych’ ‘polycor’
                 "classify",		# ‘R2WinBUGS’ ‘R2jags’
		 "climdex.pcic",	# 'PCIct'
                 "disclapmix",		# disclap
                 "diversitree",		# ‘deSolve’ ‘subplex’
                 "fugeR",		# snowfall
                 "geiger",		# ‘msm’ ‘subplex’ ‘deSolve’ ‘coda’ ‘ncbit’
                 "GeneticTools",	# ‘gMWT’ ‘snpStats’
                 "gMWT",		# ‘clinfun’
                 "GOsummaries",		# ‘gProfileR’ ‘limma’
                 "hsphase",		# snowfall
                 "hypervolume",		# raster, maps
                 "kmc",			# ‘rootSolve’ ‘emplik’
                 "LaF",			# 'yaml'
                 "marked",		# ‘R2admb’
                 "mets",		# ‘lava’ ‘timereg’ 
                 "mirt",		# ‘GPArotation’
                 "miscF",		# ‘MCMCpack’
                 "ngspatial",		# ‘batchmeans’
                 "openair",		# ‘latticeExtra’
                 "orQA",		# ‘genefilter’
                 "pROC",		# 'logcondens'
                 "sdcTable",		# ‘lpSolveAPI’
                 "sirt",		# ‘gregmisc’ ‘sfsmisc’ ‘TAM’ ‘CDM’ ‘ic.infer’ ‘psych’ ‘pbivnorm’
                 "snplist",		#" 'biomaRt'
                 "spacodiR",		# ‘picante’
                 "strum",		# 'pedigree'
                 "surveillance",	# ‘polyCub’ ‘spatstat’
                 "TAM",			# ‘tensor’ ‘sfsmisc’ ‘GPArotation’ ‘psych’
                 "VideoComparison",	# ‘pracma’

                 "VIMGUI")		# VIM, survey

## Failing at compile-time
## error: ‘set_sexp’ is not a member of
## ‘Rcpp::Matrix<14>::VECTOR {aka Rcpp::Vector<14, Rcpp::PreserveStorage>}’
bad4set_sexp <- c("Amelia", "apcluster", "inarmix", "IsingSampler", "rotations")

## Failing at compile time
bad4otherAPI <- c("httpuv",             # (Rcpp/exceptions.h:33:56: error: ‘stack_trace’ was not declared in this scope
                  "RcppClassic", 	# redefinition of 'Rcpp::internal::getPosixClasses()’
                  "Rmixmod",            # overloaded ‘S4_Impl(Rcpp::SlotProxyPolicy<Rcpp::S4_Impl<Rcpp::PreserveStorage> >::SlotProxy)’ is ambiguous
                  "RProtoBuf",          # 'S4_classes.h:37:25: error: ‘setSEXP’ was not declared in this scope'
                  "tbart",              # tb.cpp:13:24: error: ‘stop’ is not a member of ‘Rcpp’
                  "wsrf")               # error: call of overloaded ‘Vector(Rcpp::Vector<19>::const_Proxy)’ is ambiguous

## Failing at run-time                  
##   function 'dataptr' not provided by package 'Rcpp'
bad4dataptr <- c("fdaMixed", "gRbase", "gRim", "HLMdiag", "lme4",
                 "mvabund",             # after 'LinkingTo: Rcpp' added
                 "RcppEigen",           # after user fix for 'SHLIB.maker' 
                 "RQuantLib",	        # even after making other changes to new version
                 "SpatialTools")

## Failing at run-time
## function 'enterRNGScope' not provided by package 'Rcpp'                 
bad4rngscore <- c("RcppZiggurat", "rgam", "Ruchardet", "SBSA")


## Failing at run-time
## Error: function 'reset_current_error' not provided by package 'Rcpp'
bad4resetcurrerr <- c("protvix")	# after setting LinkingTo:


bad4unclear <- c("maxent",              # weird segfault
                 "ndl",                 # unclear compile error
                 "sglOptim",            # unclear run-time error
                 "wordcloud")		# unclear run-time error

bad4maybeuser <- c("rmgarch",           # ‘trunc’ is not a member of ‘std::ios_base’
                   "rugarch")           # ‘trunc’ is not a member of ‘std::ios_base’
                   
#bad4rcpp <- c()				# Yay!

## these fail initially but can all be run with some extra effort
bad4notrcpp <-   c("KernSmoothIRT")	# rgl failed, needs full x11 session
                   
good <- length(goodPkg)
bad  <- (length(bad4missing) + length(bad4set_sexp) +
         length(bad4otherAPI) + length(bad4dataptr) +
         length(bad4rngscore) + length(bad4unclear) +
         length(bad4maybeuser) + length(bad4resetcurrerr) +
         length(bad4notrcpp))

#stopifnot(all.equal(bad,length(badPkg)))  ## account for GeoBIO

cat("Good        ", good, "\n")
cat("Bad         ", bad, "\n")
#cat("  RcppErr  ", length(bad4rcpp), "\n")
cat("  MissDep   ", length(bad4missing), "\n")
cat("  SetSexp   ", length(bad4set_sexp), "\n")
cat("  Other     ", length(bad4otherAPI), "\n")
cat("  Dataptr   ", length(bad4dataptr), "\n")
cat("  Rngscore  ", length(bad4rngscore), "\n")
cat("  ResetCErr ", length(bad4resetcurrerr), "\n")
cat("  Unclear   ", length(bad4unclear), "\n")
cat("  MaybeUser ", length(bad4maybeuser), "\n") 
cat("  NotRcpp   ", length(bad4notrcpp), "\n")
cat("Total       ", good + bad, "\n")
cat("Error Pct   ", (bad-length(bad4missing)) / (good + bad), "\n")



