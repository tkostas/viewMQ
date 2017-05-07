#'Percent of MSMS spectra identified using MaxQuant summary output
#'
#'@description Reads MaxQuant summary.txt output file and plots the percentage
#'    of spectra matched to peptides. Use the `add_groups` function first to add groups
#'    based on the experiment name, and color the different raw files based on the groups.
#'
#'@param x The processed summary.txt output file
#'@param grouping Default value is FALSE. If set to true, the different experiments
#'    will be colored based on the `my_groups` column. Use \code{\link{add_groups}} function
#'    to define the groups based on experiment names.
#'
#'@export
MQ_summary_MSMSid_percent <- function(x, grouping = FALSE){
  if (grouping == TRUE) {
    p <- ggplot(x, aes(Experiment, MS.MS.Identified.... , fill = my_groups))
  } else {
    p <- ggplot(x, aes(Experiment, MS.MS.Identified....))
  }
  p <- p + geom_bar(stat = "identity", position = "dodge")
  p <- p + theme_bw()
  p <- p + xlab("Sample")
  p <- p + ylab("Percent of Spectra identified (%)")
  p <- p + ggtitle("Percent of MS/MS spectra identified per experiment.")
  p <- p + theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust = 1))
  p <- p + theme(legend.position = "bottom")
  p <- p + theme(legend.key.size = unit(0.2, "cm"))
  p <- p + theme(legend.text = element_text(size = 8))
  print(p)
}
