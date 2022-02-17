#' Create an interactive table
#'
#' @param data Dataframe.
#' 
#' @importFrom dplyr across mutate_if
#' @importFrom reactable reactable
#'
#' @return Formatted \code{reactable} object.
#' @export
create_itbl <- function(data) {
  # NOTE: cannot use cross(where) inside package
  # https://github.com/r-lib/tidyselect/issues/201#issuecomment-650547846
  # must use mutate_if
  df <- data %>%
    mutate_if(is.numeric, round, digits = 3)
  reactable::reactable(df)
}
