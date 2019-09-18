\name{popdiversity}
\alias{popdiversity}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
popdiversity
}
\description{
Calculates the species richness at a specified population size, taking an object of class \emph{DiveMaster} as an input.
}
\usage{
popdiversity(dm, popsize, TopX=NULL)
}

%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{dm}{
  list of objects of class \emph{DiveMaster}.
}
  \item{popsize}{
  positive real number. Population size.
}
  \item{TopX}{
  a positive integer, less than the number of models contained in \code{dm}, representing the number of best-performing models used for the aggregated estimate of the population diversity. If \code{NULL} (default), then \code{dm$m} models are aggregated. If \code{TopX} is larger than the the number of models fitted, then min(5, length(dm$fmm)) models are aggregated.
}
}
\details{
\emph{comb.dm} combines multiple objects of class \emph{DiveMaster}. Function used if \emph{DivE} estimation has been split into multiple, separate calls to \code{DiveMaster}.


}
\value{
A list of objects:
  \item{estimate}{point estimate of diversity (species richness)}
  \item{upper_estimate }{estimate upper bound}
  \item{lower_estimate }{estimate lower bound}
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

