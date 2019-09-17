\name{scoresinglemod}
\alias{scoresinglemod}
\alias{scoresinglemod.default}
\alias{print.scoresingleMod}
\alias{summary.scoresingleMod}
\alias{print.summary.scoresingleMod}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
scoresinglemod
}
\description{
Determines the set of scores corresponding to a single model fit to a diversity values of subsamples of a given sample and its nested samples.
}
\usage{
scoresinglemod(fsm, precision.lv=c(0.0001, 0.005, 0.005), plaus.pen=500)
}

%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{fsm}{
  \emph{fitsinglemod} object
}
  \item{precision.lv}{
  vector of precision level values for each criterion: 1. discrepancy -- mean percentage error between rarefaction data points and model predicion, 2. Sample accuracy -- percentage error between observed diversity of full rarefaction data and estimated diversity of full data from subsample, 3. local similarity. The scores for each criteria are defined as 1 + (multiples of bin sizes)
}
  \item{plaus.pen}{
  penalty score for breaking the plausibility criterion: a model fit should be monotonically increasing and should have a slowing rate of species accumulation.
}
}
\details{
The score for a given model is only meaningful when compared with scores of other models. Lower score = better for predicting the population diversity. To assess the performance of a single model, it is more informative to use \code{\link[DivE]{fitsinglemod}} function.
}
\value{
A list of class \emph{scoresingleMod} containing the scores of the fit of the model to the diversity samples. This includes the following:

  \item{discrepancy }{score for discrepancy, aggregated across all nested subsamples}
  \item{accuracy }{score for accuracy of full sample prediction, aggregated across all nested subsamples}
  \item{similarity }{score for similarity of curves for different samples}
  \item{plausibility }{score for plausibility criterion}
  \item{binsize }{vector of user-specified precision values used to translate values associated with each criterion into scores }
  \item{plausibility.penalty }{penalty score for implausible diversity curve}
  \item{modname }{model name}
}
\references{
Laydon, D. J., Melamed, A., Sim, A., Gillet, N. A., Sim, K., Darko, S., Kroll, S., Douek, D. C., Price, D., Bangham, C. R. M., Asquith, B., Quantification of HTLV-1 clonality and TCR diversity, PLOS Comput. Biol. 2014
}
\author{
Daniel Laydon, Aaron Sim, Charles Bangham, Becca Asquith
}


%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
\code{\link[DivE]{fitsinglemod}}
}
\examples{
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
}

% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ diversity }

