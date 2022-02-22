#' main UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_main_ui <- function(id){
  ns <- NS(id)
  fluidPage(column(6, verbatimTextOutput(ns("specs"))),
            column(6, reactable::reactableOutput(ns("norm")))
            )
}
    
#' main Server Functions
#'
#' @noRd 
mod_main_server <- function(id, sim_specs){
  stopifnot(is.reactive(sim_specs))
  moduleServer( id, function(input, output, session){
    ns <- session$ns
    output$specs <- renderPrint({
      print(sim_specs())
      })
    norm <- reactive(sim_norm(n = sim_specs()$N, meanH = sim_specs()$meanH, seed = 222))
    output$norm <- reactable::renderReactable({
      create_itbl(norm())
      })
    # return the data as a reactive
    norm
  })
}
    
## To be copied in the UI
# mod_main_ui("main_ui_1")
    
## To be copied in the server
# mod_main_server("main_ui_1")
