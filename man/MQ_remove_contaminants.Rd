% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/MQ_remove_contaminants.R
\name{MQ_remove_contaminants}
\alias{MQ_remove_contaminants}
\title{Remove contaminants from MaxQuant output files}
\usage{
MQ_remove_contaminants(x)
}
\arguments{
\item{x}{Input dataframe.}
}
\value{
Returns a filtered dataframe similar to the imput.
}
\description{
Removes contamintants from the MaxQuant output files.
}
\examples{
filtered_data <- MQ_remove_contaminants(raw_data)

}
