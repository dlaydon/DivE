\name{divsamplenum}
\alias{divsamplenum}
\alias{divsamplenum.default}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
divsamplenum
}
\description{
Function to generate an integer sequence representing the lengths of nested samples of sample
}
\usage{
divsamplenum(ms, n)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{ms}{
  the main sample, either as a 2-column data.frame (species ID, count of species), or a vector of species IDs.
}
  \item{n}{
  desired number of nested samples (integer)

}
}
\details{
This function produces the default list of nested sample lengths for the DivE algorithm. For the vector representation of the main sample (\emph{ms}) it is equivalent to \emph{sort(round(seq(from=length(ms)/n, to=length(ms), by=length(ms)/n)), decreasing=TRUE)}.
}
\value{
%%  ~Describe the value returned
A decreasing sequence of nested sample lengths.
%%  \item{comp1 }{Description of 'comp1'}
%%  \item{comp2 }{Description of 'comp2'}
%% ...
}
\references{
Laydon, D. J., Melamed, A., Sim, A., Gillet, N. A., Sim, K., Darko, S., Kroll, S., Douek, D. C., Price, D., Bangham, C. R. M., Asquith, B., Quantification of HTLV-1 clonality and TCR diversity, PLOS Comput. Biol. 2014

}
\author{
Daniel Laydon, Aaron Sim, Charles Bangham, Becca Asquith
%%  ~~who you are~~
}

\examples{
require(DivE)
data(Bact1)

divsamplenum(Bact1, 3)
divsamplenum(Bact1, 6)

}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ diversity }

