#' View names of the different experiments
#' @description Prints a list of the different experiment names
#'
#' @param x A dataframe.
#'
#' @examples
#' experiments(my_data)
#'
#' @export
experiments <- function(x) {
  elements <- as.character(unique(x[["Experiment"]]))
  n_obs <- length(elements)
  print(paste(n_obs, "'Experiments' are identified"))
  for (i in seq_along(elements)) {
    print(elements[i])
  }
}
