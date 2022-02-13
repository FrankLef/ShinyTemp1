# ShinyTemp1

Shiny template 1

## Description

This package relies heavily on the `golem` way of building a shiny app. A few
things are different. There are documented in the setup section below.

A shiny template used mainly as an example on how to use modules and submodules
together.

The pattern is actually typical of my usage of `shiny`
* Run a simulation of or load data.
* Do some analysis.
* Create tables with `gt`.
* Create plots with `plotly`.

## Create the package

1. Create repo on github *only with the readme file*.
2. Create git with RStudio
3. Create golem project with RStudio and accept override.
4. Update `.gitignore` with https://github.com/ThinkR-open/golem/blob/master/.gitignore
because the `.gitignore` from step 2 above is not as complete.

## Setup

Don't forget to do these setup steps 

1. Update `\dev\01_start.R` and run it.
2. Run `renv::init()` to initialize a new project-local environment.
3. Run `usethis::use_package_doc()`, see help for details on this useful tool.
4. Run `usethis::use_test( "app" )` to set up the testing tools with a dummy test.
