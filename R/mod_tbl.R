#' tbl UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_tbl_ui <- function(id){
  ns <- NS(id)
  tagList(
 
  )
}
    
#' tbl Server Functions
#'
#' @noRd 
mod_tbl_server <- function(id){
  moduleServer( id, function(input, output, session){
    ns <- session$ns
 
  })
}
    
## To be copied in the UI
# mod_tbl_ui("tbl_ui_1")
    
## To be copied in the server
# mod_tbl_server("tbl_ui_1")
