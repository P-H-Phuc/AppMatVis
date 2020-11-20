#' [--USER INTERFACE--]

#'A dashboard has three parts: a header, a sidebar, and a body.

#' ----------------------------------------------------------------------
#' [Dashboard Body]
#' ----------------------------------------------------------------------

#' Run content tab
  #' Tab Explore distribution
  source('./components/UI_components/content_tab/explore_distribution_tab.R')
  #' Tab Source code
  source('./components/UI_components/content_tab/information_tab.R')
  
#' Body
body <- dashboardBody(

  #' Tab Item Content
  tabItems(
    #' Content explore distribution
    explore_distribution_tab,
    #' Source code tab
    source_code_tab
  )
)
