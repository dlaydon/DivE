\name{comb.dm}
\alias{comb.dm}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
comb.dm
}
\description{
Implements the DivE diversity estimator. Combines multiple objects of class \emph{DiveMaster}.
}
\usage{
comb.dm(dmlist)
}

%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{dmlist}{
  list of objects of class \emph{DiveMaster}.
}
}
\details{
\emph{comb.dm} combines multiple objects of class \emph{DiveMaster}. Function used if \emph{DivE} estimation has been split into multiple, separate calls to \code{DiveMaster}.


}
\value{
An object of class \emph{DiveMaster}, i.e. a list of objects

  \item{model.score }{a matrix of aggregated model scores}
  \item{fmm }{a list of \emph{fitsingMod} objects corresponding to the list of fitted models}
  \item{ssm }{a matrix of scores of the fit of the models corresponding to the list of fitted models}
  \item{estimate }{the estimate of species richness (number of species/classes or diversity) at population size \code{tot.pop}. This is the geometric average of the models corresponding to the top-five model scores. This is recalculated based on the combined list of models}
  \item{lower_estimate }{as per estimate value, but the lowest prediction amongst the models having the top-five scores. This is recalculated based on the combined list of models}
  \item{upper_estimate }{as per estimate value, but the highest prediction amongst the models having the top-five scores. This is recalculated based on the combined list of models}
  \item{models }{list of original input models}
  \item{m }{number of topscoring models used for diversity estimate. This is set as the smallest \code{m} value of each of the \emph{DiveMaster} objects in the list}
}
\references{
Laydon, D. J., Melamed, A., Sim, A., Gillet, N. A., Sim, K., Darko, S., Kroll, S., Douek, D. C., Price, D., Bangham, C. R. M., Asquith, B., Quantification of HTLV-1 clonality and TCR diversity, PLOS Comput. Biol. 2014
}
\author{
Daniel J. Laydon, Aaron Sim, Charles R.M. Bangham, Becca Asquith
}


%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
\code{\link[DivE]{DiveMaster}}
}
\examples{
# See DiveMaster documentation for examples.
}

% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ diversity }

