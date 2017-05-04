#' Plot peptide intensity distrubition using MaxQuant output
#'
#' @description Uses the output from MaxQuant (evidence.txt) to create a density plot of
#' peptide resolution distribution for the individual experiments.
#'
#' @returns Returns a density plot.
#'
#' @param x The filtered 'evidence.txt' file. Use MQ_remove_CR first to remove contaminants and reverse hits.
#'
#' @example
#' MQ_evidence_pept_int(filtered_evidence_output)
#'
#' @export

MQ_evidence_pept_int <- function(x) {
    pept.int <- ggplot2::ggplot(data = x, aes(x = Intensity, color = Experiment))
    pept.int <- pept.int + geom_density()
    pept.int <- pept.int + theme_bw()
    pept.int <- pept.int + scale_x_log10()
    pept.int <- pept.int + xlab("Peptide Intensity")
    pept.int <- pept.int + ylab("Frequency")
    pept.int <- pept.int + ggtitle("Peptide intensity distribution per sample")
    pept.int <- pept.int + theme(legend.position = "bottom")
    pept.int <- pept.int + theme(legend.key.size = unit(0.2, "cm"))
    pept.int <- pept.int + theme(legend.text = element_text(size = 8))
    print(pept.int)
}

