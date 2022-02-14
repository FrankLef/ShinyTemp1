#' Vreate plotly
#'
#' @param data Dataframe from \code{lm}.
#' 
#' @importFrom ggplot2 geom_pointrange position_dodge
#'
#' @return Object of class \code{plotly}.
#' @export
ply_norm <- function(data) {
  # print(data)
  ggp <- data %>%
    dplyr::filter(var != "(Intercept)") %>%
    ggplot(aes(x = Estimate, y = var, 
               xmin = Estimate - 2 * Std..Error,
               xmax = Estimate + 2 * Std..Error, 
               color = model)) +
    geom_pointrange(position = position_dodge(width = 0.5),
                    fatten = 8, size = 2) +
    theme_minimal() +
    theme(legend.position = "bottom",
          legend.title = element_blank()) +
    labs(x = NULL, y = NULL)
  ply <- plotly::ggplotly(ggp)
  ply
}
