pkgname <- "DivE"
source(file.path(R.home("share"), "R", "examples-header.R"))
options(warn = 1)
options(pager = "console")
base::assign(".ExTimings", "DivE-Ex.timings", pos = 'CheckExEnv')
base::cat("name\tuser\tsystem\telapsed\n", file=base::get(".ExTimings", pos = 'CheckExEnv'))
base::assign(".format_ptime",
function(x) {
  if(!is.na(x[4L])) x[1L] <- x[1L] + x[4L]
  if(!is.na(x[5L])) x[2L] <- x[2L] + x[5L]
  options(OutDec = '.')
  format(x[1L:3L], digits = 7L)
},
pos = 'CheckExEnv')

### * </HEADER>
library('DivE')

base::assign(".oldSearch", base::search(), pos = 'CheckExEnv')
base::assign(".old_wd", base::getwd(), pos = 'CheckExEnv')
cleanEx()
nameEx("Bact1")
### * Bact1

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: Bact1
### Title: Count of Medically Important Bacteria Species in a Sample
### Aliases: Bact1 Bact2
### Keywords: datasets

### ** Examples

data(Bact1)

hist(Bact1[,2], breaks=20, main="Bacterial diversity of a sample",
xlab="Number of bacteria of a given species", ylab="Number of bacterial species")



