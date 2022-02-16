#' debug UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_debug_ui <- function(id){
  ns <- NS(id)
  tagList(
    verbatimTextOutput(ns("specs"))
 
  )
}
    
#' debug Server Functions
#'
#' @noRd 
mod_debug_server <- function(id, sim_specs){
  stopifnot(is.reactive(sim_specs))
  moduleServer( id, function(input, output, session){
    ns <- session$ns
    # output$specs <- renderPrint({sim_specs})
    output$specs <- renderPrint({
      print(sim_specs())
      })
  })
}
    
## To be copied in the UI
# mod_debug_ui("debug_ui_1")
    
## To be copied in the server
# mod_debug_server("debug_ui_1")
