#' Plot a DAG with ggplot and node names with subscripts
#' 
#' Plot a DAG with ggplot and node names with subscripts.
#' 
#' The DAG will be plotted using \code{ggplot2} and the nodes' names can have
#' subscript as in mathematical notations. See the \code{source} below for
#' more details.
#'
#' @param dag A directed acyclic graph from the \code{dagitty} package
#' @param layout String. Name of the layout. Default is "sugiyama".
#' 
#' @importFrom ggdag tidy_dagitty ggdag_status geom_dag_point
#' geom_dag_text
#'
#' @return ggplot object
#' @export
ggp_dag <- function(dag, layout = "sugiyama") {
  
  # the default colors
  bg_colr <- "snow"
  label_colr <- "oldlace"
  text_colr <- "midnightblue"
  status_colrs <- c("latent" = "snow3", "exposure" = "burlywood", 
                    "outcome" = "aquamarine")
  
  # create the dagitty object
  tidy_dagitty(layout = layout) %>%
    ggdag_status(color = status) +
    geom_dag_point(aes(color = status)) +
    geom_dag_text(size = 7, color = text_colr) +
    scale_color_manual(values = status_colrs, na.value = bg_colr,
                       guide = "legend") +
    ggdag::theme_dag_blank(panel.background = 
                             element_rect(fill=bg_colr, color=bg_colr)) +
    theme(legend.position = "bottom",
          legend.title = element_blank())
  }