base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("Bact1", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("Curvature")
### * Curvature

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: Curvature
### Title: Curvature
### Aliases: Curvature
### Keywords: diversity

### ** Examples

# See divsubsamples documentation for examples.



base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("Curvature", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("DiveMaster")
### * DiveMaster

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: DiveMaster
### Title: DiveMaster
### Aliases: DiveMaster print.DiveMaster summary.DiveMaster
###   print.summary.DiveMaster
### Keywords: diversity

### ** Examples

require(DivE)
data(Bact1)
data(ModelSet)
data(ParamSeeds)
data(ParamRanges)

testmodels <- list()
testmeta <- list()
paramranges <- list()

# Choose a single model 
testmodels <- c(testmodels, ModelSet[1])
#testmeta[[1]] <- (ParamSeeds[[1]]) # Commented out for sake of brevity)
testmeta[[1]] <- matrix(c(0.9451638, 0.007428265, 0.9938149, 1.0147441, 0.009543598, 0.9870419),
                        nrow=2, byrow=TRUE, dimnames=list(c(), c("a1", "a2", "a3"))) # Example seeds
paramranges[[1]] <- ParamRanges[[1]]


# Create divsubsamples object (NB: For quick illustration only -- not default parameters)
dss_1 <- divsubsamples(Bact1, nrf=2, minrarefac=1, maxrarefac=40, NResamples=5)
dss_2 <- divsubsamples(Bact1, nrf=2, minrarefac=1, maxrarefac=65, NResamples=5)
dss <- list(dss_2, dss_1)

# Implement the function (NB: For quick illustration only -- not default parameters)
out <- DiveMaster(models=testmodels, init.params=testmeta, param.ranges=paramranges,
                  main.samp=Bact1, subsizes=c(65, 40), NResamples=5, fitloops=1,
                  dssamp=dss, numit=2, varleft=10)

# DiveMaster Outputs
out
out$estimate

out$fmm$logistic

out$fmm$logistic$global

out$ssm

summary(out)

## Combining two DiveMaster objects (assuming a second object 'out2'):
# out3 <- CombDM(list(out, out2))

## To calculate the diversity for a different population size
# popdiversity(dm=out, popsize=10^5, TopX=1)




base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("DiveMaster", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("ModelSet")
### * ModelSet

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: ModelSet
### Title: List of 58 candidate models to fit to data
### Aliases: ModelSet
### Keywords: datasets

### ** Examples

data(ModelSet)



base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("ModelSet", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("ParamRanges")
### * ParamRanges

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: ParamRanges
### Title: List of 58 sets of upper and lower bounds for models evaluated
###   by DivE
### Aliases: ParamRanges
### Keywords: datasets

### ** Examples

data(ParamRanges)



base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("ParamRanges", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("ParamSeeds")
### * ParamSeeds

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: ParamSeeds
### Title: List of 58 matrices of model seeding parameters.
### Aliases: ParamSeeds
### Keywords: datasets

### ** Examples

data(ParamSeeds)



base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("ParamSeeds", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("comb.dm")
### * comb.dm

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: CombDM
### Title: CombDM
### Aliases: CombDM
### Keywords: diversity

### ** Examples

# See DiveMaster documentation for examples.



base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("comb.dm", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("divsamplenum")
### * divsamplenum

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: divsamplenum
### Title: divsamplenum
### Aliases: divsamplenum
### Keywords: diversity

### ** Examples

require(DivE)
data(Bact1)

divsamplenum(Bact1, 3)
divsamplenum(Bact1, 6)




base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("divsamplenum", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("divsubsamples")
### * divsubsamples

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: divsubsamples
### Title: divsubsamples
### Aliases: divsubsamples print.divsubsamples summary.divsubsamples
###   print.summary.divsubsamples
### Keywords: diversity

### ** Examples

require(DivE)
data(Bact1)

dss_1 <- divsubsamples(Bact1, nrf=2, minrarefac=1, maxrarefac=100,
                        NResamples=10) 
dss_2 <- divsubsamples(Bact1, nrf=20, minrarefac=1, maxrarefac=100,
                        NResamples=10)
# Default NResamples=1000; low value of NResamples=10 is a set for quick evaluation

dss_1
dss_2

summary(dss_1)
dss_1$div_sd
dss_1$NResamples

Curvature(dss_1)



base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("divsubsamples", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("fitsinglemod")
### * fitsinglemod

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: fitsinglemod
### Title: fitsinglemod
### Aliases: fitsinglemod print.fitsingleMod summary.fitsingleMod
###   print.summary.fitsingleMod plot.fitsingleMod
### Keywords: diversity

### ** Examples

# See documentation of \code{scoresinglemod} for examples



base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("fitsinglemod", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("popdiversity")
### * popdiversity

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: popdiversity
### Title: popdiversity
### Aliases: popdiversity
### Keywords: diversity

### ** Examples

# See DiveMaster documentation for examples.



base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("popdiversity", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("scoresinglemod")
### * scoresinglemod

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: scoresinglemod
### Title: scoresinglemod
### Aliases: scoresinglemod print.scoresingleMod summary.scoresingleMod
###   print.summary.scoresingleMod
### Keywords: diversity

### ** Examples

require(DivE)
data(Bact1)
data(ModelSet)
data(ParamSeeds)
data(ParamRanges)

testmodels <- list()
testmeta <- list()
paramranges <- list()   

# Choose a single model

testmodels <- c(testmodels, ModelSet[1])
# testmeta <- (ParamSeeds[[1]]) # Commented out for sake of brevity)
testmeta <- matrix(c(0.9451638, 0.007428265, 0.9938149, 1.0147441, 0.009543598, 0.9870419),
                        nrow=2, byrow=TRUE, dimnames=list(c(), c("a1", "a2", "a3"))) # Example seeds
paramranges <- ParamRanges[[1]]

# Create divsubsamples object (NB: For quick illustration only -- not default parameters)
dss_1 <- divsubsamples(Bact1, nrf=2, minrarefac=1, maxrarefac=40, NResamples=5)
dss_2 <- divsubsamples(Bact1, nrf=2, minrarefac=1, maxrarefac=65, NResamples=5)
dss <- list(dss_2, dss_1)

# Fit the model (NB: For quick illustration only -- not default parameters)
fsm <- fitsinglemod(model.list=testmodels, init.param=testmeta, param.range=paramranges,
                    main.samp=Bact1, dssamps=dss, fitloops=1, data.default=FALSE,
                    subsizes=c(65, 40), 
                    numit=2) # numit chosen to be extremely small to speed up example


# Score the model
ssm <- scoresinglemod(fsm)

ssm
summary(ssm)



base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("scoresinglemod", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
### * <FOOTER>
###
cleanEx()
options(digits = 7L)
base::cat("Time elapsed: ", proc.time() - base::get("ptime", pos = 'CheckExEnv'),"\n")
grDevices::dev.off()
###
### Local variables: ***
### mode: outline-minor ***
### outline-regexp: "\\(> \\)?### [*]+" ***
### End: ***
quit('no')
