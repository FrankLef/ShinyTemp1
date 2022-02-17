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
    gt::gt_output(outputId = ns("tbl"))
  )
}
    
#' tbl Server Functions
#'
#' @noRd 
mod_tbl_server <- function(id, sim_specs){
  stopifnot(is.reactive(sim_specs))
  moduleServer( id, function(input, output, session){
    ns <- session$ns
    output$tbl <- gt::render_gt({
      # df <- sim_binom()
      df <- sim_binom(n = sim_specs()$N, probH = sim_specs()$probH, seed = 222)
      create_tbl(df)
    })
  })
}
    
## To be copied in the UI
# mod_tbl_ui("tbl_ui_1")
    
## To be copied in the server
# mod_tbl_server("tbl_ui_1")
