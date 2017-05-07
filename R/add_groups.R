#' Add groups based on experiment name.
#'
#'@description Add group identifies based on strings included in the Experiments name.
#'
#'@returns Returns a dataframe.
#'
#'@param x A dataframe containing a column named Experiments, based on which you will define the groups.
#'@param group_ids List containing group name as name of the list element, and an identifier unique for this group as list element.
#'
#'@examples
#'# first define the group_ids list
#'group_ids <- list(GroupA = "group_A",
#'                  GroupB = "group_B")
#'# 2nd assign different experiments into groups. Output is saved in the 'my_groups' column
#'data2 <- add_groups(data, group_ids)
#'
#'@export

add_groups <- function(x, group_ids = list(All_samples = "All samples")) {
  i <- 1
  my_groups <- vector(length = nrow(x))
  for (i in 1:length(group_ids)) {
    print(paste("Searching for group", names(group_ids[i])))
    group_pattern <- group_ids[[i]]
    indexes <- grep(group_pattern, x = x[,"Experiment"])
    my_groups[indexes] <- names(group_ids[i])
    i <- i + 1
  }
  output <- cbind(x, my_groups = my_groups)
  print("Ok, done!")
  return(output)
}
