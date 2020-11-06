#' [--USER INTERFACE--]

#'A dashboard has three parts: a header, a sidebar, and a body.

#' ------------------------------------------------------------------------
#  [Dashboard Header] ====
#' ------------------------------------------------------------------------

dashboard_header <-  dashboardHeader(
  #' theme for app `run css.R`
  tags$head(source('~/projectR/ApplicationForBayesStat/www/theme/css.R')), 
  #' title name
  title = "Introduction Bayesian Statistic",
  
  #' width title
  titleWidth = "30%",
  
  #' add time current
  tags$li(class = "dropdown",
          tags$p(h4("Time: ", textOutput("current_time", container = span),
                    style = "color: white; font-size: 22px")))
  )


















