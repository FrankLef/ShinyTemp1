#' Create a plain example of DAG for shiny project
#'
#' @param treatment Coefficient of treatment variable.
#' @param history Coefficient of history variable.
#' @param colrs List of colors.
#' 
#' @importFrom ggdag dagify
#'
#' @return ggplot of DAG
#' @export
create_dag <- function(treatment, history, colrs) {
  dag <- dagify(
    Y ~ `T` + H,
    `T` ~ H,
    exposure = "T",
    latent = "H",
    outcome = "Y")
  ggp_dag(dag)
}
