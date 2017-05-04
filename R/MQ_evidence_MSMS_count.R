#' Plot MS/MS count distribution using MaxQuant output
#'
#' @description Uses the output from MaxQuant (evidence.txt) to plot MS/MS count distribution for the identified experiments.
#'
#' @returns Returns a density plot.
#'
#' @param x The filtered 'evidence.txt' file. Use MQ_remove_CR first to remove contaminants and reverse hits.
#'
#' @example
#' MQ_evidence_MSMS_count(filtered_evidence_output)
#'
#' @export

MQ_evidence_MSMS_count <- function(x) {
  MS.MS <- ggplot2::ggplot(data = x, aes(x = MS.MS.Count, color = Experiment))
  MS.MS <- MS.MS + geom_density()
  MS.MS <- MS.MS + theme_bw()
  MS.MS <- MS.MS + scale_x_log10()
  MS.MS <- MS.MS + xlab("MS/MS Count")
  MS.MS <- MS.MS + ylab("Frequency")
  MS.MS <- MS.MS + ggtitle("MS/MS count distribution per run")
  MS.MS <- MS.MS + xlim(length=c(0, 10))
  MS.MS <- MS.MS + theme(legend.position = "bottom")
  MS.MS <- MS.MS + theme(legend.key.size = unit(0.2, "cm"))
  MS.MS <- MS.MS + theme(legend.text = element_text(size = 8))
print(MS.MS)
}

