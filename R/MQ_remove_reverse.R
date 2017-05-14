#' Remove reverse sequences from MaxQuant output files
#'
#' @description Removes reverse sequences from the MaxQuant output files.
#'
#' @return Returns a filtered dataframe similar to the imput.
#' @param x Input dataframe.
#' @examples
#' filtered_data <- MQ_remove_reverse(raw_data)
#'
#' @export
#'
MQ_remove_reverse <- function(x) {
  filtered_data <- subset(x, subset = (Reverse != "+"))
  difference <- dim(x)[1] - dim(filtered_data)[1]
  print(paste("Number of reverse sequences:", difference))
  print(paste("Total number of entries:", dim(x)[1]))
  print(paste("Percentage of reverse sequences:", round(difference/dim(x)[1]*100, digits = 2), "%"))

  return(filtered_data)
}

