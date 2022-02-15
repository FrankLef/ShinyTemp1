#' dtbl UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_dtbl_ui <- function(id){
  ns <- NS(id)
  tagList(
    dataTableOutput(ns("dtbl"))
  )
}
    
#' dtbl Server Functions
#'
#' @noRd 
mod_dtbl_server <- function(id){
  moduleServer( id, function(input, output, session){
    ns <- session$ns
    output$dtbl <- renderDataTable({
      df <- sim_norm()
      mod_tbl_fnc(df)
    })
  })
}
    
## To be copied in the UI
# mod_dtbl_ui("dtbl_ui_1")
    
## To be copied in the server
# mod_dtbl_server("dtbl_ui_1")
