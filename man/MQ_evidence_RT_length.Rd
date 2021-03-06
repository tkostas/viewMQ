% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/MQ_evidence_RT_length.R
\name{MQ_evidence_RT_length}
\alias{MQ_evidence_RT_length}
\title{Plot peptide retention time distribution using MaxQuant output}
\usage{
MQ_evidence_RT_length(x, xlim = c(0, 3))
}
\arguments{
\item{x}{The filtered 'evidence.txt' file. Use MQ_remove_CR first to remove contaminants and reverse hits.}

\item{xlim}{Numeric vector containing two elements defining the min and max limits of the x axis. Default value is xlim = c(0, 3).}
}
\description{
Uses the output from MaxQuant (evidence.txt) to plot retention time distribution for all the peptides
of the individual experiments.
}
