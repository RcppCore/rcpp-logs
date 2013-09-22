
## results here are edited after a second run following manual
## installation of a number of package missing in the first run

goodPkg <- c("acer", "ALKr", "Amelia", "apcluster", "BayesComm",
             "bcp", "bfa", "bfp", "bifactorial", "blockcluster",
             "ccaPP", "cda", "cladoRcpp", "clogitL1", "clusteval",
             "ConConPiWiFun", "Delaporte", "ecp", "fastGHQuad",
             "FBFsearch", "forecast", "gRbase", "gRim", "growcurves",
             "GSE", "GUTS", "httpuv", "jaatha", "Kmisc", "maxent",
             "minqa", "MPTinR", "msgl", "multmod", "mvabund", "MVB",
             "NetworkAnalysis", "oem", "phom", "phylobase", "planar",
             "psgp", "RcppArmadillo", "RcppBDT", "rcppbugs",
             "RcppClassic", "RcppClassicExamples", "RcppCNPy",
             "RcppDE", "RcppEigen", "RcppExamples", "RcppGSL",
             "RcppOctave", "RcppProgress", "RcppRoll", "RcppSMC",
             "RcppXts", "rexpokit", "rforensicbatwing", "rgam",
             "RInside", "Rmalschains", "RMessenger", "rmgarch",
             "Rmixmod", "robustgam", "robustHD", "rococo",
             "RProtoBuf", "RQuantLib", "RSNNS", "RSofia", "rugarch",
             "RVowpalWabbit", "SBSA", "sdcMicro", "sequences",
             "simFrame", "sparseHessianFD", "sparseLTSEigen",
             "SpatialTools", "stochvol", "survSNP", "tagcloud",
             "termstrc", "tmg", "transmission", "trustOptim",
             "unmarked", "waffect", "WideLM", "wordcloud")

badPkg <- c("ALDqr", "classify", "diversitree", "EpiContactTrace",
            "ExactNumCI", "FastPCS", "fdaMixed", "fugeR", "geiger",
            "GeneticTools", "gMWT", "GOsummaries", "HLMdiag", "LaF",
            "marked", "mets", "mirt", "miscF", "ngspatial", "openair",
            "orQA", "PReMiuM", "quadrupen", "sdcTable", "sirt",
            "spacodiR", "stream", "surveillance", "tbart", "transnet",
            "VIM")

bad4missing <- c("ALDqr",		# 'HyperbolicDist’ ‘sn’
                 "classify",		# ‘R2WinBUGS’ ‘R2jags’
                 "diversitree",		# ‘deSolve’ ‘subplex’
                 "EpiContactTrace", 	# ‘igraph0’
                 "FastPCS",		# ‘matrixStats’
                 "fugeR",		# snowfall
                 "geiger",		# ‘msm’ ‘subplex’ ‘deSolve’ ‘coda’ ‘ncbit’
                 "GeneticTools",	# ‘gMWT’ ‘snpStats’
                 "gMWT",		# ‘clinfun’
                 "GOsummaries",		# ‘gProfileR’ ‘limma’
                 "HLMdiag",		# ‘mlmRev’
                 "LaF",			# 'yaml'
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
                 "stream",		# ‘proxy’ ‘rJava’ ‘clusterGeneration’ ‘fpc’ ‘birch’ ‘clue’ ‘mlbench’
                 "surveillance",	# ‘spatstat’
                 "tbart",		# ‘GISTools’
                 "transnet",		# ‘rJava’
                 "VIM")			# ‘vcd’

## these fail initially but can all be run with some extra effort
bad4fixable <- c("ExactNumCI",		# needs BOOSTLIB defined, bad src/ file
                 "fdaMixed",		# no x11() device, need xvfb-run wrapper
                 "KernSmoothIRT")	# rgl failed, needs full x11 session

bad4error <- c("quadrupen")		# killed after fscking six hours of cross-validation (??)

cat("Good       ", length(goodPkg), "\n")
cat("Bad        ", length(bad4missing)+length(bad4fixable)+length(bad4error), "\n")
cat("  MissDep  ", length(bad4missing), "\n")
cat("  Fixabled ", length(bad4fixable), "\n")
cat("  Borked   ", length(bad4error), "\n")
cat("Total      ", length(goodPkg)+length(bad4missing)+length(bad4fixable)+length(bad4error), "\n")
cat("Error Pct  ", length(bad4error)/(length(bad4error)+length(bad4fixable)+length(goodPkg)), "\n")
