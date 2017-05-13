#' Plot number of missed cleavages using MaxQuant output
#'
#' @description Uses the output from MaxQuant (evidence.txt) to create a bargraph of
#' the number of missed cleavages as a total or splitted by experiment.
#'
#' @returns Returns a barplot.
#'
#' @param x The filtered 'evidence.txt' file. Use MQ_remove_CR first to remove contaminants and reverse hits.
#' @param per_sample Logical with default value equal to FALSE. By default a summary from all experiments will
#'  be plotted. If set to TRUE, individual experiments will be shown in different graphs.
#' @param ncol Number of columns when plotting individual experiments. Default value is 5.
#'
#' @examples
#' # plot number of missed cleavages as a total
#' MQ_evidence_missed_clevages(filtered_evidence_output, per_sample = TRUE, ncol = 6)
#'
#' #plot number of missed cleavages per experiment
#' MQ_evidence_missed_clevages(filtered_evidence_output, per_sample = TRUE, ncol = 6)
#'
#' @export

MQ_evidence_missed_cleavages <- function(x, per_sample = FALSE, ncol = 5) {
  MC <- ggplot(data = x, aes(x = Missed.cleavages))
  MC <- MC + geom_bar()
  MC <- MC + theme_bw()
  MC <- MC + xlab("Missed Cleavages")
  MC <- MC + ylab("Number of peptides with missed cleavages")
  MC <- MC + ggtitle("Number of missed cleavages per sample")
  if (per_sample == TRUE) {
    MC <- MC + facet_wrap(~ Experiment, ncol = ncol)
  }
  print(MC)
}

