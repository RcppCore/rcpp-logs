
goodPkg <- c("acer", "ALKr", "Amelia", "apcluster", "bcp", "bfa",
             "bfp", "bifactorial", "ccaPP", "cda", "clusteval",
             "ConConPiWiFun", "ecp", "ExactNumCI", "fastGHQuad", "fdaMixed", "gof",
             "growcurves", "GUTS", "KernSmoothIRT", "LaF", "minqa",
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
             "RVowpalWabbit", "SBSA", "simFrame", "sparseHessianFD",
             "SpatialTools", "stochvol", "survSNP", "termstrc", "tmg",
             "transmission", "transnet", "trustOptim", "unmarked",
             "waffect", "wordcloud", "zic" )

badPkg <- c("auteur", "blockcluster", "classify", "EpiContactTrace",
            "forecast", "fugeR", "GeneticTools", "gMWT",
            "gRbase", "gRim", "jaatha", "marked", "maxent", "mets",
            "mirt", "mMRMe", "ngspatial", "orQA", "pbdBASE",
            "pbdDMAT", "PReMiuM", "sdcMicro", "sdcTable", "spacodir",
            "sparseLTSEigen", "surveillance", "VIM", "WideLM" )

bad4missing <- c("auteur", 		# geiger
                 "classify",		# R2WinBugs, R2jags
                 "EpiContactTrace",	# ‘igraph0’ ‘R2HTML’
                 "fugeR",		# snowfall
                 "GeneticTools",	# ‘gMWT’ ‘snpStats’
                 "gMWT",		# clinfun
                 "gRbase",		# fastmatch RBGL
                 "gRim",		# ‘gRbase’ ‘gRain’ ‘doBy’
                 "jaatha",		# ‘phyclust’
                 "marked",		# ‘optimx’ ‘R2admb’
                 "maxent",		# tm
                 "mets",		# ‘lava’ ‘timereg’ ‘prodlim’
                 "mirt",		# ‘psych’ ‘GPArotation’
                 "ngspatial",		# ‘batchmeans’
                 "orQA",		# ‘genefilter’
                 "pbdBASE",		# ‘pbdMPI’ ‘pbdSLAP’
                 "pdbDMAT",		# ‘pbdMPI’ ‘pbdSLAP’ ‘pbdBASE’
                 "PReMiuM", 		# clue
                 "sdcTable",		# lpSolveAPI
                 "spacodir",		# picante
                 "surveillance",	# spatstat
                 "VIM"			# vcd
                 )

bad4error <- c("blockcluster",		# Eigen templates
               "forecast", 		# REAL() mixup
               "mMRMe",			# SET_VECTOR_ELT() can only be applied to a 'list', not a 'integer'
               "sdcMicro",		# REAL() can only be applied to a 'numeric', not a 'character'
               "sparseLTSEigen",	# segfault in examples()
               "WideLM")		# CUDA needs gcc/g++ 4.5

cat("Good      ", length(goodPkg), "\n")
cat("Bad       ", length(badPkg), "\n")
cat("  MissDep ", length(bad4missing), "\n")
cat("  Errors  ", length(bad4error), "\n")
cat("Total     ", length(goodPkg)+length(badPkg), "\n")
cat("Error Pct ", length(bad4error)/(length(bad4error)+length(goodPkg)), "\n")
