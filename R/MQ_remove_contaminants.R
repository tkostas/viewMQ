#' Remove contaminants from MaxQuant output files
#'
#' @description Removes contamintants from the MaxQuant output files.
#'
#' @return Returns a filtered dataframe similar to the imput.
#' @param x Input dataframe.
#' @examples
#' filtered_data <- MQ_remove_contaminants(raw_data)
#'
#' @export
#'
MQ_remove_contaminants <- function(x) {
  filtered_data <- subset(x, subset = (Potential.contaminant != "+"))
  difference <- dim(x)[1] - dim(filtered_data)[1]
  print(paste("Number of contaminant sequences:", difference))
  print(paste("Total number of entries:", dim(x)[1]))
  print(paste("Percentage of contaminants:", round(difference/dim(x)[1]*100, digits = 2), "%"))

  return(filtered_data)
}

