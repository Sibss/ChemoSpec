\name{metMUD1}
\alias{alignMUD}
\alias{metMUD1}
\alias{metMUD2}
\docType{data}
\title{Made Up NMR Data Sets}

\description{
These data sets are simulated 300 MHz NMR spectra.  They are designed mainly to illustrate certain chemometric methods and are small enough that they process quickly.

\code{alignMUD} is a series of mis-aligned spectra of a single small organic molecule.

\code{metMUD1} is composed of 20 samples, each a mixture of four typical small organic compounds (we'll leave it to the reader as an exercise to deduce the spin systems!).  These compounds are present in varying random amounts.  Ten of the samples are control samples, and ten are treatment samples.  Thus you can run PCA and other methods on this data set, and expect to see a separation.  \code{\link{corSpectra}} analysis of this data set is interpreted as a 2D TOCSY NMR is: any resonances on a particular horizontal or vertical line (frequency) is part of a single spin system.  Another way to think about this is that all the peaks for a single compound are positively correlated with each other but not with any other compound.  It's useful to keep in mind that the resonances of the four compounds overlap considerably in some cases. This data set is normalized.


\code{metMUD2} also consists of 20 samples of mixtures of the same four compounds.  However, the concentrations of some of the compounds are correlated with other compounds, both positively and negatively, and some concentrations are random. \code{metMUD2} is divided into different sample groups which correspond conceptually to two genes, each active or knocked out.  This data set is designed to be similar to a metabolomics data set in which the concentrations of some compounds co-vary, and others are independent.  Compare the \code{\link{corSpectra}} plot of this data set to the \code{metMUD1} where there is no co-variation. This data set is normalized.

}

\usage{data(metMUD1)}

\format{
The data is stored as a \code{\link{Spectra}} object.
}

\source{
Created using various tools.  Contact the author for a script if interested.
}

\references{
\url{https://github.com/bryanhanson/ChemoSpec}
}

\keyword{datasets}
