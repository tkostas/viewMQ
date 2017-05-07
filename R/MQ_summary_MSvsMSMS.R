#' View number of MS1 and MS2 spectra per sample from summary.txt file
#'
#' @description Make a side-by-side barplot with the number of MS1 and the
#' number of MS2 scans per sample.
#'
#' @return A barplot
#'
#' @param x The summary.txt file from MaxQuant output.
#'
#' @example
#' MQ_summary_MSvsMSMS(data)
#'
#' @export

MQ_summary_MSvsMSMS <- function(x){
    temp_data <- dplyr::select(x, Experiment, MS, MS.MS)
    long_data <- reshape2::melt(temp_data, id = "Experiment", measured = c("MS", "MS.MS"))

  p <- ggplot2::ggplot(long_data, aes(Experiment, value, fill = variable))
  p <- p + geom_bar(stat = "identity", position = "dodge")
  p <- p + theme_bw()
  p <- p + xlab("Sample")
  p <- p + ylab("Number of spectra")
  p <- p + ggtitle("Number of MS and MS/MS spectra per sample.")
  p <- p + theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust = 1))
  p <- p + theme(legend.position = "bottom")
  p <- p + theme(legend.key.size = unit(0.2, "cm"))
  p <- p + theme(legend.text = element_text(size = 8))
  print(p)
}
