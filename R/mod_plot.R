#' plot UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_plot_ui <- function(id){
  ns <- NS(id)
  tagList(
    plotlyOutput(ns("ply"))
  )
}
    
#' plot Server Functions
#'
#' @noRd 
mod_plot_server <- function(id, sim_specs){
  stopifnot(is.reactive(sim_specs))
  moduleServer( id, function(input, output, session){
    ns <- session$ns
    output$ply <- renderPlotly({
      # df <- sim_norm()
      df <- sim_norm(n = sim_specs()$N, meanH = sim_specs()$probH, seed = 222)
      ply_norm(df)
    })
  })
}
    
## To be copied in the UI
# mod_plot_ui("plot_ui_1")
    
## To be copied in the server
# mod_plot_server("plot_ui_1")
