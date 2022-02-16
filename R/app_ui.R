#' The application User-Interface
#' 
#' @param request Internal parameter for `{shiny}`. 
#'     DO NOT REMOVE.
#' @import shiny
#' @noRd
app_ui <- function(request) {
  tagList(
    # Leave this function for adding external resources
    golem_add_external_resources(),
    # Your application UI logic 
    fluidPage(
      titlePanel("Shiny template 1"),
      sidebarLayout(
       mod_sidebar_ui("sidebar_ui_1"),
       mainPanel(
         tabsetPanel(
           id = "tabset",
           tabPanel("Normal",
                    fluidPage(
                      column(6, mod_plot_ui("plot_ui_1")),
                      column(6, mod_dtbl_ui("dtbl_ui_1"))
                      )
                    ),
           tabPanel("Binomial",
                    fluidPage(
                      column(6, mod_dag_ui("dag_ui_1")),
                      column(6, mod_tbl_ui("tbl_ui_1"))
                      )
                    ),
           tabPanel("debug",
                    fluidPage(
                      column(6, mod_debug_ui("debug_ui_1"))
                    ))
           ),
         width = 10
       )
      )
    )
  )
}

#' Add external Resources to the Application
#' 
#' This function is internally used to add external 
#' resources inside the Shiny application. 
#' 
#' @import shiny
#' @importFrom golem add_resource_path activate_js favicon bundle_resources
#' @noRd
golem_add_external_resources <- function(){
  
  add_resource_path(
    'www', app_sys('app/www')
  )
 
  tags$head(
    favicon(),
    bundle_resources(
      path = app_sys('app/www'),
      app_title = 'ShinyTemp1'
    )
    # Add here other external resources
    # for example, you can add shinyalert::useShinyalert() 
  )
}

