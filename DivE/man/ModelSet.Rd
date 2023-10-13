\name{ModelSet}
\alias{ModelSet}
\docType{data}
\title{
List of 58 candidate models to fit to data
}
\description{
\emph{ModelSet} is an example list of candidate models used in the reference below to calculate the \emph{DivE} estimate
}
\usage{data(ModelSet)}
\format{
  A list of 58 named functions (with named parameters). Each model in the list must be provided as a function, and must be of the following form: function(x, params) with(as.list(params), FunctionOfParams). The parameter names are a1, a2, a3, etc. These must match the names of the parameter values given in \emph{ParamSeeds} and \emph{ParamRanges}. 
}
\details{
Each model is written as a function: function(x, params) with(as.list(params), FunctionOfParams). Examples are given in the \emph{ModelSet} data file as part of the \emph{DivE} package. The user can amend \emph{ModelSet} and input additional models as required. The analytical form of all the models provided in \emph{ModelSet} can be found in the reference below, in Text S1: List of \emph{DivE} candidate models. All models were obtained from \emph{zunzun.org}, an online curve fitting repository

}
\references{
Laydon, D. J., Melamed, A., Sim, A., Gillet, N. A., Sim, K., Darko, S., Kroll, S., Douek, D. C., Price, D., Bangham, C. R. M., Asquith, B., Quantification of HTLV-1 clonality and TCR diversity, PLOS Comput. Biol. 2014
}
\examples{
data(ModelSet)
}
\keyword{datasets}
