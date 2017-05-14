#' Remove proteins indentified only by modified peptides from MaxQuant output files
#'
#' @description Removes proteins identified only by modified peptides (Only by site)
#' from the MaxQuant output files.
#'
#' @return Returns a filtered dataframe similar to the imput.
#' @param x Input dataframe.
#' @examples
#' filtered_data <- MQ_remove_bysite(raw_data)
#'
#' @export
#'
MQ_remove_bysite <- function(x) {
  filtered_data <- subset(x, subset = (Only.identified.by.site != "+"))
  difference <- dim(x)[1] - dim(filtered_data)[1]
  print(paste("Number of peptides identified only by site:", difference))
  print(paste("Total number of entries:", dim(x)[1]))
  print(paste("Percentage of hits:", round(difference/dim(x)[1]*100, digits = 2), "%"))

  return(filtered_data)
}

