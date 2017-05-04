#' Plot peptide retention time distribution using MaxQuant output
#'
#' @description Uses the output from MaxQuant (evidence.txt) to plot retention time distribution for all the peptides
#' of the individual experiments.
#'
#' @returns Returns a density plot.
#'
#' @param x The filtered 'evidence.txt' file. Use MQ_remove_CR first to remove contaminants and reverse hits.
#' @param xlim Numeric vector containing two elements defining the min and max limits of the x axis. Default value is xlim = c(0, 3).
#'
#' @example
#' MQ_evidence_RT(filtered_evidence_output)
#'
#' @export

MQ_evidence_RT_length <- function(x, xlim = c(0, 3)) {
  rt.length <- ggplot2::ggplot(data = x, aes(x = Retention.length, color = Experiment))
  rt.length <- rt.length + geom_density()
  rt.length <- rt.length + theme_bw()
  rt.length <- rt.length + xlab("RT length")
  rt.length <- rt.length + ylab("Frequency")
  rt.length <- rt.length + ggtitle("Retention time length per sample")
  rt.length <- rt.length + xlim(length = xlim)
  rt.length <- rt.length + theme(legend.position = "bottom")
  rt.length <- rt.length + theme(legend.key.size = unit(0.2, "cm"))
  rt.length <- rt.length + theme(legend.text = element_text(size = 8))
  print(rt.length)
}

