#' sidebar UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_sidebar_ui <- function(id){
  ns <- NS(id)
  the_scenarios <- list("Spurious Association" = "Spurious", 
                        "Multicollinearity" = "Multicollinear", 
                        "Post-treatment bias" = "PostTreatment", 
                        "Collider bias" = "Collider")
  tagList(
    selectInput("scenario", "Scenario", choices = the_scenarios,
                selected = the_scenarios[1]),
    numericInput("N", "Sample Size", value = 100, min = 1, max = 1000),
    sliderInput("treatment", "Treatment", value = 1, 
                min = 1, max = 10, step = 1),
    sliderInput("history", "History", value = 1, 
                min = 1, max = 10, step = 1),
    actionButton("sim", "Simulate", width = "100%",
                 icon = icon(name = "play", lib = "font-awesome")),
    br(),
    actionButton("reset", "Reset", width = "100%",
                 icon = icon(name = "undo-alt", lib = "font-awesome"))
    )
}
    
#' sidebar Server Functions
#'
#' @noRd 
mod_sidebar_server <- function(id){
  moduleServer( id, function(input, output, session){
    ns <- session$ns
 
  })
}
    
## To be copied in the UI
# mod_sidebar_ui("sidebar_ui_1")
    
## To be copied in the server
# mod_sidebar_server("sidebar_ui_1")
