#' Remove reverse hits and contaminants from MaxQuant output files
#'
#' @description Removes reverse hits and contamintants from the MaxQuant output files.
#'
#' @return Returns a filtered dataframe similar to the imput.
#' @param data Input dataframe.
#' @example
#' filtered_data <- MQ_remove_CR(raw_data)
#'
#' @export
#'
MQ_remove_CR <- function(data) {
  data.rev <- subset(data, subset = (Reverse != "+"))
  rev.number <- dim(data)[1] - dim(data.rev)[1]
  print(paste("Number of reverse peptide sequences:", rev.number))
  print(paste("Total peptide hits:", dim(data)[1]))
  print(paste("Percentage of reverse hits:", round(rev.number/dim(data)[1]*100, digits = 2), "%"))

  trimmed.data <- subset(data.rev, subset = (Potential.contaminant != "+"))
  con.number <- dim(data.rev)[1] - dim(trimmed.data)[1]
  print(paste("Number of possible peptide contaminant hits:", con.number))
  print(paste("Total contaminant peptide hits:", dim(data.rev)[1]))
  print(paste("Percentage of contaminants hits:", round(con.number/dim(data.rev)[1]*100, digits = 2), "%"))

  return(trimmed.data)
}

