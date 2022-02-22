#' The application server-side
#' 
#' @param input,output,session Internal parameters for {shiny}. 
#'     DO NOT REMOVE.
#' @import shiny
#' @noRd
app_server <- function( input, output, session ) {
  # Your application server logic
  sim <- list()
  sim$specs <- mod_sidebar_server("sidebar_ui_1")
  sim$norm <- mod_main_server("main_ui_1", sim$specs)
  mod_dag_server("dag_ui_1")
  mod_tbl_server("tbl_ui_1", sim_specs = sim$specs)
  mod_plot_server("plot_ui_1", sim_specs = sim$specs, sim_norm = sim$norm)
  mod_itbl_server("itbl_ui_1", sim_specs = sim$specs)
}
