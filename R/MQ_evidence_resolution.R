#' Plot instrument resolution distribution using MaxQuant output
#'
#' @description Uses the output from MaxQuant (evidence.txt) to plot resolution distribution in the individual experiments.
#'
#' @returns Returns a density plot.
#'
#' @param x The filtered 'evidence.txt' file. Use MQ_remove_CR first to remove contaminants and reverse hits.
#'
#' @example
#' MQ_evidence_pept_int(filtered_evidence_output)
#'
#' @export

MQ_evidence_resolution <- function(x) {
  pept.res <- ggplot2::ggplot(data = x, aes(x = Resolution, color = Experiment))
  pept.res <- pept.res + geom_density()
  pept.res <- pept.res + theme_bw()
  pept.res <- pept.res + xlab("Resolution")
  pept.res <- pept.res + ylab("Frequency")
  pept.res <- pept.res + xlim(levels=c(0,80000))
  pept.res <- pept.res + ggtitle("Resolution per sample")
  pept.res <- pept.res + theme(legend.position = "bottom")
  pept.res <- pept.res + theme(legend.key.size = unit(0.2, "cm"))
  pept.res <- pept.res + theme(legend.text = element_text(size = 8))
  print(pept.res)
}

