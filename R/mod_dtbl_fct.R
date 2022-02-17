#' Foramt data table
#'
#' @param data Dataframe.
#' 
#' @importFrom dplyr across mutate_if
#'
#' @return Formatted dataframe.
#' @export
create_dtbl <- function(data) {
  # NOTE: cannot use cross(where) inside package
  # https://github.com/r-lib/tidyselect/issues/201#issuecomment-650547846
  # must use mutate_if
  data %>%
    mutate_if(is.numeric, round, digits = 3)
}
