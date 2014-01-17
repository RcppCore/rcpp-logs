
goodPkg <- c("acer", "ALKr", "Amelia", "apcluster", "bcp", "bfa",
             "bfp", "bifactorial", "blockcluster", "ccaPP", "cda",
             "clusteval", "ConConPiWiFun", "ecp", "fastGHQuad",
             "fdaMixed", "forecast", "gof", "growcurves", "GUTS",
             "KernSmoothIRT", "Kmisc", "LaF", "minqa", "mMRMe",
             "multmod", "mvabund", "MVB", "NetworkAnalysis", "oem",
             "openair", "parser", "phom", "phylobase", "planar",
             "psgp", "quadrupen", "Rchemcpp", "Rclusterpp",
             "RcppArmadillo", "RcppBDT", "rcppbugs", "RcppClassic",
             "RcppClassicExamples", "RcppCNPy", "RcppDE", "RcppEigen",
             "RcppExamples", "RcppGSL", "RcppOctave", "RcppRoll",
             "RcppSMC", "RcppXts", "rexpokit", "rforensicbatwing",
             "rgam", "RInside", "Rmalchains", "Rmessenger", "Rmixmod",
             "robustgam", "robustHD", "rococo", "RProtoBuf",
             "RQuantLib", "RSNNS", "RSofia", "rugarch",
             "RVowpalWabbit", "SBSA", "sdcMicro", "simFrame",
             "sparseHessianFD", "sparseLTSEigen", "SpatialTools",
             "stochvol", "survSNP", "termstrc", "tmg", "transmission",
             "transnet", "trustOptim", "unmarked", "waffect",
             "wordcloud", "zic" )

badPkg <- c("auteur", "classify", "ExactNumCI", "EpiContactTrace",
            "fugeR", "GeneticTools", "gMWT", "gRbase", "gRim",
            "HLMdiag", "httpuv", "jaatha", "marked", "maxent", "mets",
            "mirt", "ngspatial", "orQA", "PReMiuM", "sdcTable",
            "spacodir", "stream", "surveillance", "VIM", "WideLM" )

bad4missing <- c("auteur", 		# geiger
                 "classify",		# R2WinBugs, R2jags
                 "EpiContactTrace",	# ‘igraph0’ ‘R2HTML’
                 "fugeR",		# snowfall
                 "GeneticTools",	# ‘gMWT’ ‘snpStats’
                 "gMWT",		# clinfun
                 "gRbase",		# fastmatch RBGL
                 "gRim",		# ‘gRbase’ ‘gRain’ ‘doBy’
                 "HLMdiag",		# 'mlmRev'
                 "jaatha",		# ‘phyclust’
                 "marked",		# ‘optimx’ ‘R2admb’
                 "maxent",		# tm
                 "mets",		# ‘lava’ ‘timereg’ ‘prodlim’
                 "mirt",		# ‘psych’ ‘GPArotation’
                 "ngspatial",		# ‘batchmeans’
                 "orQA",		# ‘genefilter’
                 "PReMiuM", 		# clue
                 "sdcTable",		# lpSolveAPI
                 "spacodir",		# picante
                 "stream",		# ‘proxy’ ‘clusterGeneration’ ‘fpc’ ‘birch’ ‘clue’ ‘mlbench’
                 "surveillance",	# spatstat
                 "VIM",			# vcd
                 "WideLM"		# CUDA needs gcc/g++ 4.5 set as CC
                 )

bad4error <- c("ExactNumCI",		# needs BOOSTLIB defined, bad src/ file
               "httpuv")                # C++ mixup


cat("Good      ", length(goodPkg), "\n")
cat("Bad       ", length(badPkg), "\n")
cat("  MissDep ", length(bad4missing), "\n")
cat("  Errors  ", length(bad4error), "\n")
cat("Total     ", length(goodPkg)+length(badPkg), "\n")
cat("Error Pct ", length(bad4error)/(length(bad4error)+length(goodPkg)), "\n")
