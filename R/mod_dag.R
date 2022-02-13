#' dag UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_dag_ui <- function(id){
  ns <- NS(id)
  tagList(
    plotOutput(ns("dag"))
  )
}
    
#' dag Server Functions
#'
#' @noRd 
mod_dag_server <- function(id){
  moduleServer( id, function(input, output, session){
    ns <- session$ns
    output$dag <- renderPlot({
      create_dag()
    })
  })
}
    
## To be copied in the UI
# mod_dag_ui("dag_ui_1")
    
## To be copied in the server
# mod_dag_server("dag_ui_1")
