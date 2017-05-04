#' Plot run retention time distribution using MaxQuant output
#'
#' @description Uses the output from MaxQuant (evidence.txt) to plot retention time distribution for the individual experiments.
#'
#' @returns Returns a density plot.
#'
#' @param x The filtered 'evidence.txt' file. Use MQ_remove_CR first to remove contaminants and reverse hits.
#' @param xlim Numeric vector containing two elements defining the min and max limits of the x axis. Default value is xlim = c(0, 60).
#'
#' @example
#' MQ_evidence_RT(filtered_evidence_output)
#'
#' @export

MQ_evidence_RT <- function(x, xlim = c(0, 60)) {
  rt <- ggplot2::ggplot(data = x, aes(x = Retention.time, color = Experiment))
  rt <- rt + geom_density()
  rt <- rt + theme_bw()
  rt <- rt + xlab("RT")
  rt <- rt + ylab("Frequency")
  rt <- rt + xlim(limits = xlim)
  rt <- rt + ggtitle("Retention time per sample")
  rt <- rt + theme(legend.position = "bottom")
  rt <- rt + theme(legend.key.size = unit(0.2, "cm"))
  rt <- rt + theme(legend.text = element_text(size = 8))
  print(rt)
}

