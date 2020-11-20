#' [--USER INTERFACE--]

#'A dashboard has three parts: a header, a sidebar, and a body.

#' ------------------------------------------------------------------------
#  [Dashboard Header] ====
#' ------------------------------------------------------------------------

header <-  dashboardHeader(
  #' title name
  title = "Mathematical Visualization",
  
  #' width title
  titleWidth = 350,
  
  #' add time current
  tags$li(class = "dropdown",
          tags$p("Time now: ", textOutput("current_time", container = span),
                    style = "color: white; font-size: 18px;
                 padding-top: 10px; padding-right: 15px"))
  )


















