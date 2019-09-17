\name{DiveMaster}
\alias{DiveMaster}
\alias{DiveMaster.default}
\alias{print.DiversityMaster}
\alias{summary.DiversityMaster}
\alias{print.summary.DiversityMaster}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
DiveMaster
}
\description{
Implements the DivE diversity estimator.
}
\usage{
DiveMaster(models, init.params, param.ranges, main.samp,
           tot.pop=(100*(divsamplenum(main.samp,2)[1])), numit=10^5,
           varleft=1e-8, subsizes=6, dssamps=list(), nrf=1, minrarefac=1,
           NResamples=1000, minplaus=10,
           precision.lv=c(0.0001, 0.005, 0.005), plaus.pen=500,
           crit.wts=c(1.0, 1.0, 1.0, 1.0), fitloops=2, numpred=5)
}

%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{models}{
  list of models; each model is written as a function: function(x, params) \{ with(as.list(params), <\emph{function of params}>)\}. Examples are given in the ModelSet data file as part of the DivE package.
}
  \item{init.params}{
  list of matrices of initial seed model parameters. For each matrix, each row represents a given parameter set; each column represents a parameter value. Column names must match parameter names (params) in the corresponding model in the list \code{models}. Examples are given in the ParamSeeds data file as part of the DivE package.
}
  \item{param.ranges}{
  list of matrices of lower and upper model parameters bounds. Used for the modFit function. The first and second row corresponds to the lower and upper bounds respectively; each column represents a parameter value. Column names must match parameter names (params) in the corresponding model in the list \code{models}. Examples are given in the param.ranges data file as part of the DivE package.
}
  \item{main.samp}{
  the main sample, either as a 2-column data.frame (species ID, count of species), or a vector of species IDs.
}
  \item{tot.pop}{
  total population (integer); default set to 100x the \code{main.samp} size.
}
  \item{numit}{
  control argument passed to optimisation routine; the maximum number of iterations that modFit will perform. See \code{\link[FME]{modFit}} for details.
}
  \item{varleft}{
  control argument passed to optimisation routine; see \code{\link[FME]{modFit}} for details.
}
  \item{subsizes}{
  either number of nested subsamples (integer, must be 2 or greater), or a vector of nested sample lengths. If the former, then the vector of sample lengths will be created using the \emph{divsamplenum} function.
}
  \item{dssamps}{
  list of user specified rarefaction data \emph{divsubsamples} objects. The length of each component vector of each object in the list must correspond to the vector of nested sample lengths (as defined by the user in \code{subsizes}).
}
  \item{nrf}{
  difference between lengths of successive rarefaction datapoints.
}
  \item{minrarefac}{
  minimum rarefaction x-axis value. This argument is not used if list of \emph{divsubsamples} object is specified in \code{dssamps}.
}
  \item{NResamples}{
  number of resamples used to calculate the rarefaction data. This parameter is not used if list of \emph{divsubsamples} object is specified in \code{dssamps}.
}
  \item{minplaus}{
  lower x-axis bound for plausibility check.
}
  \item{precision.lv}{
  vector of precision level values for each criterion: 1. discrepancy -- mean percentage error between rarefaction data points and model predicion, 2. Sample accuracy -- percentage error between observed diversity of full rarefaction data and estimated diversity of full data from subsample, 3. local similarity. The scores for each criteria are defined as 1 + (multiples of bin sizes)
}
  \item{plaus.pen}{
  penalty score for breaking the plausibility criterion: a model fit should be monotonically increasing and should have a slowing rate of species accumulation.
}
  \item{crit.wts}{
  vector of weights of each of the four scoring criteria -- fit, accuracy, similarity, plausibility. Default is c(1,1,1,1).
}
  \item{fitloops}{
  number of fitting rounds performed for each model. In each round of fitting, the initial seed parameter values for each model will be the fitted parameters of the previous fitting run. This parameter has a significant impact on the computational time. The `sweet spot' is 2.
}
  \item{numpred}{
  number of topscoring models used for diversity prediction. Default is 5.}
}
\details{
This is the master function of the DivE estimator. The default operation is a combination of four steps. 1. Generate a list of nested samples lengths from the main sample. 2. For each nested subsample, generate a vector of rarefaction data and their associated mean species diversity. 3. Fit to the generated data a set of models. 4. Evaluate the fits according to the DivE diversity estimation methodology and compare the scores across models and fitting criteria.

A list of DiveMaster objects, each representing the fits to different sets of models, can combined into a single DiveMaster object using the \code{comb.dm} function. This is useful when running the DivE estimator with the full set of 58 models in a single run is not possible.

One can estimate the diversity for a given population using the \code{popdiversity} function where the arguments are the Divemaster object and the population size respectively.
}
\value{
A list of objects:

  \item{model.score }{a matrix of aggregated model scores}
  \item{fmm }{a list of \emph{fitsingMod} objects corresponding to the list of fitted models}
  \item{ssm }{a matrix of scores of the fit of the models corresponding to the list of fitted models}
  \item{estimate }{the estimate of species richness (number of species/classes or diversity) at population size \code{tot.pop}. This is the geometric average of the models corresponding to the top-five model scores}
  \item{lower_estimate }{as per estimate value, but the lowest prediction amongst the models having the top-five scores}
  \item{upper_estimate }{as per estimate value, but the highest prediction amongst the models having the top-five scores}
  \item{models }{list of original input models}
  \item{m }{number of topscoring models used for diversity estimate}
  
}
\references{
Laydon, D. J., Melamed, A., Sim, A., Gillet, N. A., Sim, K., Darko, S., Kroll, S., Douek, D. C., Price, D., Bangham, C. R. M., Asquith, B., Quantification of HTLV-1 clonality and TCR diversity, PLOS Comput. Biol. 2014
}
\author{
Daniel J. Laydon, Aaron Sim, Charles R.M. Bangham, Becca Asquith
}


%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
\code{\link[DivE]{fitsinglemod}}, \code{\link[DivE]{scoresinglemod}}
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
# out3 <- comb.dm(list(out, out2))

## To calculate the diversity for a different population size
# popdiversity(dm=out, popsize=10^5, TopX=1)

}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ diversity }

