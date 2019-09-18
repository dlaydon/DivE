\name{divsubsamples}
\alias{divsubsamples}
\alias{print.divsubsamples}
\alias{summary.divsubsamples}
\alias{print.summary.divsubsamples}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
divsubsamples
}
\description{
Function to generate the rarefaction data from a given sample
}
\usage{
divsubsamples(mainsamp, nrf, minrarefac=1,
maxrarefac=length(FormatInput(mainsamp)), NResamples=1000)
}

%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{mainsamp}{
  the main sample, either as a 2-column data.frame (species ID, count of species), or a vector of species IDs.
}
  \item{nrf}{
  difference between lengths of successive rarefaction datapoints.
}
  \item{minrarefac}{
  minimum rarefaction data x-axis value. Default is 1.
}
  \item{maxrarefac}{
  maximum rarefaction data x-axis value. Default is length of the sample \code{mainsamp}.
}
  \item{NResamples}{
  number of resamples used to calculate the rarefaction data.
}
}
\details{
This function produces a vector of subsamples diversity values with subsample lengths evenly distributed between a specified minimum and maximum number. The curvature of the rarefaction curve can be obtained with the function \code{Curvature}.
}
\value{
a list of class \emph{divsubsamples} containing resampling results (i.e. the diversity data). This includes the following:

  \item{RarefacXAxis }{vector of x-axis rarefaction data}
  \item{RarefacYAxis }{vector of y-axis rarefaction data}
  \item{div_sd }{vector of y-axis rarefaction data standard deviations}
  \item{NResamples }{number of sampling iterations used to calculate sample means of each subsample diversity}
}
\references{
Laydon, D. J., Melamed, A., Sim, A., Gillet, N. A., Sim, K., Darko, S., Kroll, S., Douek, D. C., Price, D., Bangham, C. R. M., Asquith, B., Quantification of HTLV-1 clonality and TCR diversity, PLOS Comput. Biol. 2014
}
\author{
Daniel J. Laydon, Aaron Sim, Charles R.M. Bangham, Becca Asquith
}


\examples{
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
}

\keyword{ diversity }
