\name{binSpectra}
\alias{binSpectra}
\title{
Bin or Bucket a Spectra Object
}
\description{
This function will bin a \code{\link{Spectra}} object by averaging every \code{bin.ratio} frequency values, and summing the corresponding intensity values.  The net effect is a smoothed and smaller data set.  If there are gaps in the frequency axis, each data chunk is processed separately.  Note: some folks refer to binning as bucketing.
}

\usage{
binSpectra(spectra, bin.ratio)
}
\arguments{
  \item{spectra}{
An object of S3 class \code{\link{Spectra}} to be binned.
}
  \item{bin.ratio}{
An integer giving the binning ratio, that is, the number of points to be grouped together into one subset of data.
}

}

\details{
If the frequency range is not divisible by bin.ratio to give a whole number, data points are removed from the beginning of the frequency data until it is, and the number of data points removed is reported at the console.  If there are gaps in the data where frequencies have been removed, each continuous piece is sent out and binned separately (by \code{\link{binSpectra}}).
}

\value{
An object of S3 class \code{\link{Spectra}}.
}


\references{
\url{https://github.com/bryanhanson/ChemoSpec}
}

\author{
Bryan A. Hanson, DePauw University. \email{hanson@depauw.edu}
}
\examples{
data(metMUD1)
sumSpectra(metMUD1)
res <- binSpectra(metMUD1, bin.ratio = 4)
sumSpectra(res)
}
\keyword{ utilities }
\keyword{ manip }
