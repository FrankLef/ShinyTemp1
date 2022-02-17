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
  tagList(
    verbatimTextOutput(ns("specs"))
 
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
    eventReactive(input$simulate, {
      binom <- sim_binom(n = sim_specs()$N, probH = sim_specs()$probH, seed = 222)
      norm <- sim_norm(n = sim_specs()$N, probH = sim_specs()$meanH, seed = 222)
      list("binom" = binom, "norm" = norm)
    })
  })
}
    
## To be copied in the UI
# mod_main_ui("main_ui_1")
    
## To be copied in the server
# mod_main_server("main_ui_1")
