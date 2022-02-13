# ShinyTemp1

Shiny template 1

## Description

This package relies heavily on the `golem` way of building a shiny app. A few
things are different. There are documented in the setup section below.

A shiny template used mainly as an example on how to use modules and submodules
together.

The pattern is actually typical of my usage of `shiny`
1. Run a simulation of or load data
2. Do some analysis
3. Present the results in a table with `gt`
4. Present the results in a plot with `plotly`

## Create the package

1. Create repo on github *only with the readme file*
2. Create git with RStudio then create with golem and accept override

## Setup

The steps are required for the 

1. Update `\dev\01_start.R` and run it
2. Run `renv::init()` to initialize a new project-local environment.
3. Run `usethis::use_package_doc()` to create a dummy .R file prompting
`roxygen`. See the help for more details.
4. Run `usethis::use_test( "app" )` to set up the testing tools.
