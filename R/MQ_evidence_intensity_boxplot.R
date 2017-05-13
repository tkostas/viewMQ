#' Plot peptide intensities for individual experiments using boxplots
#'
#' @description Make boxplots for peptide intensity for the individual experiments. Optionally
#' you can color them by their group_id (see color_groups argument)
#'
#' @return Boxplots of log10 peptidide intensity.
#'
#' @param x The evidence.txt file from MaxQuant output.
#' @param color_groups Logical. If set to TRUE, colors will be assigned to the boxplots based on the
#' my_groups column. Use add_groups function first to create the \code{\link{add_groups}} column. Default
#' value is FALSE, which will give boxplots with the same color.
#'
#' @example
#' MQ_evidence_intensity_boxplot(data, color_groups = TRUE)
#'
#' @export

MQ_evidence_intensity_boxplot <- function(x, color_groups = FALSE) {
  if (color_groups == TRUE) {
    if (!("my_groups" %in% names(x))) {
      stop("Use 'add_groups' function first to assign groups based on the 'Experiment' name.", .call = FALSE)
    }
    print("Experiments will be colored based on the defined groups.")
    p <- ggplot2::ggplot(x, aes(x = Experiment, y = log(Intensity, 10), fill = my_groups))

  } else {
    p <- ggplot2::ggplot(x, aes(x = Experiment, y = log(Intensity, 10)))
  }
  p <- p + geom_boxplot()
  p <- p + theme_bw()
  p <- p + xlab("Sample")
  p <- p + ylim(limits = c(0, NA))
  p <- p + ylab("Log10 peptide intensity")
  p <- p + ggtitle("Peptide intensity distribution per Experiment.")
  p <- p + theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust = 1))
  p <- p + theme(legend.position = "bottom")
  p <- p + theme(legend.key.size = unit(0.2, "cm"))
  p <- p + theme(legend.text = element_text(size = 8))
  print(p)
}
