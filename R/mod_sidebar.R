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
  subtitle_msg <- paste0("Simulate a spurious association in 2 ways,", "<br>", 
                         "with binomial and normal distributions.")
  sidebarPanel(
    selectInput(ns("scenario"), "Scenario", choices = the_scenarios,
                selected = the_scenarios[1]),
    textInput(ns("title"), "Title", value = "Spurious Association"),
    textAreaInput(ns("subtitle"), "Subtitle", value = subtitle_msg),
    br(),
    numericInput(ns("N"), "Sample Size", value = 1000, min = 100, max = 10000,
                 step = 100),
    sliderInput(ns("probH"), "History's Probability", value = 0.4, 
                min = 0, max = 1, step = 0.05),
    sliderInput(ns("meanH"), "History's Mean", value = 0.4, 
                min = 0, max = 1, step = 0.05),
    br(),
    actionButton(ns("simulate"), "Simulate", width = "100%",
                 icon = icon(name = "play", lib = "font-awesome")),
    br(),
    actionButton(ns("reset"), "Reset", width = "100%",
                 icon = icon(name = "undo-alt", lib = "font-awesome")),
    width = 2)
}
    
#' sidebar Server Functions
#'
#' @noRd 
mod_sidebar_server <- function(id){
  moduleServer( id, function(input, output, session){
    ns <- session$ns
    observeEvent(input$reset, {
      updateNumericInput(session, inputId = "N", value = 1000)
      updateSliderInput(session, inputId = "probH", value = 0.4)
      updateSliderInput(session, inputId = "meanH", value = 0.4)
    })
    eventReactive(input$simulate, {
      list(
        "btn" = reactive(input$simulate),
        "N" = input$N,
        "probH" = input$probH,
        "meanH" = input$meanH)
    })
  })
}
    
## To be copied in the UI
# mod_sidebar_ui("sidebar_ui_1")
    
## To be copied in the server
# mod_sidebar_server("sidebar_ui_1")
