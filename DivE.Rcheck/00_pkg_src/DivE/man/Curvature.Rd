\name{Curvature}
\alias{Curvature}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Curvature
}
\description{
Calculates the curvature of the rarefaction curve of the full observed data.
}
\usage{
Curvature(dss)
}

%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{dss}{
  list of objects of class \emph{divsubsamples}.
}
}
\details{
\code{Curvature} calculates the curvature of the full observed data. If \code{dss} contains more than one subsample (i.e. if length(\code{dss})>1), the curvature of the largest subsample is calculated. If the curvature value is \eqn{< 0.1}, researchers should exercise caution as this is indicative of severe under-sampling, in which case DivE is prone to error. 


}
\value{
\emph{numeric}, between 0 and 1

}
\references{
Laydon, D. J., Melamed, A., Sim, A., Gillet, N. A., Sim, K., Darko, S., Kroll, S., Douek, D. C., Price, D., Bangham, C. R. M., Asquith, B., Quantification of HTLV-1 clonality and TCR diversity, PLOS Comput. Biol. 2014
}
\author{
Daniel Laydon, Aaron Sim, Charles Bangham, Becca Asquith
}


\seealso{
\code{\link[DivE]{divsubsamples}}
}
\examples{
# See divsubsamples documentation for examples.
}

% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ diversity }

