 
## -- started with Rcpp (current on GitHub as of 2-14-Jan-12,
##    as well as current RcppArmadillo and RcppEigen)
## -- updated throughout the week, see github commit log

## loads 'res'
#load("~/git/rcpp-logs/results/result-20140112-230103.RData")

## good <- as.character(subset(res, res==0)[,1])
## dput(good)

goodPkgAsIs <- c("accelerometry", "acer", "AdaptiveSparsity", "ALKr", "apcluster",
                 "BayesComm", "bcp", "bcpa", "bfa", "bfp", "blockcluster",
                 "bifactorial", "bilan", "CARBayes", "ccaPP", "cda", "cladoRcpp", "classify", "climdex.pcic",
                 "clogitL1", "clusteval", "ClustVarLV", "ConConPiWiFun", "coneproj",
                 "Delaporte", "dils", "disclapmix", "diversitree", "ecp", "EpiContactTrace", "fastGHQuad",
                 "FastPCS", "FastRCS", "FBFsearch", "forecast", "fugeR",
                 "Funclustering", "geiger", "geoCount", "growcurves", "GSE", "gMWT", "GxM",
                 "hawkes", "hsphase", "HUM", "hypervolume", "IBHM", "inarmix", "IsingSampler", "jaatha", "KernSmoothIRT",
                 "kmc", "Kmisc", "LaF", "lm.br", "marked", "maxent", "mets", "minqa", "mirt", "miscF",
                 "MPTinR", "msgl", "mvabund", "MVB", "ndl", "NetSim", "ngspatial", "oem",
                 "PedCNV", "phylobase", "planar", "PReMiuM", "pROC", "prospectr", "protViz",
                 "psgp", "Rankcluster", "rARPACK", "Rclusterpp", "RcppArmadillo",
                 "RcppBDT", "rcppbugs", "RcppClassic", "RcppClassicExamples", "RcppCNPy", "RcppDE", "RcppEigen", 
                 "RcppExamples", "RcppGSL", "RcppOctave", "RcppProgress", "RcppRoll",
                 "RcppSMC", "RcppXts", "RcppZiggurat", "rexpokit", "rforensicbatwing", "RInside",
                 "Rmalschains", "RMessenger", "rmgarch", "robustgam", "robustHD", "rococo", "rotations", "Rmixmod",
                 "RProtoBuf", "RSNNS", "RSofia", "RQuantLib", "rugarch", "RVowpalWabbit", "sdcMicro", "sdcTable",
                 "sequences", "sglOptim", "simFrame", "spacodiR", "sparseHessianFD",
                 "sparseLTSEigen", "SpatialTools", "stochvol", "surveillance", "survSNP", "TAQMNGR", "tbart", "termstrc",
                 "trustOptim", "tvm", "unmarked", "VideoComparison", "VIM", 
                 "waffect", "wordcloud", "WideLM", "wsrf", "XBRL", "zic")

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

bad4BioCdep <- c("GeneticTools",	# ‘snpStats’ [BioC ?]
                 "GOsummaries",		# ‘limma’ [BioC ?]
                 "orQA",		# ‘genefilter’ [from BioC]
                 "snplist")		#" 'biomaRt' [from BioC]


## Failing at compile time
bad4RcppAPI <- c()


bad4unclear <- c()   

goodWithQuestion <- c("Amelia")		# works as is w. '--no-vignettes', but loops in vignette -- upstream says likely them ("bad bootstrap")

## For problems of this variety:
##     function 'dataptr' not provided by package 'Rcpp'
goodWithImport <- c("CDM",		# works with proper Import, see patch
                    "fdaMixed",  	# works with proper Import, see patch
                    "gRbase",   	# works with proper Import, see patch
                    "gRim",  		# works with proper Import, see patch
                    "HLMdiag",  	# works with proper Import, see patch
                    "lme4",		# works with proper Import, see patch
                    "openair",		# works with proper Import, see patch                    
                    "Rvcg",             # works with proper Import, see patch
                    "rgam",             # works with proper Import, see patch
                    "Ruchardet",	# works with proper Import, see patch
                    "SBSA",		# works with proper Import, see patch
                    "sirt",		# works with proper Import, see patch
                    "strum", 		# works with proper Import, see patch
                    "TAM") 		# works with proper Import, see patch


goodWithOtherChange <- c("dplyr",	# works with https://github.com/hadley/dplyr/pull/190, see Rcpp issue #99
                         "httpuv") 	# works with patch

