#' Peptide modifications distribution using MaxQuant output
#'
#' @description Uses the output from MaxQuant (evidence.txt) to create a bargraph of
#' peptide modifications as a total or splitted by experiment.
#'
#' @returns Returns a barplot.
#'
#' @param x The filtered 'evidence.txt' file. Use MQ_remove_CR first to remove contaminants and reverse hits.
#' @param per_sample Logical with default value equal to FALSE. By default a summary from all experiments will
#'  be plotted. If set to TRUE, individual experiments will be shown in different graphs.
#' @param ncol Number of columns when plotting individual experiments. Default value is 5.
#' @param log_scale Logical with default value equal to TRUE. By default, the y axis is in log10 scale. Set
#' to FALSE to switch to normal scale.
#'
#' @examples
#' # plot charge state as a total
#' MQ_evidence_modifications(filtered_evidence_output, per_sample = TRUE, ncol = 6)
#'
#' #plot charge state per experiment
#' MQ_evidence_modifications(filtered_evidence_output, per_sample = TRUE, ncol = 6)
#'
#' @export

MQ_evidence_modifications <- function(x, per_sample = FALSE, ncol = 5, log_scale = TRUE) {
  p <- ggplot(data = x, aes(x = Modifications))
  p <- p + geom_bar()
  p <- p + theme_bw()
  p <- p + xlab("Type of modification")
  p <- p + ylab("Number of peptides modified
       (log10 scale)")
  if (log_scale == TRUE) {
    p <- p + scale_y_log10()
  }
  p <- p + ggtitle("Peptide modifications")
  p <- p + theme(axis.text.x=element_text(angle=45, hjust=1, vjust=1, size=8))
  if (per_sample == TRUE) {
    p <- p + facet_wrap(~ Experiment, ncol = ncol)
  }
  print(p)
}

