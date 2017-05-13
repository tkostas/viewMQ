#' Charge state distribution using MaxQuant output
#'
#' @description Uses the output from MaxQuant (evidence.txt) to create a bargraph of
#' charge state distribution as a total or splitted by experiment.
#'
#' @returns Returns a barplot.
#'
#' @param x The filtered 'evidence.txt' file. Use MQ_remove_CR first to remove contaminants and reverse hits.
#' @param per_sample Logical with default value equal to FALSE. By default a summary from all experiments will
#'  be plotted. If set to TRUE, individual experiments will be shown in different graphs.
#' @param ncol Number of columns when plotting individual experiments. Default value is 5.
#'
#' @examples
#' # plot charge state as a total
#' MQ_evidence_charge_state(filtered_evidence_output, per_sample = TRUE, ncol = 6)
#'
#' #plot charge state per experiment
#' MQ_evidence_charge_state(filtered_evidence_output, per_sample = TRUE, ncol = 6)
#'
#' @export

MQ_evidence_charge_state <- function(x, per_sample = FALSE, ncol = 5) {
  p <- ggplot(data = x, aes(x = Charge))
  p <- p + geom_bar()
  p <- p + theme_bw()
  p <- p + xlab("Peptide charge")
  p <- p + ylab("Number of peptides")
  p <- p + ggtitle("Peptide charage state distribution")
  if (per_sample == TRUE) {
    p <- p + facet_wrap(~ Experiment, ncol = ncol)
  }
  print(p)
}