#bad4rcpp <- c()				# Yay!

## these fail initially but can all be run with some extra effort
bad4notrcpp <-   c(#"ALDqr",		# needs \dontrun{} in example, comment alone useless -- now off CRAN
                   "roxygen2")		# loops forever in wgen running regression test

bad4skipped <-   c("quadrupen")         # tests runs for hours, skipped


good <- length(goodPkgAsIs) + length(goodWithQuestion) + length(goodWithImport) + length(goodWithOtherChange)
badrcpp <- length(bad4RcppAPI) + length(bad4unclear)
badother <- length(bad4BioCdep) + length(bad4notrcpp) + length(bad4skipped)
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
cat("  BioCDep    ", length(bad4BioCdep), "\n")
cat("  NotRcpp    ", length(bad4notrcpp), "\n")
cat("  Skipped    ", length(bad4skipped), "\n")
cat("Total        ", good + bad, "\n")
cat("Bad Rcpp Pct ", badrcpp / (good + bad), "\n")


## Checking: packages as of Jan 25
allPkg <- c("accelerometry", "acer", "AdaptiveSparsity", #"ALDqr",
            "ALKr", "Amelia", "apcluster", "BayesComm", "bcp", "bcpa", "bfa", "bfp", 
            "bifactorial", "bilan", "blockcluster", "CARBayes", "ccaPP", 
            "cda", "CDM", "cladoRcpp", "classify", "climdex.pcic", "clogitL1", 
            "clusteval", "ClustVarLV", "ConConPiWiFun", "coneproj", "Delaporte", 
            "dils", "disclapmix", "diversitree", "dplyr", "ecp", "EpiContactTrace", 
            "fastGHQuad", "FastPCS", "FastRCS", "FBFsearch", "fdaMixed", 
            "forecast", "fugeR", "Funclustering", "geiger", "GeneticTools", 
            "geoCount", "gMWT", "GOsummaries", "gRbase", "gRim", "growcurves", 
            "GSE", "GxM", "hawkes", "HLMdiag", "hsphase", "httpuv", "HUM", 
            "hypervolume", "IBHM", "inarmix", "IsingSampler", "jaatha", "KernSmoothIRT", 
            "kmc", "Kmisc", "LaF", "lm.br", "lme4", "marked", "maxent", "mets", 
            "minqa", "mirt", "miscF", "MPTinR", "msgl", "mvabund", "MVB", 
            "ndl", "NetSim", "ngspatial", "oem", "openair", "orQA", "PedCNV", 
            "phylobase", "planar", "PReMiuM", "pROC", "prospectr", "protViz", 
            "psgp", "quadrupen", "Rankcluster", "rARPACK", "Rclusterpp", 
            "RcppArmadillo", "RcppBDT", "rcppbugs", "RcppClassic", "RcppClassicExamples", 
            "RcppCNPy", "RcppDE", "RcppEigen", "RcppExamples", "RcppGSL", 
            "RcppOctave", "RcppProgress", "RcppRoll", "RcppSMC", "RcppXts", 
            "RcppZiggurat", "rexpokit", "rforensicbatwing", "rgam", "RInside", 
            "Rmalschains", "RMessenger", "rmgarch", "Rmixmod", "robustgam", 
            "robustHD", "rococo", "rotations", "roxygen2", "RProtoBuf", "RQuantLib", 
            "RSNNS", "RSofia", "Ruchardet", "rugarch", "Rvcg", "RVowpalWabbit", 
            "SBSA", "sdcMicro", "sdcTable", "sequences", "sglOptim", "simFrame", 
            "sirt", "snplist", "spacodiR", "sparseHessianFD", "sparseLTSEigen", 
            "SpatialTools", "stochvol", "strum", "surveillance", "survSNP", 
            "TAM", "TAQMNGR", "tbart", "termstrc", "trustOptim", "tvm", "unmarked", 
            "VideoComparison", "VIM", "waffect", "WideLM", "wordcloud", "wsrf", 
            "XBRL", "zic")

checkPkg <- c(goodPkgAsIs, goodWithImport, goodWithOtherChange, goodWithQuestion, bad4BioCdep, bad4notrcpp, bad4skipped)
stopifnot(length(setdiff(checkPkg, allPkg))==0)
stopifnot(length(setdiff(allPkg, checkPkg))==0)



