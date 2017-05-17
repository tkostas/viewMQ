#'Percent of isotopic patterns sequenced (z > 1) (read from MaxQuant summary.txt)
#'
#'@description Reads MaxQuant summary.txt output file and plots the Percent of
#'    isotopic patterns sequenced (z > 1). Use the `add_groups` function first to add groups based
#'    on the experiment name, and color the different raw files based on the groups.
#'
#'@param x The processed summary.txt output file
#'@param grouping Default value is FALSE. If set to true, the different experiments
#'    will be colored based on the `my_groups` column. Use \code{\link{add_groups}} function
#'    to define the groups based on experiment names.
#'
#'@export
MQ_summary_isopatterns_seq_percent <- function(x, grouping = FALSE){
  if (grouping == TRUE) {
    p <- ggplot(x, aes(Experiment, Isotope.Patterns.Sequenced..z.1..... , fill = my_groups))
  } else {
    p <- ggplot(x, aes(Experiment, Isotope.Patterns.Sequenced..z.1.....))
  }
  p <- p + geom_bar(stat = "identity", position = "dodge")
  p <- p + geom_text(aes(label = Isotope.Patterns.Sequenced..z.1.....), vjust = -0.25)
  p <- p + theme_bw()
  p <- p + xlab("Sample")
  p <- p + ylab("Percent of isotopic patterns sequenced (z > 1)")
  p <- p + ylim(limits = c(0, 100))
  p <- p + ggtitle("Percent of isotopic patterns sequenced per experiment (z > 1)")
  p <- p + theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust = 1))
  p <- p + theme(legend.position = "bottom")
  p <- p + theme(legend.key.size = unit(0.2, "cm"))
  p <- p + theme(legend.text = element_text(size = 8))
  print(p)
}
