
## results here are edited after a second run following manual
## installation of a number of package missing in the first run


goodPkg <- c("accelerometry", "acer", "AdaptiveSparsity", "ALKr", "Amelia",
             "apcluster", "BayesComm", "bcp", "bfa", "bfp", "bifactorial",
             "blockcluster", "ccaPP", "clogitL1", "clusteval", "ConConPiWiFun",
             "coneproj", "Delaporte", "ecp", "EpiContactTrace", "fastGHQuad",
             "FastPCS", "FastRCS", "FBFsearch", "fdaMixed", "forecast", "gRbase",
             "gRim", "GSE", "GUTS", "httpuv", "inarmix", "jaatha", "Kmisc",
             "maxent", "minqa", "MPTinR", "msgl", "multmod", "mvabund", "MVB",
             "NetSim", "oem", "phom", "phylobase", "prospectr", "psgp", "Rankcluster",
             "RcppArmadillo", "RcppBDT", "rcppbugs", "RcppClassic", "RcppClassicExamples",
             "RcppDE", "RcppEigen", "RcppExamples", "RcppGSL", "RcppOctave",
             "RcppProgress", "RcppRoll", "RcppSMC", "RcppXts", "rexpokit",
             "rforensicbatwing", "rgam", "RInside", "Rmalschains", "RMessenger",
             "rmgarch", "Rmixmod", "robustgam", "robustHD", "rococo", "rotations",
             "RProtoBuf", "RQuantLib", "RSNNS", "RSofia", "rugarch", "RVowpalWabbit",
             "SBSA", "sdcMicro", "sequences", "simFrame", "sparseHessianFD",
             "sparseLTSEigen", "SpatialTools", "stochvol", "survSNP", "tagcloud",
             "termstrc", "tmg", "transmission", "trustOptim", "unmarked",
             "waffect", "WideLM", "wordcloud", "zic")


bad4missing <- c("ALDqr",		# 'HyperbolicDist’
                 "CDM",			# sirt, TAM
                 "classify",		# ‘R2WinBUGS’ ‘R2jags’
		 "climdex.pcic",	# 'PCIct'
                 "diversitree",		# ‘deSolve’ ‘subplex’
                 "EpiContactTrace", 	# ‘igraph0’
                 "FastPCS",		# ‘matrixStats’
                 "fugeR",		# snowfall
		 "Funclustering",	# fda
                 "geiger",		# ‘msm’ ‘subplex’ ‘deSolve’ ‘coda’ ‘ncbit’
                 "GeneticTools",	# ‘gMWT’ ‘snpStats’
                 "gMWT",		# ‘clinfun’
                 "GOsummaries",		# ‘gProfileR’ ‘limma’
                 "HLMdiag",		# ‘mlmRev’
                 "LaF",			# 'yaml'
                 "lme4",		# mlmRev
                 "marked",		# ‘optimx’ ‘coda’ ‘R2admb’
                 "mets",		# ‘lava’ ‘timereg’ ‘prodlim’
                 "mirt",		# ‘GPArotation’
                 "miscF",		# ‘MCMCpack’
                 "ngspatial",		# ‘batchmeans’
                 "openair",		# ‘latticeExtra’ ‘hexbin’ ‘RgoogleMaps’ ‘png’ ‘mapdata’
                 "orQA",		# ‘genefilter’
                 "PReMiuM",		# ‘clue’
                 "sdcTable",		# ‘lpSolveAPI’
                 "sirt",		# ‘pbivnorm’ ‘sfsmisc’
                 "spacodiR",		# ‘picante’
                 "surveillance",	# ‘spatstat’
                 "TAM",			# ‘tensor’ ‘sfsmisc’ ‘GPArotation’ ‘psych’
                 "tbart",		# ‘GISTools’
                 "VIM")			# ‘vcd’

bad4rcpp <- c("cda",			# Exporter.h
              "growcurves",		# sugar
              "planar",			# Exporter.h
              "RcppCNPy")		# Exporter.h

## these fail initially but can all be run with some extra effort
bad4notrcpp <-   c("ExactNumCI",	# needs BOOSTLIB defined, bad src/ file
                   "KernSmoothIRT",	# rgl failed, needs full x11 session
                   "NetworkAnalysis")	# igraph interaction?

good <- length(goodPkg)
bad  <- length(bad4missing) + length(bad4rcpp) + length(bad4notrcpp)

cat("Good       ", good, "\n")
cat("Bad        ", bad, "\n")
cat("  RcppErr  ", length(bad4rcpp), "\n")
cat("  MissDep  ", length(bad4missing), "\n")
cat("  NotRcpp  ", length(bad4notrcpp), "\n")
cat("Total      ", good + bad, "\n")
cat("Error Pct  ", length(bad4rcpp) / (good + bad), "\n")
