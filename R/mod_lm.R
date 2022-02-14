#' lm UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_lm_ui <- function(id){
  ns <- NS(id)
  tagList(
 
  )
}
    
#' lm Server Functions
#'
#' @noRd 
mod_lm_server <- function(id){
  moduleServer( id, function(input, output, session){
    ns <- session$ns
 
  })
}
    
## To be copied in the UI
# mod_lm_ui("lm_ui_1")
    
## To be copied in the server
# mod_lm_server("lm_ui_1")
