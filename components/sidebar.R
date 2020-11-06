#' [--USER INTERFACE--]

#'A dashboard has three parts: a header, a sidebar, and a body.

#' ------------------------------------------------------------------------
#' [Dashboard Sidebar]
#' ------------------------------------------------------------------------

dashboard_sidebar <- dashboardSidebar(
  #' Width sidebar
  width = 300,
  #' Sidebar content
  sidebarMenu(
    #' Tab 1
    menuItem(text = strong("Explore distribution", style = "color: white"), 
             tabName = "explore_distribution", icon = icon(name = "snowflake")), 
    #' Tab 2
    menuItem(text = strong("Source code", style = "color: white"), 
             tabName = "source_code", icon = icon("code"))
  )
)
