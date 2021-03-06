% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/MQ_evidence_modifications.R
\name{MQ_evidence_modifications}
\alias{MQ_evidence_modifications}
\title{Peptide modifications distribution using MaxQuant output}
\usage{
MQ_evidence_modifications(x, per_sample = FALSE, ncol = 5,
  log_scale = TRUE)
}
\arguments{
\item{x}{The filtered 'evidence.txt' file. Use MQ_remove_CR first to remove contaminants and reverse hits.}

\item{per_sample}{Logical with default value equal to FALSE. By default a summary from all experiments will
be plotted. If set to TRUE, individual experiments will be shown in different graphs.}

\item{ncol}{Number of columns when plotting individual experiments. Default value is 5.}

\item{log_scale}{Logical with default value equal to TRUE. By default, the y axis is in log10 scale. Set
to FALSE to switch to normal scale.}
}
\description{
Uses the output from MaxQuant (evidence.txt) to create a bargraph of
peptide modifications as a total or splitted by experiment.
}
\examples{
# plot charge state as a total
MQ_evidence_modifications(filtered_evidence_output, per_sample = TRUE, ncol = 6)

#plot charge state per experiment
MQ_evidence_modifications(filtered_evidence_output, per_sample = TRUE, ncol = 6)

}
