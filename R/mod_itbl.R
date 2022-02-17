#' itbl UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_itbl_ui <- function(id){
  ns <- NS(id)
  tagList(
    reactable::reactableOutput(ns("itbl"))
  )
}
    
#' itbl Server Functions
#'
#' @noRd 
mod_itbl_server <- function(id, sim_specs){
  stopifnot(is.reactive(sim_specs))
  moduleServer( id, function(input, output, session){
    ns <- session$ns
    output$itbl <- reactable::renderReactable({
      # df <- sim_norm()
      df <- sim_norm(n = sim_specs()$N, meanH = sim_specs()$meanH, seed = 222)
      create_itbl(df)
    })
  })
}
    
## To be copied in the UI
# mod_dtbl_ui("dtbl_ui_1")
    
## To be copied in the server
# mod_dtbl_server("dtbl_ui_1")
