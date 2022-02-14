#' Create a table using the \code{gt} package
#'
#' @param data Dataframe
#' @param title String. Title for the table.
#' @param subtitle String. Subtitle for the table.
#'
#' @return Formatted \code{gt_tbl} object
#' @export
create_tbl <-  function(data, title = "Title", subtitle = "Subtitle") {
  
  gt_probs(data, title = title, subtitle = subtitle)
}


#' Create table of probabilities with \code{gt} package
#' 
#' Create table of probabilities with \code{gt} package.
#' 
#' Create table of probabilities with \code{gt} package. The last column
#' repesents the probabilitis.
#'
#' @param df Dataframe
#' @param digits Integer, number of digits to the right of decimal
#' @param title Title of the table
#' @param subtitle Subtitle of the table
#' 
#' @import gt
#'
#' @return A gt object create by the \code{gt} package
#' @export
gt_probs <- function(df, digits = 3, title, subtitle) {
  df %>%
    gt::gt() %>%
    gt::tab_header(
      title = gt::html(paste0("<strong>", title, "</strong>")),
      subtitle = gt::html(paste0("<strong>", subtitle, "</strong>"))) %>%
    gt::fmt_number(columns = "prob", decimals = digits) %>%
    gt::cols_align(align = "center", columns = everything()) %>% 
    gt::opt_row_striping() %>%
    gt::tab_source_note(
      source_note = "Fundamentals of Causal Inference, Babette A. Brumback, 2022"
    ) %>%
    gt::tab_options(
      heading.background.color = "gainsboro",
      column_labels.font.weight = "bold")
}
