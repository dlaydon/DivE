\name{ParamSeeds}
\alias{ParamSeeds}
\docType{data}
\title{
List of 58 matrices of model seeding parameters.
}
\description{
The performance of \emph{modFit} (package \emph{FME}) with the pseudorandom parameter search algorithm (package \emph{FME}, \code{pseudoOptim}) used to estimated model parameter values, is sensitive to the choice of initial seeding values. We have provided the fitted parameters returned from our simulations to be used as initial seeding parameters.
}
\usage{data(ParamSeeds)}
\format{
  A list of 58 matrices. Each matrix has columns corresponding to the parameters of the matching model in \emph{ModelSet}. Each row is set of potential seeding parameters 
}
\details{
For each model, each initial parameter guess (i.e. each row of the model matrix in \emph{ParamRanges}) is evaluated by to \emph{modCost}. The parameter guess returning the lowest cost is used as the seeding value in \emph{modFit}.
If the user wishes to input alternative initial seeding parameter values, then for each model and parameter, all values must be finite (not \code{NA} or \code{NaN}), and within the upper and lower bounds set in \emph{ParamRanges}. Column names must match parameter names (params) in the corresponding model in ModelSet (i.e. \code{models} argument in DivEMaster).

}
\references{
Laydon, D., Melamed, A., Sim, A., Gillet, N. A., Sim, K., Darko, S., Kroll, S., Douek, D. C., Price, D., Bangham, C. R. M., Asquith, B., Quantification of HTLV-1 clonality and TCR diversity, PLOS Comput. Biol. 2014
}
\examples{
data(ParamSeeds)
}
\keyword{datasets}
