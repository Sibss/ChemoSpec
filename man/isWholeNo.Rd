\name{isWholeNo}
\alias{isWholeNo}
\title{Determine if a Number is a Whole Number}

\description{
This function determines if a given number is a whole number within a given tolerance.  Taken from the help page of \code{\link{is.integer}}.  An internal function, not generally called by the user.
}

\usage{
isWholeNo(x, tol = .Machine$double.eps^0.5)
}

\arguments{
  \item{x}{A number to be tested.}
  \item{tol}{Tolerance for the test.}
}

\value{
A logical, indicating the outcome of the test.
}


\references{
\url{https://github.com/bryanhanson/ChemoSpec}\cr
}

\author{
Bryan A. Hanson, DePauw University. \email{hanson@depauw.edu}
}

\seealso{
\code{\link{is.integer}}
}
\keyword{ utilities }
