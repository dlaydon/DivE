\name{DivE-package}
\alias{DivE-package}
\alias{DivE}
\docType{package}
\title{
Diversity Estimator
}
\description{
R-package \emph{DivE} contains functions for the DivE estimator (Laydon, D.J. \emph{et al.}, Quantification of HTLV-1 clonality and TCR diversity, PLOS Comput. Biol. 2014). The \emph{DivE} estimator is a heuristic approach to estimate the number of classes or the number of species (species richness) in a population. 

\emph{DivE} fits many mathematical models to multiple nested subsamples of individual-based rarefaction curves. These curves depict the expected number of species as a function of the number of individuals (e.g. T cells, virions, microbes). Each model is fitted to all nested subsamples, producing multiple model fits. Novel criteria are used to score each model in how consistently its fits reproduce the full observed rarefaction curve from the nested subsamples, i.e. from only incomplete data. The best performing models are extrapolated to a desired population size, and their estimates are aggregated to estimate the number of classes in the population. 

The package contains: 

1. {functions to generate individual-based rarefaction (species-accumulation) data, and evaluate their curvature}

2. {functions to fit mathematical models to rarefaction data and nested subsamples thereof. These functions make extensive use of the R-package \emph{FME} (http://cran.r-project.org/web/packages/FME/index.html)}

3. {functions to evaluate novel criteria for each model. These functions make use of the R-package \emph{rgeos} (http://cran.r-project.org/web/packages/rgeos/index.html) }

4. {functions to score competing models}

5. {a function to produce final estimates of the number of classes (diversity)}

6. {example candidate models, fitted parameters, parameter ranges, and an example data set}

7. {an example script. We have attempted to make the code flexible to users who require varying levels of detail and control. The simplest way to use the package is the DiveMaster function. This function is a wrapper around other functions provided with the \emph{DivE} package and will create subsamples (function \code{divsubsamples}), fit models (function \code{fitsinglemod}), score models (function \code{scoresinglemod}) and produce final diversity/species richness estimates (function \code{popdiversity}). }

The novel criteria against which each model fit is scored are:

  \bold{Discrepancy} -- the mean percentage error between data points and model prediction.
  
  \bold{Accuracy} -- the percentage error between the full sample species richness, and the estimate of full sample species richness from a given subsample. 
  
  \bold{Similarity} -- the area between the curve fitted to a subsample and the curve fitted to the full sample, normalized to the area under the curve from the full data, on the interval [0, \emph{Nobs}], where \emph{Nobs} is the size of the full data.
  
  \bold{Plausibility} -- the predicted number of species must either increase monotonically or plateau and the predicted rate of species accumulation must either decrease or plateau (i.e. for \eqn{S(x)} and \eqn{x \ge 1}, where \eqn{x} is the number of individuals, \eqn{S'(x) \ge 0}, and \eqn{S''(x) \le 0}).  
  
The rationale behind each criterion is as follows:

  \emph{Discrepancy} -- the model must describe the data to which it was fitted. 
  
  \emph{Accuracy} -- from a subsample, the model should predict the full sample species richness. 
  
  \emph{Similarity} -- an ideal model will produce identical fits from all subsamples. The smaller the area between the model fits, the better the model. 
  
  \emph{Plausibility} --  this criterion requires that, as the observed number of individuals increases, the observed number of species does not decrease and the rate of species-accumulation does not increase; the former is impossible and the latter is implausible.
  
  
\bold{Population Size}

\emph{DivE} requires an estimate of population size, i.e. the number of individuals in the population for which the number of species is desired. Population size is a necessary input for species richness estimation when it is not appropriate to assume a saturating relationship between population size and species richness. 

In spatially homogeneous populations with equiprobable detection of individuals, population size can be estimated through scaling by area or volume e.g. scaling from cells in 50ml of blood to cells in the total blood volume. When population size estimates are unavailable, it is still usually possible to provide meaningful diversity estimates, e.g. the number of species per gram of tissue.


\bold{Requirements}

Many deep sequencing data consist of relative abundance of classes or species. We caution that \emph{DivE} requires data detailing the absolute counts of each class or species: relative abundances are insufficient. Rarefaction curves are highly sensitive to the scaling factor applied to relative abundances. Scaling factors that are too high greatly overestimate the degree of repetition of species in the sample, falsely implying that the sample contains a more comprehensive census, and ultimately affecting the resulting estimates of species richness. Absolute counts can usually be obtained when data are being collected (for further details, please see Laydon, D. \emph{et al.}).

\emph{DivE} requires data where each individual has been sampled randomly, independently and with an equal probability of detection, and where the underlying distribution of individuals is spatially homogeneous. Reliable extrapolation of rarefaction curves is only possible where these conditions are met. DivE is a heuristic estimator designed for use in immunological and microbiological populations, but can be used in any system where the above conditions are satisfied, and for which an estimate of population size is available (for further details, please see Laydon, D. \emph{et al.}). 

We have attempted to identify conditions under which DivE is prone to error and should not be applied. When the observed rarefaction curve is linear, the data imply a constant rate of species accumulation, and so provide little information on how quickly the rate of species accumulation will decrease. This is usually indicative of severe under-sampling. We quantified the deviation from linearity of the observed rarefaction curve using the curvature parameter Cp. This parameter can take values between 0 and 1, where 1 reflects perfect saturation and 0 reflects a constant rate of species accumulation. We recommend, based on our simulations, that DivE should not be applied when Cp < 0.1. Low curvatures suggest severe under-sampling and researchers should exercise caution when using any diversity estimator with such data. We have included a function \code{Curvature} to evaluate the approximate curvature of the rarefaction curve. 


\bold{Model Fitting Process}

The pseudo-random model fitting algorithm included with \emph{DivE} (from R package \emph{FME}) requires that parameter ranges and parameter seeding values be inputted. The runtime incurred in model fitting increases with the size of the parameter space. The need for parameter ranges small enough to yield precise parameter estimates in relatively short runtimes must be balanced against the need for parameter ranges that adequately encompass appropriate parameter values for data of different scales. We have included parameter ranges and seeding values that have performed well in our analyses, which the user can use or amend as required. 

The performance of \code{modFit} (package \emph{FME}) with the pseudorandom parameter search algorithm (package \emph{FME}, \code{pseudoOptim}) used to estimated model parameter values, is sensitive to the choice of initial seeding values. We have provided the fitted parameters returned from our simulations to be used as initial seeding parameters. For each model, each initial parameter guess (i.e. each row of the model matrix in ModelSeeds) is evaluated by to \code{modCost}. The parameter guess returning the lowest cost is used as the seeding value in \emph{modFit}.

To obtain better parameter fits, the fitting process can be repeated. Fitted parameters from a single subsample may provide a better seeding guess for a fit to a subsequent subsample than the initial parameter seeds originally inputted, and thus better final model fits will be produced. In our analyses, two attempts of the fitting process (argument \code{fitloops} in \code{DiveMaster}) were usually sufficient.


\bold{Contact}

Daniel J. Laydon, Section of Immunology, Division of Infectious Diseases, Department of Medicine, Imperial College London, Wright-Fleming Institute, Norfolk Place, W2 1PG

d.laydon@imperial.ac.uk
}
\details{
\tabular{ll}{
Package: \tab DivE\cr
Type: \tab Package\cr
Version: \tab 1.1\cr
Date: \tab 2019-08-17\cr
License: \tab GPL (>= 2) \cr
}
The main function is DiveMaster, which combines the four functions divsamplenum, divsubsamples, fitsinglemod, and scoresinglemod. An example script using both DiveMaster and the four component functions can be found in the \emph{demo} folder in the source.
}
\author{
Daniel J. Laydon, Aaron Sim, Charles R.M. Bangham, Becca Asquith
}
\references{
Laydon, D. J., Melamed, A., Sim, A., Gillet, N. A., Sim, K., Darko, S., Kroll, S., Douek, D. C., Price, D., Bangham, C. R. M., Asquith, B., Quantification of HTLV-1 clonality and TCR diversity, PLOS Comput. Biol. 2014
}
\keyword{ package }

