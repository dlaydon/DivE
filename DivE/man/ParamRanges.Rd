\name{ParamRanges}
\alias{ParamRanges}
\docType{data}
\title{
List of 58 sets of upper and lower bounds for models evaluated by DivE
}
\description{
A list of 58 matrices. Each matrix corresponds to a model in \code{ModelSet}, for which it contains suggested upper and lower bounds for each parameter. 
}
\usage{data(ParamRanges)}
\format{
  A list of 58 matrices. Each matrix has 2 rows (lower bounds, upper bounds) and columns corresponding to the parameters of the matching model in \code{ModelSet}.}
\details{
There is a trade-off between specifying parameter ranges that are large enough to encompass likely fitted values for a variety of data sets, and specifying parameter ranges that are suitably small so that parameter estimation is sufficiently precise and runtime is managable. We have aimed to balance these competing concerns.  The parameter ranges provided performed well in our simulations. The user can amend if required. 
}
\references{
Laydon, D. J., Melamed, A., Sim, A., Gillet, N. A., Sim, K., Darko, S., Kroll, S., Douek, D. C., Price, D., Bangham, C. R. M., Asquith, B., Quantification of HTLV-1 clonality and TCR diversity, PLOS Comput. Biol. 2014
}
\examples{
data(ParamRanges)
}
\keyword{datasets}
