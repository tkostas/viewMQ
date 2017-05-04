#' Plot Andromeda score distribution using MaxQuant output
#'
#' @description Uses the output from MaxQuant (evidence.txt) to plot Andromeda score distribution for the identified experiments.
#'
#' @return Returns a density plot.
#'
#' @param x The filtered 'evidence.txt' file. Use MQ_remove_CR first to remove contaminants and reverse hits.
#'
#' @example
#' MQ_evidence_Andromeda_score(filtered_evidence_output)
#'
#' @export

MQ_evidence_Andromeda_score <- function(x) {
  A.score <- ggplot2::ggplot(data = x, aes(x = Score, color = Experiment))
  A.score <- A.score + geom_density()
  A.score <- A.score + theme_bw()
  A.score <- A.score + xlab("Andromeda Score")
  A.score <- A.score + ylab("Frequency")
  A.score <- A.score + xlim(levels=c(0, 300))
  A.score <- A.score + ggtitle("Andromeda peptide identification score per sample")
  A.score <- A.score + theme(legend.position = "bottom")
  A.score <- A.score + theme(legend.key.size = unit(0.2, "cm"))
  A.score <- A.score + theme(legend.text = element_text(size = 8))
print(A.score)
}

