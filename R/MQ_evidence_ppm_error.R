#' Plot ppm error distribution using MaxQuant output
#'
#' @description Uses the output from MaxQuant (evidence.txt) to plot ppm error distribution for the identified peptides.
#'
#' @returns Returns a density plot.
#'
#' @param x The filtered 'evidence.txt' file. Use MQ_remove_CR first to remove contaminants and reverse hits.
#'
#' @example
#' MQ_evidence_ppm_error(filtered_evidence_output)
#'
#' @export

MQ_evidence_ppm_error <- function(x) {
  er.ppm <- ggplot(data = x, aes(x = Mass.Error..ppm., color = Experiment))
  er.ppm <- er.ppm + geom_density()
  er.ppm <- er.ppm + theme_bw()
  er.ppm <- er.ppm + xlab("Mass ppm error")
  er.ppm <- er.ppm + ylab("Frequency")
  er.ppm <- er.ppm + ggtitle("ppm error per sample")
  er.ppm <- er.ppm + theme(legend.position = "bottom")
  er.ppm <- er.ppm + theme(legend.key.size = unit(0.2, "cm"))
  er.ppm <- er.ppm + theme(legend.text = element_text(size = 8))
  print(er.ppm)
}
