
## started with Rcpp (current on GitHub, as well as RcppArmadillo and RcppEigen)

## loads 'res'
load("~/svn/rcpp/testlogs/result-20140112-230103.RData")

## g
## good <- as.character(subset(res, res==0)[,1])
## dput(good)

goodPkgAsIs <- c("accelerometry", "acer", "AdaptiveSparsity", "ALKr",
                 "BayesComm", "bcp", "bcpa", "bfa", "bfp", "bifactorial", "bilan",
                 "ccaPP", "cda", "cladoRcpp", "clogitL1", "clusteval", "ClustVarLV",
                 "ConConPiWiFun", "coneproj", "Delaporte", "ecp", "EpiContactTrace",
                 "fastGHQuad", "FastPCS", "FastRCS", "FBFsearch", "forecast", "fugeR",
                 "geoCount", "growcurves", "GSE", "GxM", "hawkes", "hsphase", "jaatha",
                 "Kmisc", "LaF", "minqa", "MPTinR", "msgl", "MVB", "NetSim", "oem", "PedCNV",
                 "phylobase", "planar", "PReMiuM", "prospectr", "psgp", "Rankcluster",
                 "Rclusterpp", "RcppArmadillo", "RcppBDT", "rcppbugs",
                 "RcppClassicExamples", "RcppCNPy", "RcppDE", "RcppExamples", "RcppGSL",
                 "RcppOctave", "RcppProgress", "RcppRoll", "RcppSMC", "RcppXts",
                 "rexpokit", "rforensicbatwing", "RInside", "Rmalschains", "RMessenger",
                 "robustgam", "robustHD", "rococo", "RSNNS", "RSofia", "RVowpalWabbit",
                 "sdcMicro", "sequences", "simFrame", "sparseHessianFD", "sparseLTSEigen",
                 "stochvol", "survSNP", "termstrc", "trustOptim", "tvm", "unmarked",
                 "VIM", "waffect", "WideLm", "XBRL", "zic") 
 
## bad <- as.character(subset(res, res==1)[,1])
## dput(bad)
badPkg <- c("ALDqr", "Amelia", "apcluster", "CARBayes", "CDM", "classify", 
            "climdex.pcic", "dils", "disclapmix", "diversitree", "fdaMixed", 
            "geiger", "GeneticTools", "gMWT", "GOsummaries", "gRbase", 
            "gRim", "HLMdiag", "httpuv", "hypervolume", "inarmix", 
            "IsingSampler", "KernSmoothIRT", "kmc", "lm.br", "lme4", 
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
                 "geiger",		# ‘msm’ ‘subplex’ ‘deSolve’ ‘coda’ ‘ncbit’
                 "GeneticTools",	# ‘gMWT’ ‘snpStats’
                 "gMWT",		# ‘clinfun’
                 "GOsummaries",		# ‘gProfileR’ ‘limma’
                 "hypervolume",		# raster, maps
                 "kmc",			# ‘rootSolve’ ‘emplik’
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
                 "tbart",               # ‘GISTools’
                 "VideoComparison",	# ‘pracma’
                 "VIMGUI")		# VIM, survey


## Failing at compile time
bad4RcppAPI <- c("ndl",                 # error: ambiguous overload for ‘operator=’
                 "Rmixmod",             # overloaded ‘S4_Impl(Rcpp::SlotProxyPolicy<Rcpp::S4_Impl<Rcpp::PreserveStorage> >::SlotProxy)’ is ambiguous
                 "RProtoBuf",           # [rel 0.4.0] still: error: ‘setSEXP’ was not declared in this scope
                 "wsrf")                # error: call of overloaded ‘Vector(Rcpp::Vector<19>::const_Proxy)’ is ambiguous



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
                    "protvix", 		# works with proper Import
                    "RcppEigen",        # [next version] after user fix for 'SHLIB.maker' 
                    "RcppZiggurat",     # works with proper Import
                    "rgam",             # works with proper Import
                    "rotations",        # works with proper Import
                    "RQuantLib",	# [next version] with 'importFrom(Rcpp, evalCpp)'
                    "Ruchardet",	# works with proper Import
                    "SBSA",		# works with proper Import
                    "SpatialTools")	# works with proper Import

goodWithUserChange <- c("httpuv", 	# include <Rcpp.h> -- not Rcpp/exceptions.h
                        "RcppClassic", 	# need to hide 'Rcpp::internal::getPosixClasses()’
                        "rmgarch",      # header file order: incl. only RcppArmadillo
                        "rugarch")      # header file order: incl. only RcppArmadillo


#bad4rcpp <- c()				# Yay!

## these fail initially but can all be run with some extra effort
bad4notrcpp <-   c("KernSmoothIRT")	# rgl failed, needs full x11 session
                            
good <- length(goodPkgAsIs) + length(goodWithImport) + length(goodWithUserChange)
bad  <- (length(bad4missing) + length(bad4RcppAPI) + 
         length(bad4unclear) + length(bad4notrcpp))

#stopifnot(all.equal(bad,length(badPkg)))  ## account for GeoBIO

cat("Good        ", good, "\n")
cat("  AsIs      ", length(goodPkgAsIs), "\n")
cat("  w/Imports ", length(goodWithImport), "\n")
cat("  w/Change  ", length(goodWithUserChange), "\n")
cat("Bad         ", bad, "\n")
cat("  MissDep   ", length(bad4missing), "\n")
cat("  RcppApi   ", length(bad4RcppAPI), "\n")
cat("  Unclear   ", length(bad4unclear), "\n")
cat("  NotRcpp   ", length(bad4notrcpp), "\n")
cat("Total       ", good + bad, "\n")
cat("Error Pct   ", (bad-length(bad4missing)) / (good + bad), "\n")



